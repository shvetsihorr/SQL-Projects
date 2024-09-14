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

[View SQL query](https://github.com/shvetsihorr/SQL-Projects/blob/bab6eee9eeef8a687ed634269fbcb3e64c1632b6/Calculating%20Month-over-Month%20Differences%20for%20CPC%2C%20CPM%2C%20and%20ROMI%20by%20UTM%20Campaign.sql)

<img width="1468" alt="Calculating Month-over-Month Differences for CPC, CPM, and ROMI by UTM Campaign" src="https://github.com/user-attachments/assets/694c658d-00c4-485e-98dd-3b5a09dac02a">

## Project 5: Data Preparation for BI Reporting using Google BigQuery

In this project, I practiced writing SQL queries in BigQuery using the free Google Analytics 4 (GA4) dataset. My focus was on analyzing eCommerce funnel progression.

[View Project on Google BigQuery if you have an account](https://console.cloud.google.com/bigquery?sq=450854397335:f6e0ae0e1322400e8f236a08a46514af)

[View BigQuery SQL as download file](https://github.com/shvetsihorr/SQL-Projects/blob/fc38bb18e8db4a3c14e7cd1e6501e5c08fabd5ee/BigQuery%20Data%20Preparation%20for%20BI%20Reporting%20using%20Google%20BigQuery.sql)

<img width="1464" alt=" Data Preparation for BI Reporting using Google BigQuery" src="https://github.com/user-attachments/assets/1f2e7b65-508b-488c-b676-308f1ec851a2">


## Project 6: Conversion Calculation by Date and Traffic Channel using Google BigQuery

For this task, I created a query to calculate conversions from session start to purchase, segmented by date and traffic channel.

Note: The query considered both session and user IDs to ensure accurate counts of unique sessions by unique users, as different users might have the same session IDs.

This analysis provided insights into how conversions progress through different stages of the user journey, segmented by date and traffic channel.

[View Project on Google BigQuery if you have an account](https://console.cloud.google.com/bigquery?sq=450854397335:1ad7f81432424c209dcf7e359b8c61b4)

[View BigQuery SQL as download file](https://github.com/shvetsihorr/SQL-Projects/blob/fa9fb14e9c05db5a098d7b09e855c01072a30b78/BigQuery%20-Conversion%20Calculation%20by%20Date%20and%20Traffic%20Channel%20using%20Google.sql)

<img width="1470" alt="Conversion Calculation by Date and Traffic Channel" src="https://github.com/user-attachments/assets/d95a81df-55cd-4664-9162-2b9184ebee2c">

## Project 7. Comparison of Conversion Rates Between Different Landing Pages

For this task, I analyzed conversion rates across different landing pages.
Objective: I created a query to extract the page_path from the page_location in session start events for the year 2020. For each unique landing page, I calculated:

- The number of unique sessions by unique users.
- The number of purchases.
- The conversion rate from session start to purchase.

Note: Since session start and purchase events may have different URLs, I merged these events using user and session identifiers to ensure accurate conversion tracking.

This analysis provided insights into how different landing pages perform in terms of driving conversions.

[View Project on Google BigQuery if you have an account](https://console.cloud.google.com/bigquery?sq=450854397335:1d00f422ab3e4b49979d80373f5f2a13)

[View BigQuery SQL as download file](https://github.com/shvetsihorr/SQL-Projects/blob/88569480d9cc22fac289a54a948f9926570c6e37/BigQuery%20Comparison%20of%20Conversion%20Rates%20Between%20Different%20Landing%20Pages.sql)

<img width="1385" alt="Comparison of Conversion Rates Between Different Landing Pages" src="https://github.com/user-attachments/assets/2a35c45a-9039-493f-a4c0-b0fe6e68dcbf">




