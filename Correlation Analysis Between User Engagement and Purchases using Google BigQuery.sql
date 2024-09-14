-- Correlation Analysis Between User Engagement and Purchases
--==============================================================
WITH user_session_engagement AS (
    SELECT 
        ecom.user_pseudo_id || CAST((
            SELECT value.int_value 
            FROM UNNEST(ecom.event_params) 
            WHERE key = 'ga_session_id'
        ) AS STRING) AS user_session_id,

        SUM(COALESCE((
            SELECT value.int_value 
            FROM UNNEST(ecom.event_params) 
            WHERE key = 'engagement_time_msec'
        ), 0)) AS total_engagement_time,

        CASE 
            WHEN SUM(COALESCE(
                SAFE_CAST((
                    SELECT value.string_value 
                    FROM UNNEST(ecom.event_params) 
                    WHERE key = 'session_engaged'
                ) AS INTEGER),
                (
                    SELECT value.int_value 
                    FROM UNNEST(ecom.event_params)
                    WHERE key = 'session_engaged'
                ), 0
            )) > 0 THEN 1 
            ELSE 0
        END AS is_session_engaged

    FROM 
        `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*` ecom

    GROUP BY 1
),
purchases AS (
    SELECT 
        ecom.user_pseudo_id || CAST((
            SELECT value.int_value 
            FROM UNNEST(ecom.event_params) 
            WHERE key = 'ga_session_id'
        ) AS STRING) AS user_session_id
    FROM 
        `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*` ecom
    WHERE event_name = 'purchase'
)
SELECT 
    CORR(usg.total_engagement_time, 
         CASE WHEN p.user_session_id IS NOT NULL THEN 1 ELSE 0 END) AS engagement_time_to_purchase_corr,
    
    CORR(usg.is_session_engaged, 
         CASE WHEN p.user_session_id IS NOT NULL THEN 1 ELSE 0 END) AS engaged_session_to_purchase_corr
FROM 
    user_session_engagement AS usg
LEFT JOIN 
    purchases AS p
ON 
    usg.user_session_id = p.user_session_id;