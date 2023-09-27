-- Drop table if exists
IF OBJECT_ID('dbo.NYC_Payroll_EMP_MD') IS NOT NULL
    DROP TABLE dbo.NYC_Payroll_EMP_MD

-- Create Employee Master Data table
CREATE TABLE [dbo].[NYC_Payroll_EMP_MD] (
    [EmployeeID] [varchar](10) NULL,
    [LastName] [varchar](20) NULL,
    [FirstName] [varchar](20) NULL
)