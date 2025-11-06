@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking View Entity for Booking analysis'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZR_RAP_ABOOK2_ANALYTICS
  as select from ZR_RAP_ABOOK2 as Booking

{
  key BookingUUID,
      TravelUUID,
      BookingID,
      BookingDate,
      substring( BookingDate, 1, 4 ) as BookingDateYear,
      CustomerID,
      _Customer.LastName             as CustomerName,
      CarrierID,
      _Carrier.Name                  as CarrierName,
      ConnectionID,
      FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      FlightPrice,
      CurrencyCode,
      _Travel.AgencyID               as AgencyID,
      _Travel._Agency.Name           as AgencyName,
      @Semantics.user.createdBy: true
      CreatedBy,
      @Semantics.user.lastChangedBy: true
      LastChangedBy,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      LocalLastChangedAt,
      /* Associations */
      _Carrier,
      _Connection,
      _Currency,
      _Customer,
      _Flight,
      _Travel
}
