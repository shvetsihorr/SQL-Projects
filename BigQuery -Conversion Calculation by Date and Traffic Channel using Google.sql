/*Task 2: Conversion Calculation by Date and Traffic Channel*/
--==============================================================

WITH session_data AS (--count unique 
SELECT
  date(TIMESTAMP_MICROS(event_timestamp)) AS event_date,
  traffic_source.source AS source,
  traffic_source.medium AS medium,
  traffic_source.name AS campaign,
  COUNT(DISTINCT CONCAT(user_pseudo_id, 
                           (SELECT value.int_value 
                           FROM UNNEST(event_params) 
                           WHERE key = 'ga_session_id'))) AS user_sessions_count,
  COUNT(DISTINCT CASE 
                 WHEN event_name = 'add_to_cart' 
                 THEN CONCAT(user_pseudo_id, 
                            (SELECT value.int_value 
                            FROM UNNEST(event_params) 
                            WHERE key = 'ga_session_id')) 
      END) AS visit_to_cart,
  COUNT(DISTINCT CASE 
                 WHEN event_name = 'begin_checkout' 
                 THEN CONCAT(user_pseudo_id, 
                             (SELECT value.int_value 
                             FROM UNNEST(event_params) 
                             WHERE key = 'ga_session_id')) 
      END) AS visit_to_checkout,
  COUNT(DISTINCT CASE 
                 WHEN event_name = 'purchase' 
                 THEN CONCAT(user_pseudo_id, 
                             (SELECT value.int_value 
                             FROM UNNEST(event_params) 
                             WHERE key = 'ga_session_id')) 
      END) AS visit_to_purchase
FROM 
  `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
WHERE
  event_name IN ('session_start', 'add_to_cart', 'begin_checkout', 'purchase')
GROUP BY
  event_date, source, medium, campaign
ORDER BY
  event_date, source, medium, campaign
)--calculate conversion 
  SELECT
    event_date
   ,source
   ,medium
   ,campaign
   ,user_sessions_count
   ,SAFE_DIVIDE(visit_to_cart, user_sessions_count) * 100 AS visit_to_cart
   ,SAFE_DIVIDE(visit_to_checkout, user_sessions_count) * 100 AS visit_to_checkout
   ,SAFE_DIVIDE(visit_to_purchase, user_sessions_count) * 100 AS visit_to_purchase
FROM
  session_data
ORDER BY
  event_date, source, medium, campaign
;
