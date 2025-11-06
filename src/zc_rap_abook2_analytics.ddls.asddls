@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View for ZC_RAP_ABOOK2_ANAL'
@Metadata.allowExtensions: true
@Search.searchable: true
define root view entity ZC_RAP_ABOOK2_ANALYTICS
  as select from ZR_RAP_ABOOK2_ANALYTICS
{
  key BookingUUID,
      TravelUUID,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.9
      BookingID,
      BookingDate,
      BookingDateYear,
      @EndUserText.label: 'Booking Date (Year)'
      CustomerID,
      @EndUserText.label: 'Customer'
      @ObjectModel.text.element: [ 'CustomerName' ]
      CustomerName,
      @EndUserText.label: 'Airline'
      @ObjectModel.text.element: [ 'CarrierName' ]
      CarrierID,
      CarrierName,
      ConnectionID,
      FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      @Aggregation.default: #SUM
      FlightPrice,
      CurrencyCode,
      @EndUserText.label: 'Agency'
      @ObjectModel.text.element: [ 'AgencyName' ]
      AgencyID,
      AgencyName,
      CreatedBy,
      LastChangedBy,
      LocalLastChangedAt,
      /* Associations */
      _Carrier,
      _Connection,
      _Currency,
      _Customer,
      _Flight,
      _Travel
}
