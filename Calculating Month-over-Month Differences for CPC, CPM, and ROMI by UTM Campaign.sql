/* 1) UNION TABLES */
WITH union_fb_ggle AS (
    SELECT 
        ad_date,
        COALESCE(url_parameters, '0') AS url_parameters,
        spend,
        impressions,
        reach,
        clicks,
        COALESCE(leads, 0) AS leads,
        value,
        'facebook' AS media_source
    FROM facebook_ads_basic_daily
    UNION ALL
    SELECT 
        ad_date,
        COALESCE(url_parameters, '0') AS url_parameters,
        spend,
        impressions,
        reach,
        clicks,
        COALESCE(leads, 0) AS leads,
        value,
        'google' AS media_source
    FROM google_ads_basic_daily
),
/* 2) UTM campaign and the first day of the month from the ad display date  */
utm_campaign_table AS (
    SELECT 
        DATE_TRUNC('month', ad_date)::date AS first_month_day,
        LOWER(
            CASE
                WHEN SUBSTRING(url_parameters FROM 'utm_campaign=([^&#$]+)') = 'nan' THEN NULL
                ELSE SUBSTRING(url_parameters FROM 'utm_campaign=([^&#$]+)')
            END
        ) AS utm_campaign,
        SUM(spend) AS spend,
        SUM(impressions) AS impressions,
        SUM(clicks) AS clicks,
        SUM(value) AS value,
        ROUND(
            CASE
                WHEN SUM(impressions) = 0 THEN 0
                ELSE CAST(SUM(clicks) AS NUMERIC) / SUM(impressions) * 100
            END, 2
        ) AS CTR_percent,
        CAST(
            CASE
                WHEN SUM(clicks) = 0 THEN 0
                ELSE SUM(spend) / SUM(clicks)
            END AS NUMERIC
        ) AS CPC_usd,
        CAST(
            CASE
                WHEN SUM(impressions) = 0 THEN 0
                ELSE 1000 * SUM(spend) / SUM(impressions)
            END AS NUMERIC
        ) AS CPM_usd,
        ROUND(
            CASE
                WHEN SUM(spend) = 0 THEN 0
                ELSE (SUM(value)::NUMERIC - SUM(spend)) / SUM(spend) * 100
            END, 2
        ) AS ROMI_usd
    FROM 
        union_fb_ggle
    GROUP BY 
        first_month_day, utm_campaign
)
/* 3) Final result - calculate the month-over-month percentage difference for CPM, CPC, and ROMI */
SELECT 
    first_month_day,    
    COALESCE(utm_campaign, 'Not Available') AS utm_campaign,
    spend,
    impressions,
    clicks,
    value,
    CTR_percent,
    CPC_usd,
    CPM_usd,
    ROMI_usd,
    ROUND(
        CASE
            WHEN LAG(CPM_usd) OVER (PARTITION BY utm_campaign ORDER BY first_month_day) = 0 THEN 0
            ELSE (CPM_usd - LAG(CPM_usd) OVER (PARTITION BY utm_campaign ORDER BY first_month_day)) 
                 / LAG(CPM_usd) OVER (PARTITION BY utm_campaign ORDER BY first_month_day) * 100
        END, 2
    ) AS cpm_dif,
    ROUND(
        CASE
            WHEN LAG(CPC_usd) OVER (PARTITION BY utm_campaign ORDER BY first_month_day) = 0 THEN 0
            ELSE (CPC_usd - LAG(CPC_usd) OVER (PARTITION BY utm_campaign ORDER BY first_month_day)) 
                 / LAG(CPC_usd) OVER (PARTITION BY utm_campaign ORDER BY first_month_day) * 100
        END, 2
    ) AS CPC_dif,
    ROUND(
        CASE
            WHEN LAG(ROMI_usd) OVER (PARTITION BY utm_campaign ORDER BY first_month_day) = 0 THEN 0
            ELSE (ROMI_usd - LAG(ROMI_usd) OVER (PARTITION BY utm_campaign ORDER BY first_month_day)) 
                 / LAG(ROMI_usd) OVER (PARTITION BY utm_campaign ORDER BY first_month_day) * 100
        END, 2
    ) AS ROMI_dif   
FROM 
    utm_campaign_table
ORDER BY 
    first_month_day, utm_campaign;
