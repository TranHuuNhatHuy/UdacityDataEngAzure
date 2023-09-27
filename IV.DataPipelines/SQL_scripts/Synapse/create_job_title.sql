-- Drop table if exists
IF OBJECT_ID('dbo.NYC_Payroll_TITLE_MD') IS NOT NULL
    DROP TABLE dbo.NYC_Payroll_TITLE_MD

-- Create Job Title table
CREATE TABLE [dbo].[NYC_Payroll_TITLE_MD] (
    [TitleCode] [varchar](10) NULL,
    [TitleDescription] [varchar](100) NULL
)