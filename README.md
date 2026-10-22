Loan Default Risk Analysis | SQL & Power BI

Project Overview

The Loan Default Risk Analysis project analyzes loan application data to identify customer segments with higher default rates and applications that may require manual credit-risk review.

Using MySQL and Microsoft Power BI, this project transforms raw data into meaningful business insights through SQL queries, data analysis, KPIs, and interactive dashboards.

Business Question: Which customer segments have the highest loan default rates, and which applications should the credit team prioritize for manual review?

Business Objectives

- Analyze loan applications and overall default rates.
- Identify customer segments with higher default rates.
- Compare default rates by income group, loan type, employment history, and geography.
- Investigate credit scores, debt-to-income ratios, missed payments, and loan amounts.
- Identify applications that may need additional manual review.
- Present findings through an interactive Power BI dashboard.

Tools and Technologies

- MySQL: Data validation, SQL queries, aggregations, and segmentation analysis.
- Microsoft Power BI: Dashboard development, KPIs, and data visualization.
- SQL: Filtering, grouping, conditional logic, and percentage calculations.
- DAX: Measures and calculations for dashboard reporting.
- GitHub: Project version control and portfolio presentation.

Project Structure


Loan-Default-Risk-Analysis/
│
├── dashboard/
│   └── Loan_Default_Risk_Analysis.pbix
│
├── screenshots/
│   ├── page1_Loan_Risk_Analysis.png
│   └── page2_default_Risk_analysis.png
│
├── sql/
│   ├── data_validation.sql
│   ├── default_rate_analysis.sql
│   └── manual_review_logic.sql
│
└── README.md


Dataset Overview

The project uses a loan-risk dataset containing customer and loan application information, including a target variable representing whether a default occurred.

Key fields used in the analysis include:

- Customer ID
- Credit Score and Credit Score Group
- Income Group
- Loan Amount
- Loan Type
- Debt-to-Income Ratio
- Missed Payments
- Employment Type and Employment History
- Region and City Tier
- Default Flag
- Manual Review Flag

**Target variable: `Default_Flag`**

- `0` — No recorded default
- `1` — Recorded default

The dataset is used for analytical and educational purposes. Any dataset shared publicly should be permitted for redistribution and should not contain confidential personal information.

SQL Analysis

The SQL scripts are organized into three files.

1. Data Validation — `data_validation.sql`

- Check the total number of applications.
- Examine default and non-default records.
- Calculate the overall default rate.
- Validate important dataset fields and summary statistics.

2. Default Rate Analysis — `default_rate_analysis.sql`

- Analyze default rates by credit score group.
- Compare default rates across income groups.
- Examine default rates by loan type and employment type.
- Investigate regional differences and other available customer segments.

3. Manual Review Logic — `manual_review_logic.sql`

- Examine existing manual-review flags.
- Identify applications matching selected risk indicators.
- Compare application counts and default rates for reviewed records.
- Support the prioritization of applications for further investigation.

Power BI Dashboard

The Power BI report contains two pages.

Page 1: Loan Risk Analysis — Manual Review Dashboard

This page focuses on identifying applications that may need additional investigation.

Key elements include:

- Loan application and default-related KPIs.
- Manual-review application counts.
- Risk-factor distribution.
- Manual-review analysis by employment type.
- Credit score, loan amount, and debt-to-income risk analysis.
- Manual Review Action Center table to help examine flagged applications.

Purpose: Help a credit-risk team identify applications that may warrant further manual review.

Page 2: Default Risk Analysis

This page explores how default rates differ across customer segments.

Key visualizations include:

- Default Rate by Income Bracket
- Default Rate by Loan Type
- Default Rate by Employment History
- Default Rate by Region

Purpose: Understand historical default patterns and identify customer segments that may require closer monitoring.

Key Findings

The current dataset analysis reports the following figures:

|      Metric            | Result|
|------------------------|-------|
| Total Loan Applications| 5,000 |
| Total Defaults         | 1,023 |
| Overall Default Rate   | 20.46%|

These results provide a starting point for investigating default patterns across customer segments.

The figures describe the analyzed dataset and should not be interpreted as a guarantee of future default rates or as evidence that the manual-review rules are a validated credit-risk model.

Business Value

This project demonstrates how SQL and Power BI can be used to:

- Convert raw data into meaningful business metrics.
- Compare customer segments using default-rate analysis.
- Identify risk indicators for further investigation.
- Build an interactive dashboard for business reporting.
- Support more structured manual-review prioritization.
- Communicate analytical findings clearly to business stakeholders.

Limitations

- The analysis describes historical data and does not establish causation.
- Manual-review rules are exploratory and have not been established as a validated lending model.
- The dashboard does not guarantee future loan-default predictions.
- Real-world lending decisions require appropriate model validation, fairness checks, regulatory compliance, and human oversight.
- Results depend on the quality and completeness of the source dataset.

How to Explore the Project

1. Open the SQL scripts in the `sql/` folder to review the analysis.
2. Open `dashboard/Loan_Default_Risk_Analysis.pbix` using Microsoft Power BI Desktop.
3. Explore both dashboard pages and their visualizations.
4. View the dashboard screenshots in the `screenshots/` folder.

Author

Molay Mohanta

Computer Science and Engineering Graduate

Areas of Interest: Data Analytics, Business Analytics, SQL, Power BI, and Data-Driven Decision Making.
