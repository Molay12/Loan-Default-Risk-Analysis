-- Loan Default Risk Analysis
-- Default-rate segmentation queries
-- Database: loan_default_analysis
-- Table: loan_default_risk_dataset_molay-loan_default_risk
-- Assumption: Default_Flag is coded 0/1, with 1 representing default.

-- 1. Default rate by credit score group
SELECT
    Credit_Score_Group,
    COUNT(*) AS Applications,
    SUM(Default_Flag) AS Defaults,
    ROUND(SUM(Default_Flag) * 100.0 / NULLIF(COUNT(*), 0), 2) AS Default_Rate_Pct
FROM loan_default_analysis.`loan_default_risk_dataset_molay-loan_default_risk`
GROUP BY Credit_Score_Group
ORDER BY Default_Rate_Pct DESC;

-- 2. Default rate by income group
SELECT
    Income_Group,
    COUNT(*) AS Applications,
    SUM(Default_Flag) AS Defaults,
    ROUND(SUM(Default_Flag) * 100.0 / NULLIF(COUNT(*), 0), 2) AS Default_Rate_Pct
FROM loan_default_analysis.`loan_default_risk_dataset_molay-loan_default_risk`
GROUP BY Income_Group
ORDER BY Default_Rate_Pct DESC;

-- 3. Default rate by loan type
SELECT
    Loan_Type,
    COUNT(*) AS Applications,
    SUM(Default_Flag) AS Defaults,
    ROUND(SUM(Default_Flag) * 100.0 / NULLIF(COUNT(*), 0), 2) AS Default_Rate_Pct
FROM loan_default_analysis.`loan_default_risk_dataset_molay-loan_default_risk`
GROUP BY Loan_Type
ORDER BY Default_Rate_Pct DESC;

-- 4. Default rate by missed payments
SELECT
    Missed_Payments,
    COUNT(*) AS Applications,
    SUM(Default_Flag) AS Defaults,
    ROUND(SUM(Default_Flag) * 100.0 / NULLIF(COUNT(*), 0), 2) AS Default_Rate_Pct
FROM loan_default_analysis.`loan_default_risk_dataset_molay-loan_default_risk`
GROUP BY Missed_Payments
ORDER BY Missed_Payments;

-- 5. Default rate by DTI group
-- Confirm that DTI_Group is the actual column name in your table.
SELECT
    DTI_Group,
    COUNT(*) AS Applications,
    SUM(Default_Flag) AS Defaults,
    ROUND(SUM(Default_Flag) * 100.0 / NULLIF(COUNT(*), 0), 2) AS Default_Rate_Pct
FROM loan_default_analysis.`loan_default_risk_dataset_molay-loan_default_risk`
GROUP BY DTI_Group
ORDER BY Default_Rate_Pct DESC;

-- 6. Default rate by late payments
SELECT
    Late_Payments,
    COUNT(*) AS Applications,
    SUM(Default_Flag) AS Defaults,
    ROUND(SUM(Default_Flag) * 100.0 / NULLIF(COUNT(*), 0), 2) AS Default_Rate_Pct
FROM loan_default_analysis.`loan_default_risk_dataset_molay-loan_default_risk`
GROUP BY Late_Payments
ORDER BY Late_Payments;

-- 7. Default rate by employment type
SELECT
    Employment_Type,
    COUNT(*) AS Applications,
    SUM(Default_Flag) AS Defaults,
    ROUND(SUM(Default_Flag) * 100.0 / NULLIF(COUNT(*), 0), 2) AS Default_Rate_Pct
FROM loan_default_analysis.`loan_default_risk_dataset_molay-loan_default_risk`
GROUP BY Employment_Type
ORDER BY Default_Rate_Pct DESC;

-- 8. Default rate by region
SELECT
    Region,
    COUNT(*) AS Applications,
    SUM(Default_Flag) AS Defaults,
    ROUND(SUM(Default_Flag) * 100.0 / NULLIF(COUNT(*), 0), 2) AS Default_Rate_Pct
FROM loan_default_analysis.`loan_default_risk_dataset_molay-loan_default_risk`
GROUP BY Region
ORDER BY Default_Rate_Pct DESC;

-- 9. Default rate by employment-years group
SELECT
    Employment_Years_Group,
    COUNT(*) AS Applications,
    SUM(Default_Flag) AS Defaults,
    ROUND(SUM(Default_Flag) * 100.0 / NULLIF(COUNT(*), 0), 2) AS Default_Rate_Pct
FROM loan_default_analysis.`loan_default_risk_dataset_molay-loan_default_risk`
GROUP BY Employment_Years_Group
ORDER BY Default_Rate_Pct DESC;

-- 10. Default rate by existing-loan group
SELECT
    Existing_Loan_Group,
    COUNT(*) AS Applications,
    SUM(Default_Flag) AS Defaults,
    ROUND(SUM(Default_Flag) * 100.0 / NULLIF(COUNT(*), 0), 2) AS Default_Rate_Pct
FROM loan_default_analysis.`loan_default_risk_dataset_molay-loan_default_risk`
GROUP BY Existing_Loan_Group
ORDER BY Default_Rate_Pct DESC;

-- 11. Default rate by loan-amount group
SELECT
    Loan_Amount_Group,
    COUNT(*) AS Applications,
    SUM(Default_Flag) AS Defaults,
    ROUND(SUM(Default_Flag) * 100.0 / NULLIF(COUNT(*), 0), 2) AS Default_Rate_Pct
FROM loan_default_analysis.`loan_default_risk_dataset_molay-loan_default_risk`
GROUP BY Loan_Amount_Group
ORDER BY Default_Rate_Pct DESC;

-- 12. Default rate by interest-rate group
SELECT
    Interest_Rate_Group,
    COUNT(*) AS Applications,
    SUM(Default_Flag) AS Defaults,
    ROUND(SUM(Default_Flag) * 100.0 / NULLIF(COUNT(*), 0), 2) AS Default_Rate_Pct
FROM loan_default_analysis.`loan_default_risk_dataset_molay-loan_default_risk`
GROUP BY Interest_Rate_Group
ORDER BY Default_Rate_Pct DESC;

-- 13. Default rate by property ownership
SELECT
    Property_Ownership,
    COUNT(*) AS Applications,
    SUM(Default_Flag) AS Defaults,
    ROUND(SUM(Default_Flag) * 100.0 / NULLIF(COUNT(*), 0), 2) AS Default_Rate_Pct
FROM loan_default_analysis.`loan_default_risk_dataset_molay-loan_default_risk`
GROUP BY Property_Ownership
ORDER BY Default_Rate_Pct DESC;

-- 14. Default rate by city tier
SELECT
    City_Tier,
    COUNT(*) AS Applications,
    SUM(Default_Flag) AS Defaults,
    ROUND(SUM(Default_Flag) * 100.0 / NULLIF(COUNT(*), 0), 2) AS Default_Rate_Pct
FROM loan_default_analysis.`loan_default_risk_dataset_molay-loan_default_risk`
GROUP BY City_Tier
ORDER BY Default_Rate_Pct DESC;