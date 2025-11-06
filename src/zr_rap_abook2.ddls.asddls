@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View Entity ZRAP_ABOOK2'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZR_RAP_ABOOK2
  as select from zrap_abook2 as Booking
  association        to parent ZR_RAP_ATRAVEL2 as _Travel     on  $projection.TravelUuid = _Travel.TravelUUID
  association [1..1] to ZR_RAP_ACONN2          as _Connection on  $projection.CarrierId    = _Connection.AirlineID
                                                              and $projection.ConnectionId = _Connection.ConnectionID
  association [1..1] to ZR_RAP_AFLIGHT2        as _Flight     on  $projection.CarrierId    = _Flight.AirlineID
                                                              and $projection.ConnectionId = _Flight.ConnectionID
                                                              and $projection.FlightDate   = _Flight.FlightDate
  association [1..1] to ZR_RAP_ACARRier2          as _Carrier    on  $projection.CarrierId = _Carrier.AirlineID
  association [0..1] to I_Currency             as _Currency   on  $projection.CurrencyCode = _Currency.Currency
  association [1..1] to /DMO/I_Customer        as _Customer   on  $projection.CustomerId = _Customer.CustomerID
{
  key booking_uuid          as BookingUUID,
      travel_uuid           as TravelUUID,
      booking_id            as BookingID,
      booking_date          as BookingDate,
      customer_id           as CustomerID,
      carrier_id            as CarrierID,
      connection_id         as ConnectionID,
      flight_date           as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      flight_price          as FlightPrice,
      currency_code         as CurrencyCode,
      created_by            as CreatedBy,
      last_changed_by       as LastChangedBy,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,
      _Travel,
      _Connection,
      _Flight,
      _Carrier,
      _Currency,
      _Customer
}
