@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View Entity ZRAP_ACONN2'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZR_RAP_ACONN2
  as select from zrap_aconn2 as Connection
  association [1..1] to ZR_RAP_ACARRIER2 as _Airline on $projection.AirlineID = _Airline.AirlineID
{
  @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      @ObjectModel.text.association: '_Airline'
      @Consumption.valueHelpDefinition: [ {
        entity: {
          name: 'ZR_RAP_ACARRIER2',
          element: 'AirlineID'
        }
      } ]
  key carrier_id            as AirlineID,
  key connection_id         as ConnectionID,
      @Consumption.valueHelpDefinition: [ {
        entity: {
          name: '/DMO/I_Airport',
          element: 'AirportID'
        }
      } ]
      airport_from_id       as DepartureAirport,
      @Consumption.valueHelpDefinition: [ {
          entity: {
            name: '/DMO/I_Airport',
            element: 'AirportID'
          }
      } ]
      airport_to_id         as DestinationAirport,
      departure_time        as DepartureTime,
      arrival_time          as ArrivalTime,
      @Semantics.quantity.unitOfMeasure: 'DistanceUnit'
      distance              as Distance,
      @Consumption.valueHelpDefinition: [ {
        entity.name: 'I_UnitOfMeasureStdVH',
        entity.element: 'UnitOfMeasure',
        useForValidation: true
      } ]
      distance_unit         as DistanceUnit,

      /* Associations */
      _Airline
}
