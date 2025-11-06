@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View Entity ZRAP_ACARRIER2'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZR_RAP_ACARRIER2
  as select from ZRAP_ACARRIER2 as Airline
  association [0..1] to I_Currency as _Currency on $projection.CurrencyCode = _Currency.Currency
{
      @Search.defaultSearchElement: true
      @ObjectModel.text.element: [ 'Name' ]
  key Airline.carrier_id      as AirlineID,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      @Semantics.text: true
      Airline.name            as Name,
      @Semantics.imageUrl: true
      Airline.carrier_pic_url as AirlinePicURL,
      Airline.currency_code   as CurrencyCode,
      _Currency
}
