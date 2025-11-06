SELECT CARRYING_CAPACITY
FROM dbo.[motor_data14-2018];

UPDATE dbo.[motor_data14-2018]
SET CARRYING_CAPACITY = 147
WHERE CARRYING_CAPACITY IS NULL OR CARRYING_CAPACITY = '';

SELECT *
FROM dbo.[motor_data14-2018];

SELECT 
    COUNT(*) AS Total_Policies,
    COUNT(DISTINCT OBJECT_ID) AS Unique_Vehicles,
    ROUND(AVG(PREMIUM), 2) AS Avg_Premium,
    ROUND(AVG(INSURED_VALUE), 2) AS Avg_Insured_Value,
    ROUND(SUM(CLAIM_PAID), 2) AS Total_Claims_Paid
FROM dbo.[motor_data14-2018];

SELECT 
    TYPE_VEHICLE,
    COUNT(*) AS Total_Policies,
    ROUND(SUM(PREMIUM), 2) AS Total_Premium,
    ROUND(SUM(CLAIM_PAID), 2) AS Total_Claims,
    ROUND(SUM(CLAIM_PAID) / SUM(PREMIUM) * 100, 2) AS Claim_Ratio_Percent
FROM dbo.[motor_data14-2018]
GROUP BY TYPE_VEHICLE
ORDER BY Total_Claims DESC;

SELECT 
    MAKE,
    COUNT(*) AS Policy_Count,
    ROUND(AVG(PREMIUM), 2) AS Avg_Premium,
    ROUND(AVG(INSURED_VALUE), 2) AS Avg_Value,
    ROUND(SUM(CLAIM_PAID), 2) AS Total_Claims
FROM dbo.[motor_data14-2018]
GROUP BY MAKE
ORDER BY Total_Claims DESC;

SELECT 
    YEAR(INSR_BEGIN) AS Policy_Year,
    COUNT(*) AS Policy_Count,
    ROUND(SUM(PREMIUM), 2) AS Total_Premium,
    ROUND(SUM(CLAIM_PAID), 2) AS Total_Claims
FROM dbo.[motor_data14-2018]
GROUP BY YEAR(INSR_BEGIN)
ORDER BY Policy_Year;

SELECT 
    SEX,
    COUNT(*) AS Total_Policies,
    ROUND(AVG(PREMIUM), 2) AS Avg_Premium,
    ROUND(SUM(CLAIM_PAID), 2) AS Total_Claims,
    ROUND(SUM(CLAIM_PAID)/COUNT(*), 2) AS Avg_Claim_Per_Policy
FROM dbo.[motor_data14-2018]
GROUP BY SEX;

SELECT 
    USAGE,
    COUNT(*) AS Total_Policies,
    ROUND(SUM(PREMIUM), 2) AS Total_Premium,
    ROUND(SUM(CLAIM_PAID), 2) AS Total_Claims,
    ROUND(SUM(CLAIM_PAID) / SUM(PREMIUM) * 100, 2) AS Claim_Ratio_Percent
FROM dbo.[motor_data14-2018]
GROUP BY USAGE
ORDER BY Claim_Ratio_Percent DESC;

SELECT 
    CCM_TON,
    ROUND(AVG(PREMIUM), 2) AS Avg_Premium,
    ROUND(AVG(INSURED_VALUE), 2) AS Avg_Value,
    ROUND(AVG(CLAIM_PAID), 2) AS Avg_Claim
FROM dbo.[motor_data14-2018]
GROUP BY CCM_TON
ORDER BY CCM_TON;


SELECT 
	OBJECT_ID,
    MAKE,
    TYPE_VEHICLE,
    INSR_BEGIN,
    INSR_END,
    CLAIM_PAID
FROM dbo.[motor_data14-2018]
WHERE CLAIM_PAID IS NOT NULL
ORDER BY CLAIM_PAID DESC;

SELECT 
    MAKE,
    COUNT(*) AS Total_Policies,
    COUNT(CASE WHEN CLAIM_PAID > 0 THEN 1 END) AS Policies_With_Claims,
    ROUND( (COUNT(CASE WHEN CLAIM_PAID > 0 THEN 1 END) / COUNT(*)) * 100, 2) AS Claim_Frequency_Percent
FROM DBO.[motor_data14-2018]
GROUP BY MAKE
ORDER BY Claim_Frequency_Percent DESC;

SELECT 
    ROUND(SUM(CLAIM_PAID) / SUM(INSURED_VALUE) * 100, 2) AS Claim_to_Value_Ratio_Percent
FROM DBO.[motor_data14-2018]
WHERE CLAIM_PAID IS NOT NULL;




