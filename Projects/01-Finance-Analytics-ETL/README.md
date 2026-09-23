# Finance Analytics ETL Project

## Project Overview

This project demonstrates an end-to-end Finance Analytics ETL workflow using Python, Excel, MySQL, SQL, and Power BI.

The project focuses on extracting financial data from multiple Excel source files, transforming the data into a structured analytical model, loading it into MySQL, and building Power BI dashboards for financial and operational analysis.

## Business Objective

The objective of this project is to create a structured finance analytics solution that helps analyze:

* Revenue and expenses
* Accounts receivable and accounts payable
* Budget vs actual performance
* Department-level financial performance
* Expense claims
* Monthly financial trends
* Cash flow and outstanding balances

## Tools & Technologies

* **Python** – ETL pipeline and data transformation
* **Pandas** – Data processing and transformation
* **Excel** – Source financial datasets
* **MySQL** – Relational database and data storage
* **SQL** – Database schema and analytical queries
* **Power BI** – Interactive dashboards and visualization
* **GitHub** – Project version control and portfolio documentation

## Data Sources

The project uses the following Excel datasets:

* `General-Ledger.xlsx`
* `Accounts-Payable.xlsx`
* `Accounts-Receivable.xlsx`
* `Budget-Forecast.xlsx`
* `Expense-Claims.xlsx`

## ETL Process

### 1. Extract

Financial data is extracted from multiple Excel files using Python and Pandas.

The source datasets contain information related to:

* General Ledger
* Accounts Payable
* Accounts Receivable
* Budget & Forecast
* Employee Expense Claims

### 2. Transform

The extracted data is cleaned and transformed into a structured analytical model.

The transformation process includes:

* Data cleaning
* Date dimension creation
* Department dimension creation
* Currency dimension creation
* Data type standardization
* Fact table preparation
* Financial metric preparation

### 3. Load

The transformed datasets are loaded into a MySQL database named:

`finance_analytics`

The database contains the following tables:

### Dimension Tables

* `dim_department`
* `dim_currency`
* `dim_date`

### Fact Tables

* `fact_general_ledger`
* `fact_accounts_payable`
* `fact_accounts_receivable`
* `fact_budget_forecast`
* `fact_expense_claims`

## ETL Pipeline

The complete ETL workflow is implemented in:

`etl_pipeline_1.py`

The pipeline performs:

1. Database connection
2. Excel data extraction
3. Dimension table creation
4. Fact table transformation
5. Data loading into MySQL
6. Load validation and logging

The pipeline successfully loads all 8 analytical tables into MySQL.

## Power BI Dashboard

The Power BI dashboard provides an interactive view of the financial data.

### Dashboard Pages

#### 1. P&L Overview

Provides an overview of:

* Total Revenue
* Total Cost
* Net Position
* Monthly financial trends
* Department-level performance

#### 2. Budget vs Actual

Analyzes:

* Total Budget
* Actual Spending
* Variance
* Department-level budget performance

#### 3. Cash Flow

Provides analysis of:

* Accounts Receivable
* Accounts Payable
* Net Cash Flow
* Monthly receivables and payables
* Outstanding status distribution

#### 4. Expense Claims

Analyzes:

* Total Expense Claims
* Number of Claims
* Claims by Status
* Expense Categories
* Employee-level claim details

## Key Analytical Areas

The project enables analysis of:

* Financial performance trends
* Revenue and cost patterns
* Budget utilization
* Department-level performance
* Receivables and payables
* Expense claim patterns
* Financial variances

## Project Structure

```text
01-Finance-Analytics-ETL/
│
├── README.md
│
├── data/
│   ├── General-Ledger.xlsx
│   ├── Accounts-Payable.xlsx
│   ├── Accounts-Receivable.xlsx
│   ├── Budget-Forecast.xlsx
│   └── Expense-Claims.xlsx
│
├── python/
│   └── etl_pipeline_1.py
│
├── sql/
│   └── schema.sql
│
├── dashboard/
│   └── Finance_Analytics_Dashboard.pbix
│
└── screenshots/
    ├── P&L-Overview.png
    ├── Budget-vs-Actual.png
    ├── Cash-Flow.png
    └── Expense-Claims.png
