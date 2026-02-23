-- feat: implemented customer-level transaction aggregation using JOIN and GROUP BY
SELECT 
    c.customer_id, 
    c.first_name, 
    c.last_name, 
    SUM(t.amount) AS total_transaction_amount
FROM customers c
JOIN accounts a     ON c.customer_id = a.customer_id
JOIN transactions t ON a.account_id = t.account_id
GROUP BY 
    c.customer_id, 
    c.first_name, 
    c.last_name
ORDER BY total_transaction_amount DESC;


--feat: added monthly transaction trend analysis using date functions
SELECT 
    TO_CHAR(t.transaction_date, 'YYYY-MM') AS month, 
    COUNT(t.transaction_id) AS total_transactions, 
    SUM(t.amount) AS total_amount
FROM transactions t
GROUP BY TO_CHAR(t.transaction_date, 'YYYY-MM')
ORDER BY month;

--feat: implemented transaction type performance summary
SELECT 
    transaction_type, 
    COUNT(*) AS transaction_count, 
    SUM(amount) AS total_amount
FROM transactions
GROUP BY transaction_type
ORDER BY total_amount DESC;

--feat: implemented top 10 customers ranking using subquery and ROWNUM
SELECT *
FROM (
    SELECT 
        c.customer_id, 
        c.first_name, 
        c.last_name, 
        SUM(t.amount) AS total_spent
    FROM customers c
    JOIN accounts a     ON c.customer_id = a.customer_id
    JOIN transactions t ON a.account_id = t.account_id
    GROUP BY c.customer_id, c.first_name, c.last_name
    ORDER BY total_spent DESC
)
WHERE ROWNUM <= 10;

--feat: added customer ranking using RANK() window function
SELECT 
    customer_id, 
    first_name, 
    last_name, 
    total_amount, 
    RANK() OVER (ORDER BY total_amount DESC) AS customer_rank
FROM (
    SELECT 
        c.customer_id, 
        c.first_name, 
        c.last_name, 
        SUM(t.amount) AS total_amount
    FROM customers c
    JOIN accounts a     ON c.customer_id = a.customer_id
    JOIN transactions t ON a.account_id = t.account_id
    GROUP BY c.customer_id, c.first_name, c.last_name
);



--feat: implemented basic fraud pattern detection using HAVING clause
SELECT 
    account_id, 
    transaction_date, 
    COUNT(*) AS transaction_count, 
    SUM(amount) AS daily_total
FROM transactions
GROUP BY account_id, transaction_date
HAVING SUM(amount) > 10000
ORDER BY daily_total DESC;
