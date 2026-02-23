--feat: created core banking schema (customers, accounts, transactions tables)
CREATE TABLE customers (
    customer_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50),
    last_name VARCHAR2(50),
    city VARCHAR2(50),
    registration_date DATE
);



CREATE TABLE accounts (
    account_id NUMBER PRIMARY KEY,
    customer_id NUMBER,
    account_type VARCHAR2(20),
    balance NUMBER(12,2),
    open_date DATE,
    CONSTRAINT fk_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);


CREATE TABLE transactions (
    transaction_id NUMBER PRIMARY KEY,
    account_id NUMBER,
    transaction_date DATE,
    transaction_type VARCHAR2(20),
    amount NUMBER(12,2),
    CONSTRAINT fk_account
        FOREIGN KEY (account_id)
        REFERENCES accounts(account_id)
);
