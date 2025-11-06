@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View for ZR_RAP_ATRAVEL2'
@Metadata.ignorePropagatedAnnotations: true
@Search.searchable: true
@ObjectModel.semanticKey: ['TravelID']
@Metadata.allowExtensions: true
define root view entity ZC_RAP_ATRAVEL2
  provider contract transactional_query
  as projection on ZR_RAP_ATRAVEL2
{
  key TravelUUID,

      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.90
      @ObjectModel.text.element: [ 'Description' ]
      TravelID,

      @Consumption.valueHelpDefinition: [ {
        entity: {
          name: '/DMO/I_Agency',
          element: 'AgencyID'
        }
      } ]
      @EndUserText.label: 'Agency'
      @ObjectModel.text.element: [ 'AgencyName' ]
      AgencyID,
      _Agency.Name                   as AgencyName,

      @Consumption.valueHelpDefinition: [ {
        entity: {
          name: '/DMO/I_Customer_StdVH',
          element: 'CustomerID'
        }
      } ]

      @EndUserText.label: 'Customer'
      @ObjectModel.text.element: [ 'CustomerLastName' ]
      CustomerID,
      _Customer.LastName             as CustomerLastName,

      BeginDate,

      EndDate,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,

      @Consumption.valueHelpDefinition: [ {
        entity: {
          name: 'I_Currency',
          element: 'Currency'
        }
      } ]
      CurrencyCode,

      Description,

      @Consumption.valueHelpDefinition: [ {
        entity: {
          name: 'ZR_RAP_STAT',
          element: 'TravelStatusId'
        }
      } ]
      @ObjectModel.text.element: ['StatusText']
      OverallStatus,

      _TravelStatus.TravelStatusText as StatusText,

      OverallStatusCriticality,

      LocalLastChangedAt,
      _Booking : redirected to composition child ZC_RAP_ABOOK2,
      _Agency,
      _Currency,
      _Customer,
      _TravelStatus
}
