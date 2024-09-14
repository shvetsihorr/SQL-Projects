--CTE UNION
with union_fb_ggle as ( --Union of Facebook and Google Ads data
   select
       fabd.ad_date
      ,coalesce(fabd.url_parameters, '0') as url_parameters 
      ,fabd.spend 
      ,fabd.impressions 
      ,fabd.reach 
      ,fabd.clicks 
      ,coalesce(fabd.leads, 0) as leads 
      ,fabd.value
      ,'facebook' as media_source
   from 
     facebook_ads_basic_daily as fabd
   join
     facebook_adset as fa_adset on fa_adset.adset_id = fabd.adset_id
   join 
     facebook_campaign as fa_campaig on fa_campaig.campaign_id = fabd.campaign_id 
 
union

  select 
      ggle_ads.ad_date
     ,coalesce(ggle_ads.url_parameters,'0') as url_parameters 
     ,ggle_ads.spend 
     ,ggle_ads.impressions 
     ,ggle_ads.reach 
     ,ggle_ads.clicks 
     ,coalesce(ggle_ads.leads,0) as leads 
     ,ggle_ads.value
     ,'google'as media_source
  from 
     google_ads_basic_daily as ggle_ads
)--CTE UTM
,utm_campaign_table as (--Processing UTM Campaign Data and Calculating Metrics
  select 
      ad_date
     ,sum(spend) as spend
     ,lower(case 
   	         when substring(url_parameters, 'utm_campaign=([^&#$]+)') = 'nan' 
             then 'null'
             else substring(url_parameters, 'utm_campaign=([^&#$]+)')
             end
           ) as utm_campaign
    ,round(case
    	     when sum(impressions) = 0
    	     then 0
    	     else sum(clicks)::numeric / sum(impressions) * 100
             end,2) as CTR_percent
    ,case 
	    when sum(clicks) = 0
        then 0
        else sum(spend) / sum(clicks)
        end as CPC_usd
    ,case 
    	when sum(impressions) = 0
    	then 0
    	else 1000 * sum(spend) / sum(impressions)
        end as CPM_usd 
    ,round(case 
    	     when sum(spend) = 0
    	     then 0
    	     else (sum(value)::numeric - (sum(spend))) / sum(spend) *100
             end,2) as ROMI_USD
  from 
      union_fb_ggle
  group by 
      ad_date
     ,spend
     ,url_parameters
)
select --Final Selection:
      ad_date 
      ,spend 
      ,coalesce(utm_campaign, 'Not Available') as utm_campaign
      ,ctr_percent
      ,cpc_usd
      ,cpm_usd
      ,romi_usd
      from utm_campaign_table
      group by ad_date, spend, utm_campaign, ctr_percent,cpc_usd, cpm_usd, romi_usd
      
      
      
      
      