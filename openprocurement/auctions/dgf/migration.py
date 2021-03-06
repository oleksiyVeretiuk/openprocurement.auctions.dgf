# -*- coding: utf-8 -*-
import logging
from openprocurement.api.models import get_now, TZ
from openprocurement.api.traversal import Root
from barbecue import chef
from uuid import uuid4


LOGGER = logging.getLogger(__name__)
SCHEMA_VERSION = 1
SCHEMA_DOC = 'openprocurement_auctions_dgf_schema'


def get_db_schema_version(db):
    schema_doc = db.get(SCHEMA_DOC, {"_id": SCHEMA_DOC})
    return schema_doc.get("version", SCHEMA_VERSION - 1)


def set_db_schema_version(db, version):
    schema_doc = db.get(SCHEMA_DOC, {"_id": SCHEMA_DOC})
    schema_doc["version"] = version
    db.save(schema_doc)


def migrate_data(registry, destination=None):
    if registry.settings.get('plugins') and 'auctions.dgf' not in registry.settings['plugins'].split(','): # pragma: no cover
        return
    cur_version = get_db_schema_version(registry.db)
    if cur_version == SCHEMA_VERSION:
        return cur_version
    for step in xrange(cur_version, destination or SCHEMA_VERSION):
        LOGGER.info("Migrate openprocurement auction schema from {} to {}".format(step, step + 1), extra={'MESSAGE_ID': 'migrate_data'})
        migration_func = globals().get('from{}to{}'.format(step, step + 1))
        if migration_func:
            migration_func(registry)
        set_db_schema_version(registry.db, step + 1)


def from0to1(registry):
    class Request(object):
        def __init__(self, registry):
            self.registry = registry

    results = registry.db.iterview('auctions/all', 2 ** 10, include_docs=True)

    request = Request(registry)
    root = Root(request)

    docs = []
    for i in results:
        auction = i.doc
        if auction['procurementMethodType'] not in ['dgfOtherAssets', 'dgfFinancialAssets'] \
                or auction['status'] not in ['active.qualification', 'active.awarded'] \
                or 'awards' not in auction:
            continue

        now = get_now().isoformat()
        awards = auction["awards"]
        award = [a for a in awards if a['status'] in ['active', 'pending']][0]
        award_create_date = award['complaintPeriod']['startDate']
        award.update({
            'verificationPeriod': {
                'startDate': award_create_date,
                'endDate': award_create_date
            },
            'paymentPeriod': {
                'startDate': award_create_date,
            },
            'signingPeriod': {
                'startDate': award_create_date,
            }
        })

        if award['status'] == 'pending':
            award['status'] = 'pending.payment'

        elif award['status'] == 'active':
            award['paymentPeriod']['endDate'] = now

        awarded_bids = set([a['bid_id'] for a in awards])
        sorted_bids = chef(auction['bids'], auction.get('features'), [], True)
        filtered_bids = [bid for bid in sorted_bids if bid['id'] not in awarded_bids]

        for bid in filtered_bids:
            award = {
                'id': uuid4().hex,
                'bid_id': bid['id'],
                'status': 'pending.waiting',
                'date': award_create_date,
                'value': bid['value'],
                'suppliers': bid['tenderers'],
                'complaintPeriod': {
                    'startDate': award_create_date
                }
            }
            awards.append(award)

        model = registry.auction_procurementMethodTypes.get(auction['procurementMethodType'])
        if model:
            try:
                auction = model(auction)
                auction.__parent__ = root
                auction = auction.to_primitive()
            except: # pragma: no cover
                LOGGER.error("Failed migration of auction {} to schema 1.".format(auction.id), extra={'MESSAGE_ID': 'migrate_data_failed', 'AUCTION_ID': auction.id})
            else:
                auction['dateModified'] = get_now().isoformat()
                docs.append(auction)
        if len(docs) >= 2 ** 7: # pragma: no cover
            registry.db.update(docs)
            docs = []
    if docs:
        registry.db.update(docs)