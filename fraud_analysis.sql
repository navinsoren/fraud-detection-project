CREATE DATABASE fraud_project;
USE fraud_project;
CREATE TABLE transactions (
    transactionid VARCHAR(20),
    accountid VARCHAR(20),
    transactionamount FLOAT,
    transactiondate DATETIME,
    transactiontype VARCHAR(10),
    location VARCHAR(50),
    deviceid VARCHAR(50),
    ip_address VARCHAR(50),
    merchantid VARCHAR(20),
    channel VARCHAR(20),
    customerage INT,
    customeroccupation VARCHAR(50),
    trantransactionsduration INT,
    loginattempts INT,
    accountbalance FLOAT,
    login_risk INT,
    duration_risk INT,
    fraud_flag INT
);
SELECT * FROM transactions LIMIT 5;
-- Total Transactions

SELECT COUNT(*) AS total_transactions
FROM transactions;

-- TOTAL TRANSACTION AMOUNT 
SELECT SUM(transactionamount) AS total_amount
FROM transactions;

-- Average spending per transaction
SELECT AVG(transactionamount) AS avg_amount
FROM transactions;

-- Smallest transaction (micro payments)
-- Largest transaction (possible fraud signal)
SELECT 
    MIN(transactionamount) AS min_amount,
    MAX(transactionamount) AS max_amount
FROM transactions;

-- debit vs credit transactions
SELECT 
    transactiontype,
    COUNT(*) AS total_txn
FROM transactions
GROUP BY transactiontype;

-- we analyze how transactions happen
SELECT 
    channel,
    COUNT(*) AS total_txn
FROM transactions
GROUP BY channel;

-- Top Locations by Transaction Amount
SELECT 
    location,
    SUM(transactionamount) AS total_amount
FROM transactions
GROUP BY location
ORDER BY total_amount DESC
LIMIT 5;

-- Total number of suspicious / fraudulent transactions
SELECT COUNT(*) AS fraud_count
FROM transactions
WHERE fraud_flag = 1;

-- High Login Attempts (Suspicious Users)
SELECT *
FROM transactions
WHERE loginattempts > 3;
USE fraud_project
-- Long Duration Transactions
SELECT *
FROM transactions
WHERE transactionduration > 180;

-- Fraud Percentage by Channel
SELECT 
    channel,
    COUNT(*) AS total_txn,
    SUM(fraud_flag) AS fraud_count,
    ROUND(SUM(fraud_flag) * 100.0 / COUNT(*), 2) AS fraud_percentage
FROM transactions
GROUP BY channel
ORDER BY fraud_percentage DESC;

-- Top Suspicious Accounts
SELECT 
    accountid,
    COUNT(*) AS suspicious_txn
FROM transactions
WHERE fraud_flag = 1
GROUP BY accountid
ORDER BY suspicious_txn DESC
LIMIT 10;

-- Same IP Used by Multiple Transactions
SELECT 
    ip_address,
    COUNT(*) AS txn_count
FROM transactions
GROUP BY ip_address
HAVING COUNT(*) > 5
ORDER BY txn_count DESC;

-- Detect Rapid Transactions (Window Function)
SELECT 
    accountid,
    transactiondate,
    LAG(transactiondate) OVER (
        PARTITION BY accountid 
        ORDER BY transactiondate
    ) AS previous_txn_time,
    
    TIMESTAMPDIFF(
        SECOND,
        LAG(transactiondate) OVER (
            PARTITION BY accountid 
            ORDER BY transactiondate
        ),
        transactiondate
    ) AS time_diff_seconds

FROM transactions;

-- Filtering suspicious ones
SELECT *
FROM (
    SELECT 
        accountid,
        transactiondate,
        TIMESTAMPDIFF(
            SECOND,
            LAG(transactiondate) OVER (
                PARTITION BY accountid 
                ORDER BY transactiondate
            ),
            transactiondate
        ) AS time_diff
    FROM transactions
) t
WHERE time_diff < 60;










































