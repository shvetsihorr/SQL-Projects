--Project 3.Comparison of Conversion Rates Between Different Landing Pages
--==============================================================

WITH sessions_events AS (
  SELECT
     timestamp_micros(event_timestamp) AS event_dttm
     ,user_pseudo_id || '_' || (SELECT 
                               value.int_value 
                               FROM UNNEST(event_params) 
                               WHERE key = 'ga_session_id') AS user_session_id
     ,event_name
     ,REGEXP_EXTRACT((SELECT 
                         value.string_value 
                       FROM UNNEST(event_params) 
                       WHERE key = 'page_location'),r'(?:\w+\:\/\/)?[^\/]+\/([^\?#]*)') AS page_path
  FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*` 
  WHERE _TABLE_SUFFIX BETWEEN '20200101' AND '20201231'
),
sessions_w_start AS (
  SELECT
    user_session_id,
    MAX(CASE WHEN event_name = 'session_start' THEN page_path END) AS start_page,
    MAX(CASE WHEN event_name = 'session_start' THEN 1 ELSE 0 END) AS has_start,
    MAX(CASE WHEN event_name = 'purchase' THEN 1 ELSE 0 END) AS has_purchase
  FROM sessions_events
  GROUP BY user_session_id
)
SELECT 
  start_page,
  COUNT(*) AS cnt_session,
  SUM(has_purchase) AS sales_count,
  SAFE_DIVIDE(SUM(has_purchase), SUM(has_start)) AS conversion  
FROM sessions_w_start
GROUP BY start_page
;