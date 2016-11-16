��    L      |      �      �     �      �               6     N  �   e  3   �  2        Q  &   Y  -   �     �  C   �       +        G     `     n  7   �     �  D   �     %     C  2   X  f   �     �     	     /	  $   J	      o	     �	     �	  /   �	  *    
  $   +
  A   P
  "   �
  "   �
  5   �
  ,        ;     B     a  �   ~  D        F  �   b  #   �  $     9   2  8   l  h   �  �     6   �  D   �  ^   1     �  %   �     �  !   �     �          3     E     V  V   Z  G   �  �   �  Q   �  �   �  �   `  U     �   a  ?   �    "     &  -   7     e  -   s  $   �  #   �    �  ?   �  n   0     �  ;   �  R   �  .   6  �   e     �  o     X   x  #   �  :   �  K   0  :   |  �   �  -   ?  (   m  @   �  [   �  .   3  +   b  )   �  3   �  /   �  .     .   K  }   z  H   �  X   A  �   �  ?   d   J   �   c   �   �   S!  
   �!  @   �!  @   ;"  �   |"  z   /#  %   �#  �   �#  <   �$  F   �$     %  e   �%  w   �%  �   f&  J   '  �   e'  �   �'  -   �(  C   �(  
   �(  Y   
)  $   d)  D   �)  *   �)  %   �)     *  �   0*  l   �*  �   !+  v   ,  �   �,  (  f-  �   �.  �   */  \   0   :ref:`Guarantee` :ref:`ProcuringEntity`, required :ref:`period` :ref:`period`, read-only :ref:`period`, required :ref:`value`, required A list of all bids placed in the auction with information about participants, their proposals and other qualification documentation. A web address where auction is accessible for view. All qualifications (disqualifications and awards). Auction Auction announcement. Possible values: Auction number in the Deposit Guarantee Fund. Auction period (auction) Auction starting price. Bids lower than ``value`` will be rejected. Auction status. Auction step (increment). Validation rules: Awarding process period. Bid guarantee Cancelled auction (cancelled) Complaints to auction conditions and their resolutions. Complete auction (complete) Contains 1 object with `active` status in case of cancelled Auction. Detailed auction description. Features of auction. Historical changes to `Auction` object properties. Identification number of the auction (also referred to as `lot`) in the XLS of Deposit Guarantee Fund. List of :ref:`Contract` objects List of :ref:`award` objects List of :ref:`bid` objects List of :ref:`cancellation` objects. List of :ref:`complaint` objects List of :ref:`document` objects List of :ref:`question` objects List of :ref:`revision` objects, auto-generated List that contains single item being sold. Organization conducting the auction. Period when Auction is conducted. `startDate` should be provided. Period when bids can be submitted. Period when questions are allowed. Questions to ``procuringEntity`` and answers to them. Required for `dgfFinancialAssets` procedure. Schema Standstill period (standstill) Tendering period (tendering) The :ref:`cancellation` object describes the reason of auction cancellation and contains accompanying documents  if there are any. The auction identifier to refer auction to in "paper" documentation. This field is multilingual: Ukrainian by default - До участі допускаються лише ліцензовані фінансові установи. Unsuccessful auction (unsuccessful) Winner qualification (qualification) ``dgfFinancialAssets`` - sale of the creditor claim right ``dgfOtherAssets`` - sale of the insolvent bank property ``eligibilityCriteria_en`` (English) - Only licensed financial institutions are eligible to participate. ``eligibilityCriteria_ru`` (Russian) - К участию допускаются только лицензированные финансовые учреждения. `amount` should be greater than `Auction.value.amount` `currency` should either be absent or match `Auction.value.currency` `valueAddedTaxIncluded` should either be absent or match `Auction.value.valueAddedTaxIncluded` list of :ref:`Feature` objects list of :ref:`item` objects, required string string, auto-generated, read-only string, multilingual string, multilingual, read-only string, read-only string, required url |ocdsDescription| A list of all the companies who entered submissions for the auction. |ocdsDescription| All documents and attachments related to the auction. |ocdsDescription| AuctionID should always be the same as the OCID. It is included to make the flattened data structure more convenient. |ocdsDescription| The date or period on which an award is anticipated to be made. |ocdsDescription| The entity managing the procurement, which may be different from the buyer who is paying / using the items being procured. |ocdsDescription| The goods and services to be purchased, broken into line items wherever possible. Items should not be duplicated, but a quantity of 2 specified instead. |ocdsDescription| The period during which enquiries may be made and will be answered. |ocdsDescription| The period when the auction is open for submissions. The end date is the closing date for auction submissions. |ocdsDescription| The total estimated value of the procurement. Project-Id-Version: openprocurement.auctions.dgf 0.1
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2016-09-13 15:36+0300
PO-Revision-Date: 2016-11-16 12:29+0200
Last-Translator: Zoriana Zaiats <sorenabell@quintagroup.com>
Language-Team: Ukrainian <support@quintagroup.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Language: uk
Plural-Forms: nplurals=3; plural=(n%10==1 && n%100!=11 ? 0 : n%10>=2 && n%10<=4 && (n%100<10 || n%100>=20) ? 1 : 2);
X-Generator: Lokalize 2.0
 :ref:`Guarantee` :ref:`ProcuringEntity`, обов'язково :ref:`period` :ref:`period`, лише для читання :ref:`period`, обов'язково :ref:`value`, обов'язково Список усіх пропозицій поданих до аукціону разом із інформацією про учасників аукціону, їхні пропозиції та інша кваліфікаційна документація. Веб-адреса для перегляду аукціону. Всі кваліфікації (дискваліфікації та визначення переможця). Auction Тип процедури. Можливі значення: Номер аукціону у Фонді Гарантування Вкладів. Період аукціону (аукціон) Початкова ціна аукціону. Пропозиції, що нижчі за ``value`` будуть відхилені. Статус аукціону. Крок аукціону та порядок підвищення ціни. Правила валідації: Період, коли відбувається визначення переможця. Гарантійний внесок Відмінений аукціон (відмінений) Скарги на умови аукціону та їх вирішення. Завершений аукціон (завершений) Містить 1 об’єкт зі статусом `active` на випадок, якщо аукціон буде відмінено. Детальний опис аукціону. Властивості аукціону. Зміни властивостей об’єктів `Auction`. Номер аукціону (або `лота`) у XLS Фонду Гарантування. Список об’єктів :ref:`Contract` Список об’єктів :ref:`award` Список об’єктів :ref:`bid` Список об’єктів :ref:`cancellation`. Список об’єктів :ref:`complaint` Список об’єктів :ref:`document` Список об’єктів :ref:`question` Список об’єктів :ref:`revision`, генерується автоматично, лише для читання Список містить елементи, що продаються. Організатор (організація, що проводить аукціон). Період, коли проводиться аукціон. Значення `startDate` (дата проведення аукціону) повинно бути вказано обов'язково. Період, коли подаються пропозиції. Період, коли дозволено задавати питання. Питання до організатора ``procuringEntity`` і відповіді на них. Обов'язково для `dgfFinancialAssets` процедури (продаж права вимоги за кредитними договорами). Схема Пропозиції розглянуто (розглянуто) Очікування пропозицій (пропозиції) Об’єкт :ref:`cancellation` описує причину скасування аукціону та надає відповідні документи, якщо такі є. Ідентифікатор аукціону, щоб знайти його у "паперовій" документації Це поле багатомовне: За замовчуванням українською мовою - До участі допускаються лише ліцензовані фінансові установи. Аукціон не відбувся (не відбувся) Кваліфікація переможця (кваліфікація) ``dgfFinancialAssets`` - оголошення аукціону з продажу прав вимоги за кредитами. ``dgfOtherAssets`` - оголошення аукціону з продажу майна банків. ``eligibilityCriteria_en`` (англійською) - Only licensed financial institutions are eligible to participate. ``eligibilityCriteria_ru`` (російською) - К участию допускаются только лицензированные финансовые учреждения. `amount` повинна бути  більша за `Auction.value.amount` Значення `currency` повинно бути або відсутнім, або співпадати з `Auction.value.currency` Значення `valueAddedTaxIncluded` повинно бути або відсутнім, або співпадати з `Auction.value.valueAddedTaxIncluded` список об’єктів :ref:`Feature` список об’єктів :ref:`item`, обов’язково рядок рядок, генерується автоматично, лише для читання рядок, багатомовний рядок, багатомовний, лише для читання рядок, лише для читання рядок, обов’язковий URL-адреса |ocdsDescription| Список усіх компаній, які подали заявки для участі в аукціоні. |ocdsDescription| Всі документи та додатки пов’язані із аукціоном. |ocdsDescription| Ідентифікатор аукціону `AuctionID` повинен завжди співпадати з OCID. Його включають, щоб зробити структуру даних більш зручною. |ocdsDescription| Дата або період, коли очікується визначення переможця. |ocdsDescription| Об’єкт, що управляє закупівлею. Він не обов’язково є покупцем, який платить / використовує закуплені елементи. |ocdsDescription| Товари та послуги, що будуть закуплені, поділені на спискові елементи, де це можливо. Елементи не повинні дублюватись, замість цього вкажіть кількість 2. |ocdsDescription| Період, коли можна задати питання (уточнення) та отримати відповіді на них. |ocdsDescription| Період, коли аукціон відкритий для подачі пропозицій. Кінцева дата - це дата, коли перестають прийматись пропозиції. |ocdsDescription| Загальна кошторисна вартість закупівлі. 