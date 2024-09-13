with data_from_facebook as( -- CTE for FACEBOOK tables 
                            SELECT
                               fabd.ad_date
                              ,fc.campaign_name
                              ,fa.adset_name
                              ,fabd.spend
                              ,fabd.impressions
                              ,fabd.reach
                              ,fabd.clicks
                              ,fabd.leads
                              ,fabd.value
                            FROM 
                              facebook_ads_basic_daily AS fabd
                            JOIN 
                              facebook_campaign AS fc ON fc.campaign_id = fabd.campaign_id
                            join 
                               facebook_adset as fa on fa.adset_id = fabd.adset_id
),
Google_data as ( select 
                      ad_date 
                    , campaign_name 
                    , adset_name 
                    , spend 
                    , impressions 
                    , reach 
                    , clicks 
                    , leads 
                    , value 
from google_ads_basic_daily as google
), 
union_table as -- CTE for FACEBOOK tables union with Google
               (select 
                    *
                  ,'Facebook' as media_source 
                from 
                   data_from_facebook
                union all
                select 
                    *
                   ,'Google' as media_source 
                from 
                  Google_data
)--final redult
SELECT
    ad_date,
    media_source,
    campaign_name,
    adset_name,
    SUM(spend) AS total_spend,
    SUM(impressions) AS total_impressions,
    SUM(clicks) AS total_clicks,
    SUM(value) AS total_value
FROM 
   union_table
GROUP BY 
    ad_date, media_source, campaign_name, adset_name
ORDER BY 
    ad_date, media_source, campaign_name, adset_name;