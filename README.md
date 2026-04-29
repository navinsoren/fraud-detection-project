# fraud-detection-project
Project Overview

This project focuses on detecting fraudulent transactions using data analysis techniques.
The goal is to identify suspicious patterns in banking transactions such as:

Unusual transaction amounts
Multiple login attempts
High-risk locations or devices
Repeated abnormal behavior

The project uses Python, SQL, and Excel to clean, analyze, and visualize data.
Tools & Technologies
🐍 Python (Pandas, NumPy)
🗄️ MySQL (SQL queries for analysis)
📊 Excel (Interactive Dashboard)
📁 CSV Dataset

The dataset includes:

Transaction ID
Account ID
Transaction Amount
Transaction Date
Transaction Type (Debit/Credit)
Location
Device ID
IP Address
Merchant ID
Channel (Online/Offline)
Customer Age
Login Attempts
Account Balance

Before analysis, the dataset was cleaned by Using Python (Pandas):
Removing duplicate records
Handling missing values
Converting date formats
Standardizing column names
Fixing incorrect data types

Fraud was identified using rule-based patterns such as:
🚨 High-value transactions compared to normal behavior
🚨 Multiple failed login attempts
🚨 Transactions from unusual locations
🚨 Same device/IP used for multiple accounts
🚨 Frequent transactions in a short time period

Key SQL operations used:
JOIN operations between tables
GROUP BY analysis for customer behavior
Window functions for ranking transactions
Filtering high-risk transactions
Aggregation for fraud pattern detection

An interactive Excel dashboard created to visualize:

Total vs Fraud transactions
Fraud distribution by location
Fraud by age group
Channel-wise fraud trends
Customer risk segmentation



## Dashboard
<img width="1600" height="643" alt="image" src="https://github.com/user-attachments/assets/fb9b0b82-6c7e-45e7-92ce-73a1bbabb280" />


## Author
Navin Kumar Soren 
