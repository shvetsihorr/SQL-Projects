WITH fb_and_google_data AS (--Creating CTE 
    SELECT 
        ad_date,
        'Facebook ads' AS media_source,
        spend,
        impressions,
        reach,
        clicks,
        leads,
        value
    FROM facebook_ads_basic_daily
    
    UNION ALL
    
    SELECT 
        ad_date,
        'Google ads' AS media_source,
        spend,
        impressions,
        reach,
        clicks,
        leads,
        value
    FROM google_ads_basic_daily
)-- Aggregating metrics from the combined data
SELECT 
    ad_date,
    media_source,
    SUM(spend) AS total_spend,
    SUM(impressions) AS total_impressions,
    SUM(clicks) AS total_clicks,
    SUM(value) AS total_value
FROM fb_and_google_data                                
GROUP BY
    ad_date,
    media_source
ORDER BY
    ad_date,
    media_source;
