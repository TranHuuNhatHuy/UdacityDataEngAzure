-- Drop table if exists
IF OBJECT_ID('dbo.NYC_Payroll_AGENCY_MD') IS NOT NULL
    DROP TABLE dbo.NYC_Payroll_AGENCY_MD

-- Create Agency Master table
CREATE TABLE [dbo].[NYC_Payroll_AGENCY_MD] (
    [AgencyID] [varchar](10) NULL,
    [AgencyName] [varchar](50) NULL
)