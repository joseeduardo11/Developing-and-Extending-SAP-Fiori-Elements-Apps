@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View Entity ZRAP_AFLIGHT2'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZR_RAP_AFLIGHT2
  as select from zrap_aflight2 as Flight
  association [1]    to ZR_RAP_ACARRIER2 as _Airline    on  $projection.AirlineID = _Airline.AirlineID
  association [1]    to ZR_RAP_ACONN2 as _Connection on  $projection.ConnectionID = _Connection.ConnectionID
                                                     and $projection.AirlineID    = _Connection.AirlineID
  association [0..1] to I_Currency    as _Currency   on  $projection.CurrencyCode = _Currency.Currency
{
  key carrier_id     as AirlineID,
  key connection_id  as ConnectionID,
  key flight_date    as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price          as Price,
      currency_code  as CurrencyCode,
      plane_type_id  as PlaneType,
      seats_max      as MaximumSeats,
      seats_occupied as SeatsOccupied,
      _Airline,
      _Connection,
      _Currency
}
