# 🏦 Bank Loan Analysis | SQL & Power BI

## 📌 Project Overview

This project is an end-to-end **Bank Loan Analysis** project built using **SQL and Power BI**.

In this project, I first used **SQL to analyze the raw bank loan dataset and extract meaningful business insights and KPIs**. After completing the SQL analysis, I loaded the loan data into **Power BI** and created an interactive dashboard to visualize the insights.

The project focuses on loan applications, funded amounts, amount received, loan status, interest rates, DTI, loan purpose, employee length, home ownership, loan terms, states, grades, and other loan-related attributes.

### Project Workflow

Raw Loan Data → SQL Analysis → Business Insights & KPI Calculation → Power BI → Interactive Dashboard

---

## 🎯 Project Objective

The main objectives of this project are:

- Analyze bank loan data using SQL
- Extract meaningful business insights
- Calculate important loan portfolio KPIs
- Analyze Good Loans vs. Bad Loans
- Analyze loan status and repayment performance
- Identify monthly loan application trends
- Analyze loans by state, term, employee length, purpose, and home ownership
- Load the analyzed data into Power BI
- Create an interactive dashboard
- Present business insights through effective data visualization

---

## 🛠️ Tools & Technologies

- **PostgreSQL / SQL** – Data analysis and business insights
- **Microsoft Power BI** – Dashboard development and visualization
- **Power Query** – Data transformation and preparation
- **DAX** – KPI and measure calculations
- **GitHub** – Project documentation and version control

---

## 🔄 Project Workflow

    Raw Loan Dataset
            ↓
    Load Data into SQL
            ↓
    SQL Queries & Analysis
            ↓
    Business Insights & KPI Calculation
            ↓
    Load Data into Power BI
            ↓
    Data Transformation & Modeling
            ↓
    DAX Measures
            ↓
    Interactive Power BI Dashboard

---

## 🗄️ Dataset

The dataset contains **38,576 loan records** and **24 columns**.

### Main Columns

| Column | Description |
|---|---|
| `id` | Unique loan ID |
| `address_state` | Borrower's state |
| `application_type` | Type of loan application |
| `emp_length` | Employment length |
| `emp_title` | Employment title |
| `grade` | Loan grade |
| `home_ownership` | Home ownership status |
| `issue_date` | Loan issue date |
| `last_credit_pull_date` | Last credit pull date |
| `last_payment_date` | Last payment date |
| `loan_status` | Current loan status |
| `next_payment_date` | Next payment date |
| `member_id` | Member ID |
| `purpose` | Purpose of the loan |
| `sub_grade` | Loan sub-grade |
| `term` | Loan repayment term |
| `verification_status` | Income verification status |
| `annual_income` | Annual borrower income |
| `dti` | Debt-to-income ratio |
| `installment` | Monthly installment |
| `int_rate` | Interest rate |
| `loan_amount` | Loan amount |
| `total_acc` | Total number of accounts |
| `total_payment` | Total amount received |

---

## 💻 SQL Analysis

The first stage of the project was performed using **SQL**.

I created a `financial_loan` table and used PostgreSQL queries to analyze the loan data and extract the KPIs and business insights required for the Power BI dashboard.

The SQL analysis includes:

### Summary Analysis

- KPI Summary
- Good Loan Analysis
- Bad Loan Analysis
- Loan Status Analysis
- MTD Loan Status Analysis

### Overview Analysis

- Monthly Analysis
- State Analysis
- Term Analysis
- Employee Length Analysis
- Purpose Analysis
- Home Ownership Analysis
- Grade A Filter Analysis

---

## 📊 SQL Business Analysis

### 1. KPI Summary

The SQL analysis calculates:

- Total Loan Applications
- Total Funded Amount
- Total Amount Received
- Average Interest Rate
- Average DTI

The analysis also compares:

- **MTD – Month to Date**
- **PMTD – Previous Month to Date**
- **Total**

In this project:

- **MTD = December**
- **PMTD = November**

---

### 2. Good Loan Analysis

A **Good Loan** is defined as a loan with the status:

- `Fully Paid`
- `Current`

The analysis calculates:

- Good Loan Applications
- Good Loan Funded Amount
- Good Loan Amount Received
- Good Loan Percentage

---

### 3. Bad Loan Analysis

A **Bad Loan** is defined as a loan with the status:

- `Charged Off`

The analysis calculates:

- Bad Loan Applications
- Bad Loan Funded Amount
- Bad Loan Amount Received
- Bad Loan Percentage

---

### 4. Loan Status Analysis

The SQL analysis groups loans by `loan_status` and calculates:

- Loan Count
- Total Amount Received
- Total Funded Amount
- Average Interest Rate
- Average DTI

The major loan statuses are:

- Fully Paid
- Current
- Charged Off

---

### 5. Monthly Analysis

Loan applications are analyzed month by month.

The SQL analysis calculates:

- Total Loan Applications
- Total Funded Amount
- Total Amount Received

This analysis is visualized in Power BI using a monthly trend chart.

---

### 6. State Analysis

Loan applications are analyzed by `address_state`.

The analysis calculates:

- Total Loan Applications
- Total Funded Amount
- Total Amount Received

---

### 7. Term Analysis

Loans are analyzed based on repayment term.

The analysis calculates:

- Total Loan Applications
- Total Funded Amount
- Total Amount Received

---

### 8. Employee Length Analysis

Loan applications are analyzed based on borrower employment length.

The analysis calculates:

- Total Loan Applications
- Total Funded Amount
- Total Amount Received

---

### 9. Purpose Analysis

Loan applications are analyzed based on loan purpose.

The analysis calculates:

- Total Loan Applications
- Total Funded Amount
- Total Amount Received

---

### 10. Home Ownership Analysis

Loan applications are grouped by home ownership status.

The analysis calculates:

- Total Loan Applications
- Total Funded Amount
- Total Amount Received

---

### 11. Grade Analysis

The SQL file also contains a **Grade A filter analysis**.

The analysis filters the dataset using:

`grade = 'A'`

and groups the loans by purpose to validate the Power BI filters.

---

# 📈 Power BI Dashboard

After completing the SQL analysis, I loaded the loan data into **Power BI** and created an interactive dashboard.

The dashboard contains three main pages:

- **Summary**
- **Overview**
- **Details**

---

# 1️⃣ Summary Page

The **Summary** page provides a high-level overview of the loan portfolio.

### KPI Cards

- Total Loan Applications
- Total Funded Amount
- Total Amount Received
- Average Interest Rate
- Average DTI

### Dashboard KPIs

| KPI | Value |
|---|---:|
| Total Loan Applications | 38.6K |
| Total Funded Amount | $435.8M |
| Total Amount Received | $473.1M |
| Average Interest Rate | 12.05% |
| Average DTI | 13.33% |

### Good Loan Performance

| Metric | Value |
|---|---:|
| Good Loan Applications | 33.2K |
| Good Loan Funded Amount | $370.2M |
| Good Loan Total Received | $435.8M |
| Good Loan Percentage | 86.2% |

### Bad Loan Performance

| Metric | Value |
|---|---:|
| Bad Loan Applications | 5.3K |
| Bad Loan Funded Amount | $65.5M |
| Bad Loan Total Received | $37.3M |
| Bad Loan Percentage | 13.8% |

The Summary page also provides a breakdown of:

- Fully Paid
- Current
- Charged Off

---

# 2️⃣ Overview Page

The **Overview** page provides deeper analysis of loan applications across different dimensions.

### Visualizations

- Total Loan Applications by Month
- Total Loan Applications by State
- Total Loan Applications by Loan Term
- Total Loan Applications by Employee Length
- Total Loan Applications by Loan Purpose
- Loan Applications by Home Ownership

These visualizations help identify trends and patterns within the loan portfolio.

---

# 3️⃣ Details Page

The **Details** page provides loan-level information.

The detailed table includes:

- Loan ID
- Loan Purpose
- Home Ownership
- Grade
- Sub-grade
- Issue Date
- Loan Amount
- Interest Rate
- Installment
- Total Payment

This page allows users to explore individual loan records in detail.

---

# 📌 Key Dashboard Metrics

| Metric | Value |
|---|---:|
| Total Loan Applications | 38.6K |
| Total Funded Amount | $435.8M |
| Total Amount Received | $473.1M |
| Average Interest Rate | 12.05% |
| Average DTI | 13.33% |
| Good Loan Applications | 33.2K |
| Good Loan Percentage | 86.2% |
| Bad Loan Applications | 5.3K |
| Bad Loan Percentage | 13.8% |
| Good Loan Funded Amount | $370.2M |
| Bad Loan Funded Amount | $65.5M |

---

# 🔍 Key Insights

Based on the SQL analysis and Power BI dashboard:

- The dataset contains **38,576 loan applications**.
- **Fully Paid** is the largest loan-status category with **32,145 applications**.
- **Current** loans account for **1,098 applications**.
- **Charged Off** loans account for **5,333 applications**.
- Approximately **86.2%** of applications are classified as Good Loans.
- Approximately **13.8%** of applications are classified as Bad Loans.
- The total funded amount is approximately **$435.8M**.
- The total amount received is approximately **$473.1M**.
- The overall average interest rate is **12.05%**.
- The overall average DTI is **13.33%**.
- The portfolio contains both **36-month and 60-month** loan terms.
- **Debt consolidation** represents a major loan purpose in the dashboard.
- Loan applications can be analyzed across states, employee length, purpose, term, and home ownership.

---

# 📊 Dashboard Preview

## Summary
<img width="1331" height="741" alt="Screenshot 2026-09-26 214844" src="https://github.com/user-attachments/assets/308bcab4-5edf-4cef-9e76-cd3a210cf9ff" />

## Overview
<img width="1332" height="747" alt="Screenshot 2026-09-26 214921" src="https://github.com/user-attachments/assets/e6e488e0-2cad-4ac2-bf99-3f0c3b6d8ffb" />

## Details
<img width="1317" height="742" alt="Screenshot 2026-09-26 214947" src="https://github.com/user-attachments/assets/3eecc02a-9064-453b-bde7-cf104c856771" />


---

# 📁 Project Structure

    Bank-Loan-Analysis/
    │
    ├── Dataset/
    │   └── financial_loan.csv
    │
    ├── SQL/
    │   └── Bank Loan Analysis.sql
    │
    ├── PowerBI/
    │   └── Bank Loan Analysis.pbix
    │
    ├── images/
    │   ├── summary.png
    │   ├── overview.png
    │   └── details.png
    │
    └── README.md

---

# ❓ Business Questions Answered

This project answers questions such as:

1. What is the total number of loan applications?
2. What is the total amount funded?
3. What is the total amount received?
4. What is the average interest rate?
5. What is the average DTI?
6. What percentage of loans are classified as Good Loans?
7. What percentage of loans are classified as Bad Loans?
8. How are loans distributed by loan status?
9. How do loan applications change month by month?
10. Which states have the highest number of loan applications?
11. Which loan terms are most common?
12. How do loan applications vary by employee length?
13. What are the most common loan purposes?
14. How are loan applications distributed by home ownership?
15. How can loans be analyzed by grade and sub-grade?
16. What are the characteristics of individual loans?

---

# 💡 Skills Demonstrated

### SQL

- PostgreSQL
- Data Analysis
- Data Aggregation
- SELECT
- WHERE
- GROUP BY
- ORDER BY
- UNION ALL
- COUNT()
- SUM()
- AVG()
- PostgreSQL FILTER
- Date Functions
- Conditional Analysis
- KPI Calculation
- Business-Oriented SQL Queries

### Power BI

- Data Loading
- Data Transformation
- Data Modeling
- DAX
- KPI Cards
- Donut Charts
- Bar Charts
- Line Charts
- Tables
- Slicers
- Interactive Filtering
- Dashboard Navigation
- Data Visualization
- Business Storytelling

---

# 🚀 Project Outcome

This project demonstrates a complete **Data Analytics and Business Intelligence workflow**.

I started by analyzing the raw bank loan dataset using **SQL**, where I extracted important business insights and calculated the required KPIs.

After completing the SQL analysis, I loaded the data into **Power BI** and created an interactive dashboard to present the findings visually.

### Overall Process

**SQL → Analysis → Insights → Power BI → Interactive Dashboard**

This project demonstrates how raw financial data can be transformed into meaningful business insights using SQL and then communicated effectively through Power BI.

---

# 👨‍💻 Author

**Your Name**

### Connect With Me

- LinkedIn: https://www.linkedin.com/in/aditya-khanna2006/
- GitHub: (https://github.com/aditya-khanna2006)

---

⭐ If you found this project useful, consider giving the repository a star!
