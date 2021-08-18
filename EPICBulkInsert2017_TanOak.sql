USE [TO_EPIC]
GO

/****** Object:  StoredProcedure [dbo].[EPICBulkInsert2017]    Script Date: 8/18/2021 8:47:21 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: 5/02/2018
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[EPICBulkInsert2017] 

AS
BEGIN
-- Build TANOAK_Client table
	Truncate Table TANOAK_Client
	
	BULK INSERT TANOAK_Client 
    FROM 'C:\EPIC Extracts\TanOak\TANOAK_Client.csv' 
    WITH 
    ( 
       FIRSTROW = 2, 
	   FORMAT='CSV',
       MAXERRORS = 0, 
	   ROWTERMINATOR = '0x0a',
       ERRORFile='C:\EPIC Extracts\TanOak\ErrorsCL.txt',  
       KEEPNULLS
	)

	-- Add back in for new import  ROWTERMINATOR = '0x0a',

-- Build TANOAK_Loan table
   Truncate Table TANOAK_Loan

BULK INSERT TANOAK_Loan 
    FROM 'C:\EPIC Extracts\TanOak\TANOAK_Loan.csv' 
    WITH 
    ( 
       FIRSTROW = 2, 
       FORMAT='CSV',
       MAXERRORS = 0, 
	   ROWTERMINATOR = '0x0a',
       ERRORFile='C:\EPIC Extracts\TanOak\ErrorsL.txt',  
       KEEPNULLS
)

-- Add back in for new import  ROWTERMINATOR = '0x0a',

-- Build TANOAK_Payment table
Truncate Table TANOAK_Payment

BULK INSERT TANOAK_Payment
    FROM 'C:\EPIC Extracts\TanOak\TANOAK_Payment.csv' 
    WITH 
    ( 
       FIRSTROW = 2, 
       FORMAT='CSV',
       MAXERRORS = 0, 
	   ROWTERMINATOR = '0x0a',
       ERRORFile='C:\EPIC Extracts\TanOak\ErrorsPM.txt',  
       KEEPNULLS
)
-- Add back in for new import  ROWTERMINATOR = '0x0a',


-- Build TANOAK_Payroll table
	Truncate Table TANOAK_Payroll


BULK INSERT TANOAK_Payroll
    FROM 'C:\EPIC Extracts\TanOak\TANOAK_Payroll.csv' 
    WITH 
    ( 
        FIRSTROW = 2, 
        FORMAT='CSV',
        MAXERRORS = 0, 
		ROWTERMINATOR = '0x0a',
        ERRORFile='C:\EPIC Extracts\TanOak\ErrorsPR.txt',  
        KEEPNULLS
)

-- Add back in for new import  ROWTERMINATOR = '0x0a',

	 -- Build TANOAK_References table
	 
	 Truncate Table TANOAK_References


BULK INSERT TANOAK_References
    FROM 'C:\EPIC Extracts\TanOak\TANOAK_References.csv' 
    WITH 
    ( 
        FIRSTROW = 2, 
        FORMAT='CSV',
        MAXERRORS = 0, 
		ROWTERMINATOR = '0x0a',
        ERRORFile='C:\EPIC Extracts\TanOak\ErrorsR.txt',  
        KEEPNULLS 
)

-- Add back in for new import  ROWTERMINATOR = '0x0a',

 -- Build TANOAK_References table
Truncate Table TANOAK_Underwriting


BULK INSERT TANOAK_Underwriting
    FROM 'C:\EPIC Extracts\TanOak\TANOAK_Underwriting.csv' 
    WITH 
    ( 
        FIRSTROW = 2, 
         FORMAT='CSV',
       MAXERRORS = 0, 
	   ROWTERMINATOR = '0x0a',
       ERRORFile='C:\EPIC Extracts\TanOak\ErrorsU.txt',  
       KEEPNULLS
)

-- Add back in for new import  ROWTERMINATOR = '0x0a',
Truncate Table TANOAK_ClientFlags

 -- Build TANOAK_ClientFlags table

BULK INSERT TANOAK_ClientFlags
    FROM 'C:\EPIC Extracts\TanOak\TANOAK_ClientFlags.csv' 
    WITH 
    ( 
        FIRSTROW = 2, 
        FORMAT='CSV',
        MAXERRORS = 0, 
		ROWTERMINATOR = '0x0a',
        ERRORFile='C:\EPIC Extracts\TanOak\ErrorsCF.txt',  
        KEEPNULLS 
)
-- Add back in for new import  ROWTERMINATOR = '0x0a',

	-- Build TANOAK_LoanHistory table
   Truncate Table TANOAK_LoanHistory

BULK INSERT TANOAK_LoanHistory 
  FROM 'C:\EPIC Extracts\TanOak\TANOAK_LoanHistory.csv' 
  WITH 
 ( 
       FIRSTROW = 2, 
       FORMAT='CSV',
       MAXERRORS = 0, 
	   ROWTERMINATOR = '0x0a',
       ERRORFile='C:\EPIC Extracts\TanOak\ErrorsLH.txt',  
       KEEPNULLS
)
-- Add back in for new import  ROWTERMINATOR = '0x0a',


Truncate Table TANOAK_LoanFlags

 -- Build TANOAK_ClientFlags table

BULK INSERT TANOAK_LoanFlags
    FROM 'C:\EPIC Extracts\TanOak\TANOAK_LoanFlags.csv' 
    WITH 
    ( 
        FIRSTROW = 2, 
        FORMAT='CSV',
        MAXERRORS = 0, 
		ROWTERMINATOR = '0x0a',
        ERRORFile='C:\EPIC Extracts\TanOak\ErrorsLF.txt',  
        KEEPNULLS 
)

-- Add back in for new import  ROWTERMINATOR = '0x0a',
-- Run Power BI Flat File rebuild  -- 020420
exec flatfileimport


END
GO

