# 🏦 Bank Transaction Analysis – Oracle SQL Project

## 📌 Project Overview
This project simulates a banking system using Oracle SQL and performs analytical queries to extract meaningful business insights.

The database contains three relational tables:
- Customers
- Accounts
- Transactions

Synthetic data was generated to simulate real-world banking operations.

---

## 🛠 Technologies Used
- Oracle SQL
- Oracle Live SQL
- Aggregation Functions (SUM, COUNT)
- JOIN
- GROUP BY
- HAVING
- Subqueries
- Window Functions (RANK)
- Date Functions
- DBMS_RANDOM

---

## 🗂 Database Structure

### 1️⃣ Customers
Stores customer information.

### 2️⃣ Accounts
Represents customer bank accounts (Debit / Credit).

### 3️⃣ Transactions
Stores banking transactions (Deposit, Withdrawal, Transfer).

Relationships:
Customers → Accounts → Transactions

---

## 📊 Business Questions Answered

- What is the total transaction amount per customer?
- Who are the top customers by transaction volume?
- What is the monthly transaction trend?
- What is the distribution of transaction types?
- Are there potential high-value transaction patterns?

---

## 📈 Key SQL Concepts Demonstrated

✔ Relational database design  
✔ Foreign key relationships  
✔ Data generation using DBMS_RANDOM  
✔ Data aggregation  
✔ Analytical ranking with RANK()  
✔ Date-based reporting  
✔ Business-oriented SQL queries  

---

## 🎯 Project Goal

The goal of this project is to demonstrate practical SQL skills in a banking scenario and build a professional portfolio project for Data Analyst / BI roles.

---

## 📂 File Structure

- 01_schema.sql
- 02_data_generation.sql
- 03_analysis_queries.sql
- README.md
