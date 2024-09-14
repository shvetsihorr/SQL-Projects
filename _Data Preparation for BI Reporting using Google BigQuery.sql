--Project 1. Data Preparation for BI Reporting
--==============================================================
SELECT 
   event_timestamp
   ,user_pseudo_id
   ,(select value.int_value 
     from ecom.event_params 
     where event_params.key = 'ga_session_id') as session_id
  ,event_name
  ,geo.country
  ,device.category
  ,traffic_source.source
  ,traffic_source.medium
  ,traffic_source.name as campaign
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`  ecom
WHERE _table_suffix >= '20210101'
and event_name in ('session_start', 'view_item', 'add_to cart','begin_checkout', 'add_shipping_info', 'add_paymant_info', 'purchase')
;