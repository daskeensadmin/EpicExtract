USE [EPIC]
GO

/****** Object:  StoredProcedure [dbo].[EPICBulkInsert2017]    Script Date: 8/18/2021 8:50:39 AM ******/
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
-- Build Path_Client table
	Truncate Table Path_Client
	
	BULK INSERT Path_Client 
    FROM 'C:\EPIC Extracts\Path Lending\Path_Client.csv' 
    WITH 
    ( 
       FIRSTROW = 2, 
	   FORMAT='CSV',
       MAXERRORS = 0, 
	   ROWTERMINATOR = '0x0a',
       ERRORFile='C:\EPIC Extracts\Path Lending\ErrorsCL.txt',  
       KEEPNULLS
	)

	-- Add back in when using the new FTP site
	--   ROWTERMINATOR = '0x0a',

-- Build Path_Loan table
   Truncate Table Path_Loan

BULK INSERT Path_Loan 
    FROM 'C:\EPIC Extracts\Path Lending\Path_Loan.csv' 
    WITH 
    ( 
       FIRSTROW = 2, 
       FORMAT='CSV',
       MAXERRORS = 0, 
	   ROWTERMINATOR = '0x0a',
       ERRORFile='C:\EPIC Extracts\Path Lending\ErrorsL.txt',  
       KEEPNULLS
)

-- Add back in when using the new FTP site
	--   ROWTERMINATOR = '0x0a',


-- Build Path_Payment table
Truncate Table Path_Payment

BULK INSERT Path_Payment
    FROM 'C:\EPIC Extracts\Path Lending\Path_Payment.csv' 
    WITH 
    ( 
       FIRSTROW = 2, 
       FORMAT='CSV',
       MAXERRORS = 0, 
	   ROWTERMINATOR = '0x0a',
       ERRORFile='C:\EPIC Extracts\Path Lending\ErrorsPM.txt',  
       KEEPNULLS
)

-- Add back in when using the new FTP site
	--   ROWTERMINATOR = '0x0a',



-- Build Path_Payroll table
	Truncate Table Path_Payroll


BULK INSERT Path_Payroll
    FROM 'C:\EPIC Extracts\Path Lending\Path_Payroll.csv' 
    WITH 
    ( 
        FIRSTROW = 2, 
        FORMAT='CSV',
        MAXERRORS = 0, 
		ROWTERMINATOR = '0x0a',
        ERRORFile='C:\EPIC Extracts\Path Lending\ErrorsPR.txt',  
        KEEPNULLS
)


-- Add back in when using the new FTP site
	--   ROWTERMINATOR = '0x0a',


	 -- Build Path_References table
	 
	 Truncate Table Path_References


BULK INSERT Path_References
    FROM 'C:\EPIC Extracts\Path Lending\Path_References.csv' 
    WITH 
    ( 
        FIRSTROW = 2, 
        FORMAT='CSV',
        MAXERRORS = 0,
		ROWTERMINATOR = '0x0a',
        ERRORFile='C:\EPIC Extracts\Path Lending\ErrorsR.txt',  
        KEEPNULLS 
)


-- Add back in when using the new FTP site
	--   ROWTERMINATOR = '0x0a',

 -- Build Path_References table
Truncate Table Path_Underwriting


BULK INSERT Path_Underwriting
    FROM 'C:\EPIC Extracts\Path Lending\Path_Underwriting.csv' 
    WITH 
    ( 
        FIRSTROW = 2, 
         FORMAT='CSV',
       MAXERRORS = 0, 
	   ROWTERMINATOR = '0x0a',
       ERRORFile='C:\EPIC Extracts\Path Lending\ErrorsU.txt',  
       KEEPNULLS
)


-- Add back in when using the new FTP site
	--   ROWTERMINATOR = '0x0a',
Truncate Table Path_ClientFlags

 -- Build Path_ClientFlags table

BULK INSERT Path_ClientFlags
    FROM 'C:\EPIC Extracts\Path Lending\Path_ClientFlags.csv' 
    WITH 
    ( 
        FIRSTROW = 2, 
        FORMAT='CSV',
        MAXERRORS = 0, 
		ROWTERMINATOR = '0x0a',
        ERRORFile='C:\EPIC Extracts\Path Lending\ErrorsCF.txt',  
        KEEPNULLS 
)


-- Add back in when using the new FTP site
	--   ROWTERMINATOR = '0x0a',

	-- Build Path_LoanHistory table
   Truncate Table Path_LoanHistory

BULK INSERT Path_LoanHistory 
  FROM 'C:\EPIC Extracts\Path Lending\Path_LoanHistory.csv' 
  WITH 
 ( 
       FIRSTROW = 2, 
       FORMAT='CSV',
       MAXERRORS = 0, 
	   ROWTERMINATOR = '0x0a',
       ERRORFile='C:\EPIC Extracts\Path Lending\ErrorsLH.txt',  
       KEEPNULLS
)

-- Add back in when using the new FTP site
	--   ROWTERMINATOR = '0x0a',

-- Build Path_LoanFlags table

Truncate Table Path_LoanFlags

BULK INSERT Path_LoanFlags
    FROM 'C:\EPIC Extracts\Path Lending\Path_LoanFlags.csv' 
    WITH 
    ( 
        FIRSTROW = 2, 
        FORMAT='CSV',
        MAXERRORS = 0, 
		ROWTERMINATOR = '0x0a',
        ERRORFile='C:\EPIC Extracts\Path Lending\ErrorsLF.txt',  
        KEEPNULLS 
)


-- Add back in when using the new FTP site
	--   ROWTERMINATOR = '0x0a',


-- Run Power BI Flat File rebuild  -- 020420
exec FlatFileImport

END
GO

