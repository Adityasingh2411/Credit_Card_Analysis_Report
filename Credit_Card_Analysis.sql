Create database ccdb;
use ccdb;

-- 1)Creating tables

CREATE TABLE cc_detail (
    Client_Num INT,
    Card_Category VARCHAR(20),
    Annual_Fees INT,
    Activation_30_Days INT,
    Customer_Acq_Cost INT,
    Week_Start_Date nVarchar(50),
    Week_Num VARCHAR(20),
    Qtr VARCHAR(10),
    current_year INT,
    Credit_Limit DECIMAL(10,2),
    Total_Revolving_Bal INT,
    Total_Trans_Amt INT,
    Total_Trans_Ct INT,
    Avg_Utilization_Ratio DECIMAL(10,3),
    Use_Chip VARCHAR(10),
    Exp_Type VARCHAR(50),
    Interest_Earned DECIMAL(10,3),
    Delinquent_Acc VARCHAR(5)
);

CREATE TABLE cust_detail (
    Client_Num INT,
    Customer_Age INT,
    Gender VARCHAR(5),
    Dependent_Count INT,
    Education_Level VARCHAR(50),
    Marital_Status VARCHAR(20),
    State_cd VARCHAR(50),
    Zipcode VARCHAR(20),
    Car_Owner VARCHAR(5),
    House_Owner VARCHAR(5),
    Personal_Loan VARCHAR(5),
    Contact VARCHAR(50),
    Customer_Job VARCHAR(50),
    Income INT,
    Cust_Satisfaction_Score INT
);

-- 3. Copy csv data into SQL
-- copy cc_detail table

BULK INSERT cc_detail
FROM "D:\My Space\CASE Studies\Credit_card_transaction\credit_card.csv"
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,  -- Skips the header
    FIELDTERMINATOR = ',',  
    ROWTERMINATOR = '\n',
    TABLOCK
);

select *
from cc_detail;

 select 
 Week_Start_Date,
 CASE 
 WHEN Week_Start_Date LIKE '[0-9][0-9]%-[0-9][0-9]%-[0-9][0-9][0-9][0-9]' THEN
            CASE 
                WHEN TRY_CAST(SUBSTRING(Week_Start_Date, 4, 2) AS INT) > 12 
                    THEN TRY_CONVERT(DATE, Week_Start_Date, 110) 
                ELSE TRY_CONVERT(DATE, Week_Start_Date, 105) 
				end
 WHEN Week_Start_Date LIKE '[0-9][0-9][0-9][0-9]%-[0-9][0-9]%-[0-9][0-9]'THEN
            CASE 
                WHEN TRY_CAST(SUBSTRING(Week_Start_Date, 6, 2) AS INT) <= 12 
                    THEN TRY_CONVERT(DATE, Week_Start_Date, 120)
                ELSE null 
				end
           
 END as parsed_date
 from cc_detail;

 update cc_detail
 set Week_Start_Date =
 CASE 
 WHEN Week_Start_Date LIKE '[0-9][0-9]%-[0-9][0-9]%-[0-9][0-9][0-9][0-9]' THEN
            CASE 
                WHEN TRY_CAST(SUBSTRING(Week_Start_Date, 4, 2) AS INT) > 12 
                    THEN TRY_CONVERT(DATE, Week_Start_Date, 110) 
                ELSE TRY_CONVERT(DATE, Week_Start_Date, 105) 
				end
WHEN Week_Start_Date LIKE '[0-9][0-9][0-9][0-9]%-[0-9][0-9]%-[0-9][0-9]'THEN
            CASE 
                WHEN TRY_CAST(SUBSTRING(Week_Start_Date, 6, 2) AS INT) <= 12 
                    THEN TRY_CONVERT(DATE, Week_Start_Date, 120)
                ELSE null 
				end
            END ;
alter table cc_detail
alter column Week_Start_Date Date;


BULK INSERT cust_detail
FROM "D:\My Space\CASE Studies\Credit_card_transaction\customer.csv"
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2, 
    FIELDTERMINATOR = ',',  
    ROWTERMINATOR = '\n',
    TABLOCK
);

select *
from cust_detail;

-- inserting new data to check refresh in power bi
-- weeknumday is date and data is not properly formatted so first need to 
-- changed date to nvarchar inserted data fixed format then changed it back to date

alter table cc_detail
alter column Week_Start_Date nvarchar(50);

BULK INSERT cc_detail
FROM "D:\My Space\CASE Studies\Credit_card_transaction\cc_add.csv"
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2, 
    FIELDTERMINATOR = ',',  
    ROWTERMINATOR = '\n',
    TABLOCK
);

BULK INSERT cust_detail
FROM "D:\My Space\CASE Studies\Credit_card_transaction\cust_add.csv"
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',  
    ROWTERMINATOR = '\n',
    TABLOCK
);