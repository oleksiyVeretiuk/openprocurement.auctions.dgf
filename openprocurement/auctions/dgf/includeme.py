from pyramid.interfaces import IRequest
from openprocurement.auctions.dgf.models import (
    IDgfAuction,
    DGFOtherAssets,
    DGFFinancialAssets
)
from openprocurement.auctions.dgf.adapters import (
    AuctionDGFOtherAssetsConfigurator,
    AuctionDGFFinancialAssetsConfigurator
)
from openprocurement.auctions.core.plugins.awarding.v2_1.adapters import (
    AwardingNextCheckV2_1
)
from openprocurement.api.interfaces import (
    IContentConfigurator,
    IAwardingNextCheck
)
from openprocurement.auctions.dgf.constants import (
    FINANCIAL_VIEW_LOCATIONS,
    OTHER_VIEW_LOCATIONS,
)


def includeme_other(config):
    config.add_auction_procurementMethodType(DGFOtherAssets)

    for view_location in OTHER_VIEW_LOCATIONS:
        config.scan(view_location)

    # Register adapters
    config.registry.registerAdapter(
        AuctionDGFOtherAssetsConfigurator,
        (IDgfAuction, IRequest),
        IContentConfigurator
    )
    config.registry.registerAdapter(
        AwardingNextCheckV2_1,
        (IDgfAuction, ),
        IAwardingNextCheck
    )


def includeme_financial(config):
    config.add_auction_procurementMethodType(DGFFinancialAssets)

    for view_location in FINANCIAL_VIEW_LOCATIONS:
        config.scan(view_location)

    # Register Adapters
    config.registry.registerAdapter(
        AuctionDGFFinancialAssetsConfigurator,
        (IDgfAuction, IRequest),
        IContentConfigurator
    )
    config.registry.registerAdapter(
        AwardingNextCheckV2_1,
        (IDgfAuction, ),
        IAwardingNextCheck
)