# SQL-Projects

## Project 1: Daily Campaign Performance Metrics
This SQL query aggregates daily performance data for ad campaigns from the facebook_ads_basic_daily table. It calculates key metrics including total spend, impressions, clicks, and value, as well as Cost Per Click (CPC), Cost Per Thousand Impressions (CPM), Click-Through Rate (CTR), and Return on Marketing Investment (ROMI). Results are grouped by date and campaign ID, with metrics rounded to the nearest whole number or two decimal places as appropriate.

[View SQL query](https://github.com/shvetsihorr/SQL-Projects/blob/ec56831b78293c482737756f23f2970a6c12dd86/SQL%20script%20Daily%20Campaign%20Performance%20Metrics.sql)

<img width="1470" alt="Daily Campaign Performance Metrics" src="https://github.com/user-attachments/assets/69cc8c9a-b5b7-4360-9c14-65eb4c7ea2df">

## Project 2: Combining Facebook and Google Ads Data
In this project, I used SQL to combine data from two tables, facebook_ads_basic_daily and google_ads_basic_daily, using a Common Table Expression (CTE). The query aggregates metrics for ad campaigns from both sources by date and media source. The key metrics include total spend, impressions, clicks, and conversion value. This approach provides a unified view of ad performance across platforms.

[View SQL query](https://github.com/shvetsihorr/SQL-Projects/blob/ec56831b78293c482737756f23f2970a6c12dd86/SQL%20script%20Combining%20Facebook%20and%20Google%20Ads%20Data.sql)

<img width="949" alt="Combining Facebook and Google Ads Data" src="https://github.com/user-attachments/assets/a61ec16d-7411-4278-a1ce-d60f2aea5439">

## Project 3.1: Campaign Performance Analysis Across Facebook and Google Ads
In this project, I combined data from four tables, and using CTEs, I merged Facebook and Google Ads data to analyze campaign performance. The query calculated daily metrics like spend, impressions, clicks, and conversion value, grouped by date, media source, campaign, and ad set.

This analysis provided a unified view of ad performance across both platforms.

[View SQL query](https://github.com/shvetsihorr/SQL-Projects/blob/8c691946f583ff8cdaac92385f00fc1b2ad7282c/SQL%20script%20Campaign%20Performance%20Analysis%20Facebook%20and%20Google%20Ads.sql)

<img width="1208" alt="Campaign Performance Analysis Facebook and Google Ads" src="https://github.com/user-attachments/assets/82395a5c-8866-4f4c-a58e-68da97324756">

### Project 3.2 Campaign ROMI Analysis with SQL
 - Identified the campaign with the highest ROMI (spend > 500,000).
- Found the ad set with the highest ROMI within that campaign.

Summary:
This project highlights my SQL skills in merging data, calculating marketing metrics, and analyzing ad performance.

[View SQL query](https://github.com/shvetsihorr/SQL-Projects/blob/e8551a1e41a996d0c9bb75eb909443ec5c528c22/SQL-Campaign%20ROMI%20Analysis%20.sql)

<img width="614" alt="Campaign ROMI Analysis with SQL" src="https://github.com/user-attachments/assets/d0e43738-15cf-42b6-9bca-1b36705d0c89">

## Project 4: Metrics Calculation and UTM Campaign Tracking with SQL

In this project, I used SQL to merge daily performance data from both Facebook and Google Ads into a unified dataset. I extracted key UTM campaign parameters and calculated essential advertising metrics such as CTR, CPC, CPM, and ROMI. The process involved handling null values, applying regular expressions to retrieve UTM parameters, and using CASE statements to avoid division errors. This project showcases my ability to work with large datasets, perform detailed campaign analysis, and generate actionable insights for marketing performance tracking.

[View SQL query](https://github.com/shvetsihorr/SQL-Projects/blob/cea751891831a824f4240ffc47d349d38bc3076a/Metrics%20and%20UTM%20Campaign%20Tracking%20with%20SQL.sql)

<img width="1469" alt="UTM Campaign Tracking and Metrics Calculation" src="https://github.com/user-attachments/assets/28a8a084-9366-4044-bc05-55c7fea581b8">

## Project 4.1: 

For this project, I built on a previous SQL task to analyze monthly ad performance. I used Common Table Expressions (CTEs) to group data by the first day of the ad month, aggregating metrics such as total spend, impressions, clicks, conversion value, CTR, CPC, CPM, and ROMI.

In this SQL query, I introduced a calculation to compare CPM, CTR, and ROMI performance month-over-month for each UTM campaign, expressed as a percentage change. This project demonstrates my ability to perform advanced data aggregation, time-based comparisons, and insights generation for marketing performance analysis.







