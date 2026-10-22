-- Loan Default Risk Analysis
-- Data validation and initial inspection
-- Database: loan_default_analysis
-- Table: loan_default_risk_dataset_molay-loan_default_risk

-- 1. Count total rows
SELECT COUNT(*) AS total_rows
FROM loan_default_analysis.`loan_default_risk_dataset_molay-loan_default_risk`;

-- 2. Preview first five rows
SELECT *
FROM loan_default_analysis.`loan_default_risk_dataset_molay-loan_default_risk`
LIMIT 5;

-- 3. Check the distribution of the default flag
-- Expected coding: 0 = no default, 1 = default
SELECT
    Default_Flag,
    COUNT(*) AS Applications
FROM loan_default_analysis.`loan_default_risk_dataset_molay-loan_default_risk`
GROUP BY Default_Flag
ORDER BY Default_Flag;

-- 4. Overall portfolio metrics
SELECT
    COUNT(*) AS Total_Applications,
    SUM(Default_Flag) AS Total_Defaults,
    ROUND(SUM(Default_Flag) * 100.0 / NULLIF(COUNT(*), 0), 2) AS Default_Rate_Pct
FROM loan_default_analysis.`loan_default_risk_dataset_molay-loan_default_risk`;