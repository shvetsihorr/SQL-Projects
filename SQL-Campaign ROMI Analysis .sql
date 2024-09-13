/* Key Steps:

Combined Facebook ad data from three tables (ads, adsets, campaigns) into a unified dataset.
Merged Facebook and Google Ads data into a single table for analysis.
Aggregated metrics (spend, impressions, clicks, and value) by date, campaign, and adset.
Calculated Return on Marketing Investment (ROMI) for campaigns with over $500,000 spend.
Identified the campaign with the highest ROMI, then found the top-performing ad set in that campaign.

*/

--Stage 1 & 2: Data from Facebook and Google Ads is collected

-- STAGE 1:  data from Facebook Ads tables
WITH data_from_facebook AS (
    SELECT
        fabd.ad_date,
        fc.campaign_name,
        fa.adset_name,
        fabd.spend,
        fabd.impressions,
        fabd.reach,
        fabd.clicks,
        fabd.leads,
        fabd.value
    FROM 
        facebook_ads_basic_daily AS fabd
    JOIN 
        facebook_campaign AS fc ON fc.campaign_id = fabd.campaign_id
    JOIN 
        facebook_adset AS fa ON fa.adset_id = fabd.adset_id
),

-- STAGE 2:  data from Google Ads table
Google_data AS (
    SELECT 
        ad_date, 
        campaign_name, 
        adset_name, 
        spend, 
        impressions, 
        reach, 
        clicks, 
        leads, 
        value 
    FROM 
        google_ads_basic_daily
),

-- STAGE 3: A UNION ALL data from Facebook and Google into a single table
union_table AS (
    SELECT 
        *, 'Facebook' AS media_source 
    FROM 
        data_from_facebook
    UNION ALL
    SELECT 
        *, 'Google' AS media_source 
    FROM 
        Google_data
),

-- STAGE 4: ROMI is calculated at the campaign level
romi_calculated AS (
    SELECT
        campaign_name,
        SUM(spend) AS total_spend,
        SUM(value) AS total_value,
        (SUM(value)::numeric - SUM(spend)) / NULLIF(SUM(spend)::numeric, 0) AS romi
    FROM 
        union_table
    GROUP BY 
        campaign_name
    HAVING 
        SUM(spend) > 500000
),

-- STAGE 5: The campaign with the highest ROMI is selected
highest_romi_campaign AS (
    SELECT 
        campaign_name
    FROM 
        romi_calculated
    ORDER BY 
        romi DESC
    LIMIT 1
),

-- STAGE 6: ROMI is recalculated for each ad set (adset_name) within the campaign that has the highest ROMI.
adset_name_romi AS (
    SELECT
        campaign_name,
        adset_name,
        SUM(spend) AS total_spend,
        SUM(value) AS total_value,
        (SUM(value)::numeric - SUM(spend)) / NULLIF(SUM(spend)::numeric , 0) AS romi
    FROM 
        union_table
    WHERE 
        campaign_name IN (SELECT campaign_name FROM highest_romi_campaign)
    GROUP BY 
        campaign_name, adset_name
)
-- STAGE 7: The ad set with the highest ROMI in the top campaign is selected and returned as the result.
SELECT 
    campaign_name,
    adset_name,
    romi
FROM 
    adset_name_romi
ORDER BY 
    romi DESC
LIMIT 1;


































