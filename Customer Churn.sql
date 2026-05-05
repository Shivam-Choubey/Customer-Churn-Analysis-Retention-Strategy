CREATE DATABASE Customer_DB

USE Customer_DB

SELECT * FROM Customer_Data


---------------------------------------------------------------
SELECT Gender, Count(Gender) AS TotalCount,
Count(Gender) * 100.0 / (SELECT Count(*) from Customer_Data)  AS Percentage
FROM Customer_Data
GROUP BY Gender


----------------------------------------------------------------
SELECT Contract, Count(Contract) AS TotalCount,
Count(Contract) * 100.0 / (SELECT Count(*) from Customer_Data)  AS Percentage
FROM Customer_Data
GROUP BY Contract


-------------------------------------------------------------------------
SELECT Customer_Status, COUNT(Customer_Status) AS Total_Count, SUM(Total_Revenue) AS Total_Revenue,
SUM(Total_Revenue) / (Select sum(Total_Revenue) FROM Customer_Data) * 100  AS Revenue_Percentage
FROM Customer_Data
GROUP BY Customer_Status


-------------------------------------------------------------------------
SELECT TOP 10 State, COUNT(State) AS TotalCount,
COUNT(State) * 100.0 / (Select COUNT(*) FROM Customer_Data)  AS Percentage
from Customer_Data
Group by State
ORDER BY Percentage DESC


--- Checking the null values
SELECT 
    SUM(CASE WHEN Customer_ID IS NULL THEN 1 ELSE 0 END) AS Customer_ID_Null_Count,
    SUM(CASE WHEN Gender IS NULL THEN 1 ELSE 0 END) AS Gender_Null_Count,
    SUM(CASE WHEN Age IS NULL THEN 1 ELSE 0 END) AS Age_Null_Count,
    SUM(CASE WHEN Married IS NULL THEN 1 ELSE 0 END) AS Married_Null_Count,
    SUM(CASE WHEN State IS NULL THEN 1 ELSE 0 END) AS State_Null_Count,
    SUM(CASE WHEN Number_of_Referrals IS NULL THEN 1 ELSE 0 END) AS Number_of_Referrals_Null_Count,
    SUM(CASE WHEN Tenure_in_Months IS NULL THEN 1 ELSE 0 END) AS Tenure_in_Months_Null_Count,
    SUM(CASE WHEN Value_Deal IS NULL THEN 1 ELSE 0 END) AS Value_Deal_Null_Count,
    SUM(CASE WHEN Phone_Service IS NULL THEN 1 ELSE 0 END) AS Phone_Service_Null_Count,
    SUM(CASE WHEN Multiple_Lines IS NULL THEN 1 ELSE 0 END) AS Multiple_Lines_Null_Count,
    SUM(CASE WHEN Internet_Service IS NULL THEN 1 ELSE 0 END) AS Internet_Service_Null_Count,
    SUM(CASE WHEN Internet_Type IS NULL THEN 1 ELSE 0 END) AS Internet_Type_Null_Count,
    SUM(CASE WHEN Online_Security IS NULL THEN 1 ELSE 0 END) AS Online_Security_Null_Count,
    SUM(CASE WHEN Online_Backup IS NULL THEN 1 ELSE 0 END) AS Online_Backup_Null_Count,
    SUM(CASE WHEN Device_Protection_Plan IS NULL THEN 1 ELSE 0 END) AS Device_Protection_Plan_Null_Count,
    SUM(CASE WHEN Premium_Support IS NULL THEN 1 ELSE 0 END) AS Premium_Support_Null_Count,
    SUM(CASE WHEN Streaming_TV IS NULL THEN 1 ELSE 0 END) AS Streaming_TV_Null_Count,
    SUM(CASE WHEN Streaming_Movies IS NULL THEN 1 ELSE 0 END) AS Streaming_Movies_Null_Count,
    SUM(CASE WHEN Streaming_Music IS NULL THEN 1 ELSE 0 END) AS Streaming_Music_Null_Count,
    SUM(CASE WHEN Unlimited_Data IS NULL THEN 1 ELSE 0 END) AS Unlimited_Data_Null_Count,
    SUM(CASE WHEN Contract IS NULL THEN 1 ELSE 0 END) AS Contract_Null_Count,
    SUM(CASE WHEN Paperless_Billing IS NULL THEN 1 ELSE 0 END) AS Paperless_Billing_Null_Count,
    SUM(CASE WHEN Payment_Method IS NULL THEN 1 ELSE 0 END) AS Payment_Method_Null_Count,
    SUM(CASE WHEN Monthly_Charge IS NULL THEN 1 ELSE 0 END) AS Monthly_Charge_Null_Count,
    SUM(CASE WHEN Total_Charges IS NULL THEN 1 ELSE 0 END) AS Total_Charges_Null_Count,
    SUM(CASE WHEN Total_Refunds IS NULL THEN 1 ELSE 0 END) AS Total_Refunds_Null_Count,
    SUM(CASE WHEN Total_Extra_Data_Charges IS NULL THEN 1 ELSE 0 END) AS Total_Extra_Data_Charges_Null_Count,
    SUM(CASE WHEN Total_Long_Distance_Charges IS NULL THEN 1 ELSE 0 END) AS Total_Long_Distance_Charges_Null_Count,
    SUM(CASE WHEN Total_Revenue IS NULL THEN 1 ELSE 0 END) AS Total_Revenue_Null_Count,
    SUM(CASE WHEN Customer_Status IS NULL THEN 1 ELSE 0 END) AS Customer_Status_Null_Count,
    SUM(CASE WHEN Churn_Category IS NULL THEN 1 ELSE 0 END) AS Churn_Category_Null_Count,
    SUM(CASE WHEN Churn_Reason IS NULL THEN 1 ELSE 0 END) AS Churn_Reason_Null_Count
FROM Customer_Data;


----
SELECT 
    Customer_ID,
    Gender,
    Age,
    Married,
    State,
    Number_of_Referrals,
    Tenure_in_Months,
    ISNULL(Value_Deal, 'None') AS Value_Deal,
    Phone_Service,
    -- We cast to VARCHAR so we can mix the original data with the string 'No'
    ISNULL(CAST(Multiple_Lines AS VARCHAR(5)), 'No') As Multiple_Lines,
    Internet_Service,
    ISNULL(Internet_Type, 'None') AS Internet_Type,
    ISNULL(CAST(Online_Security AS VARCHAR(5)), 'No') AS Online_Security,
    ISNULL(CAST(Online_Backup AS VARCHAR(5)), 'No') AS Online_Backup,
    ISNULL(CAST(Device_Protection_Plan AS VARCHAR(5)), 'No') AS Device_Protection_Plan,
    ISNULL(CAST(Premium_Support AS VARCHAR(5)), 'No') AS Premium_Support,
    ISNULL(CAST(Streaming_TV AS VARCHAR(5)), 'No') AS Streaming_TV,
    ISNULL(CAST(Streaming_Movies AS VARCHAR(5)), 'No') AS Streaming_Movies,
    ISNULL(CAST(Streaming_Music AS VARCHAR(5)), 'No') AS Streaming_Music,
    ISNULL(CAST(Unlimited_Data AS VARCHAR(5)), 'No') AS Unlimited_Data,
    Contract,
    Paperless_Billing,
    Payment_Method,
    Monthly_Charge,
    Total_Charges,
    Total_Refunds,
    Total_Extra_Data_Charges,
    Total_Long_Distance_Charges,
    Total_Revenue,
    Customer_Status,
    ISNULL(Churn_Category, 'Others') AS Churn_Category,
    ISNULL(Churn_Reason , 'Others') AS Churn_Reason

INTO Customer_DB.[dbo].[prod_Churn]
FROM Customer_DB.[dbo].Customer_Data;

--------Creati ng the iew table
CREATE VIEW vw_ChurnData AS
    SELECT * FROM prod_Churn WHERE Customer_Status In ('Churned', 'Stayed')

Create View vw_JoinData as
    select * from prod_Churn where Customer_Status = 'Joined'





