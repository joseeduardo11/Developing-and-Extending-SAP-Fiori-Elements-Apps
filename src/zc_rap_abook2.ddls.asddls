@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View for ZR_RAP_ABOOK2'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@ObjectModel.semanticKey: [ 'BookingID' ]
@Metadata.allowExtensions: true
@Search.searchable: true
define view entity ZC_RAP_ABOOK2
  as projection on ZR_RAP_ABOOK2
{
  key BookingUUID,
      TravelUUID,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.9
      BookingID,
      BookingDate,
      @Consumption.valueHelpDefinition: [ {
          entity: {
              name: '/DMO/I_Customer',
              element: 'CustomerID'
           }
      } ]
      @EndUserText.label: 'Customer'
      @ObjectModel.text.element: ['LastName']
      CustomerID,
      _Customer.LastName as LastName,
      @Consumption.valueHelpDefinition: [ {
          entity: {
              name: 'zr_rap_acarrier2',
              element: 'AirlineID'
          }
      } ]
      @EndUserText.label: 'Airline'
      @ObjectModel.text.element: ['CarrierName']
      CarrierID,
      _Carrier.Name      as CarrierName,
      @Consumption.valueHelpDefinition: [ {
          entity: {
              name: 'zr_rap_aflight2',
              element: 'ConnectionID'
          },
          additionalBinding: [ {
              localElement: 'FlightDate',
              element: 'FlightDate'
          }, {
              localElement: 'CarrierID',
              element: 'AirlineID'
          }, {
              localElement: 'FlightPrice',
              element: 'Price'
          }, {
              localElement: 'CurrencyCode',
              element: 'CurrencyCode'
          } ]
      } ]
      ConnectionID,
      FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      FlightPrice,
      @Consumption.valueHelpDefinition: [ {
          entity: {
              name: 'I_Currency',
              element: 'Currency'
          }
      } ]
      CurrencyCode,
      CreatedBy,
      LastChangedBy,
      LocalLastChangedAt,
      /* Associations */
      _Travel : redirected to parent ZC_RAP_ATRAVEL2,
      _Connection,
      _Flight,
      _Carrier,
      _Currency,
      _Customer
}
