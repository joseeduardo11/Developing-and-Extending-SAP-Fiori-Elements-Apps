@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Status View for Travel Scenario'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@ObjectModel.resultSet.sizeCategory: #XS

define view entity ZR_RAP_STAT2
  as select from zrap_astat as Status
{
      @UI.textArrangement: #TEXT_ONLY
      @ObjectModel.text.element: [ 'TravelStatusText' ]
  key Status.travel_status_id   as TravelStatusId,
      @UI.hidden: true
      Status.travel_status_text as TravelStatusText
}
