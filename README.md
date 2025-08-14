# 📊 Credit Card Weekly Sales Analysis

An Interactive Data Analysis Project using SQL Server, Power BI & DAX

📌 Project Overview

This project analyzes credit card transaction and customer data to uncover revenue trends, spending patterns, and customer demographics. Using SQL Server for data storage & transformation and Power BI for visualization, the dashboard delivers real-time insights into key performance metrics, enabling stakeholders to monitor and analyze credit card operations effectively.

🎯 Objective

To develop a comprehensive credit card weekly dashboard that provides real-time insights into:

Revenue and transaction trends over time

Key customer segments based on demographics & spending habits

Week-on-week performance and seasonal patterns

Actionable recommendations for marketing & product strategies

🗂 Data Overview
1. cc_detail – Credit Card Transaction Details

Columns: Transaction_ID, Customer_ID, Week_Num_Day, Amount, Interest, Card_Type, Exp_Type, etc.

Rows: 667K+ transactions

2. cust_detail – Credit Card Customer Details

Columns: Customer_ID, Name, Age, Gender, Education_Level, Job_Type, Income, State, etc.

Rows: 10,293 customers

🛠 Tools & Technologies

SQL Server – Data storage, cleaning & transformation

Power BI – Data modeling, visualization & dashboard creation

DAX – Calculated columns & measures for KPIs

CSV – Raw data source format

🔄 Process Workflow

Data Import to SQL Server – Created tables, bulk imported CSV data

Data Cleaning & Preparation – Formatted dates, corrected inconsistencies

Power BI Connection – Linked to SQL Server for real-time querying

Data Modeling – Established relationships between tables

Calculated Columns & Measures – Created Age_Group, Income_Group, Total Revenue, WoW Growth, etc.

Dashboard Design – Added slicers, custom color palette, and interactive visuals

📈 Key Insights

Swipe transactions generate the most revenue

Blue card holders contribute the highest share of revenue

Graduates are the most profitable customer segment

Businessmen & high-income customers have the highest average spend

Revenue spikes observed in specific seasonal weeks

💡 Recommendations

Targeted promotions for Blue card holders and high spenders

Special offers for low-performing card types

Reward programs to encourage online transactions

Marketing campaigns focused on graduates & business professionals
