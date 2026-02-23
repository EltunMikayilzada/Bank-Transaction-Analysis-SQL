
--feat:  generated sample customer data using DBMS_RANDOM
INSERT INTO customers
SELECT 
    LEVEL AS customer_id,
    'Name_' || LEVEL AS first_name,
    'Surname_' || LEVEL AS last_name,
    CASE 
        WHEN MOD(LEVEL,4)=0 THEN 'Baku'
        WHEN MOD(LEVEL,4)=1 THEN 'Ganja'
        WHEN MOD(LEVEL,4)=2 THEN 'Sumqayit'
        ELSE 'Mingachevir'
    END AS city,
    TRUNC(SYSDATE - DBMS_RANDOM.VALUE(100,1000)) AS registration_date
FROM dual
CONNECT BY LEVEL <= 200;

COMMIT;


--feat: populated accounts table with randomized debit and credit accounts
INSERT INTO accounts
SELECT 
    LEVEL AS account_id,
    TRUNC(DBMS_RANDOM.VALUE(1,201)) AS customer_id,
    CASE 
        WHEN MOD(LEVEL,2)=0 THEN 'Debit'
        ELSE 'Credit'
    END AS account_type,
    ROUND(DBMS_RANDOM.VALUE(100,10000),2) AS balance,
    TRUNC(SYSDATE - DBMS_RANDOM.VALUE(50,900)) AS open_date
FROM dual
CONNECT BY LEVEL <= 400;

COMMIT;


--feat: generated 3000 synthetic bank transactions for analytical testing


INSERT INTO transactions
SELECT 
    LEVEL AS transaction_id,
    TRUNC(DBMS_RANDOM.VALUE(1,401)) AS account_id,
    TRUNC(SYSDATE - DBMS_RANDOM.VALUE(1,365)) AS transaction_date,
    CASE 
        WHEN MOD(LEVEL,3)=0 THEN 'Deposit'
        WHEN MOD(LEVEL,3)=1 THEN 'Withdrawal'
        ELSE 'Transfer'
    END AS transaction_type,
    ROUND(DBMS_RANDOM.VALUE(10,5000),2) AS amount
FROM dual
CONNECT BY LEVEL <= 3000;

COMMIT;
