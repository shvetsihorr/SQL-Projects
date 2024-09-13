/* Title: Daily Campaign Performance Metrics
   Description: This query calculates and reports key performance metrics for ad campaigns on a daily basis.
   It aggregates data from the `facebook_ads_basic_daily` table and computes the following metrics:
1. Total spend
2. Total impressions
3. Total clicks
4. Total value
5. Cost Per Click (CPC) in USD
6. Cost Per Thousand Impressions (CPM) in USD
7. Click-Through Rate (CTR) as a percentage
8. Return on Marketing Investment (ROMI) as a percentage

The results are grouped by the advertisement date and campaign ID, with metrics rounded as specified.
*/

SELECT 
    ad_date 
    , campaign_id
    , ROUND(SUM(CAST(spend AS numeric)), 2) AS total_spend
    , ROUND(SUM(CAST(impressions AS numeric)), 2) AS total_impressions
    , ROUND(SUM(CAST(clicks AS numeric)), 2) AS total_clicks
    , ROUND(SUM(CAST(value AS numeric)), 2) AS total_value
    , ROUND(SUM(CAST(spend AS numeric)) / NULLIF(SUM(CAST(clicks AS numeric)), 0), 0) AS CPC_usd
    , ROUND(1000 * SUM(CAST(spend AS numeric)) / NULLIF(SUM(CAST(impressions AS numeric)), 0), 0) AS CPM_usd
    , ROUND((SUM(CAST(clicks AS numeric)) / NULLIF(SUM(CAST(impressions AS numeric)), 0)) * 100) AS CTR_percent
    ROUND(((SUM(CAST(value AS numeric)) - SUM(CAST(spend AS numeric))) / NULLIF(SUM(CAST(spend AS numeric)), 0)) * 100) AS ROMI_percent
FROM 
   facebook_ads_basic_daily
WHERE 
   clicks > 0 AND impressions > 0 AND spend > 0
GROUP BY 
    ad_date
  , campaign_id
 ;











