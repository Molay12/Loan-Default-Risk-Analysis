-- Loan Default Risk Analysis
-- Manual-review candidates and risk-factor analysis
-- Database: loan_default_analysis
-- Table: loan_default_risk_dataset_molay-loan_default_risk
--
-- Important:
-- These are exploratory rules for a portfolio project, not a validated lending model.
-- Confirm the values in Manual_Review (for example, 'Yes') and all category labels
-- against the actual table before relying on these queries.

-- 1. Count applications meeting at least one exploratory risk indicator
SELECT
    COUNT(*) AS Applications_Meeting_At_Least_One_Indicator,
    SUM(Default_Flag) AS Defaults,
    ROUND(SUM(Default_Flag) * 100.0 / NULLIF(COUNT(*), 0), 2) AS Default_Rate_Pct
FROM loan_default_analysis.`loan_default_risk_dataset_molay-loan_default_risk`
WHERE
       Credit_Score_Group IN ('Poor', 'Fair')
    OR Loan_Amount_Group IN ('High', 'Very High')
    OR DTI_Group = 'Very High'
    OR Missed_Payments >= 2
    OR Employment_Type = 'Unemployed'
    OR Existing_Loan_Group IN ('Moderate', 'High');

-- 2. Review rows already marked Manual_Review = 'Yes'
SELECT
    Customer_ID,
    Credit_Score_Group,
    Loan_Amount_Group,
    DTI_Group,
    Missed_Payments,
    Employment_Type,
    Existing_Loan_Group,
    Default_Flag,
    Manual_Review
FROM loan_default_analysis.`loan_default_risk_dataset_molay-loan_default_risk`
WHERE Manual_Review = 'Yes'
ORDER BY Default_Flag DESC, Customer_ID;

-- 3. Summary for rows already marked for manual review
SELECT
    COUNT(*) AS Manual_Review_Applications,
    SUM(Default_Flag) AS Defaults,
    ROUND(SUM(Default_Flag) * 100.0 / NULLIF(COUNT(*), 0), 2) AS Default_Rate_Pct
FROM loan_default_analysis.`loan_default_risk_dataset_molay-loan_default_risk`
WHERE Manual_Review = 'Yes';

-- 4. Calculate the number of risk indicators for each application.
-- MySQL boolean expressions evaluate to 1 (true) or 0 (false).
-- This query assumes these category labels exactly match your data.
SELECT
    Customer_ID,
    Credit_Score_Group,
    Loan_Amount_Group,
    DTI_Group,
    Missed_Payments,
    Employment_Type,
    Existing_Loan_Group,
    Default_Flag,
    (
        (Credit_Score_Group IN ('Poor', 'Fair')) +
        (Loan_Amount_Group IN ('High', 'Very High')) +
        (DTI_Group = 'Very High') +
        (Missed_Payments >= 2) +
        (Employment_Type = 'Unemployed') +
        (Existing_Loan_Group IN ('Moderate', 'High'))
    ) AS Risk_Factor_Count
FROM loan_default_analysis.`loan_default_risk_dataset_molay-loan_default_risk`
ORDER BY Risk_Factor_Count DESC, Customer_ID;

-- 5. Applications with two or more exploratory risk indicators
-- Default_Flag is shown for retrospective analysis only; it should not be used
-- as an input to a real-time review decision because it is the outcome being analyzed.
SELECT
    Customer_ID,
    Credit_Score_Group,
    Loan_Amount_Group,
    DTI_Group,
    Missed_Payments,
    Employment_Type,
    Existing_Loan_Group,
    Default_Flag,
    (
        (Credit_Score_Group IN ('Poor', 'Fair')) +
        (Loan_Amount_Group IN ('High', 'Very High')) +
        (DTI_Group = 'Very High') +
        (Missed_Payments >= 2) +
        (Employment_Type = 'Unemployed') +
        (Existing_Loan_Group IN ('Moderate', 'High'))
    ) AS Risk_Factor_Count
FROM loan_default_analysis.`loan_default_risk_dataset_molay-loan_default_risk`
WHERE
    (
        (Credit_Score_Group IN ('Poor', 'Fair')) +
        (Loan_Amount_Group IN ('High', 'Very High')) +
        (DTI_Group = 'Very High') +
        (Missed_Payments >= 2) +
        (Employment_Type = 'Unemployed') +
        (Existing_Loan_Group IN ('Moderate', 'High'))
    ) >= 2
ORDER BY Risk_Factor_Count DESC, Customer_ID;

-- 6. Summary of applications with two or more risk indicators
SELECT
    COUNT(*) AS Manual_Review_Candidates,
    SUM(Default_Flag) AS Defaults,
    ROUND(SUM(Default_Flag) * 100.0 / NULLIF(COUNT(*), 0), 2) AS Default_Rate_Pct
FROM (
    SELECT
        Default_Flag,
        (
            (Credit_Score_Group IN ('Poor', 'Fair')) +
            (Loan_Amount_Group IN ('High', 'Very High')) +
            (DTI_Group = 'Very High') +
            (Missed_Payments >= 2) +
            (Employment_Type = 'Unemployed') +
            (Existing_Loan_Group IN ('Moderate', 'High'))
        ) AS Risk_Factor_Count
    FROM loan_default_analysis.`loan_default_risk_dataset_molay-loan_default_risk`
) AS RiskData
WHERE Risk_Factor_Count >= 2;
