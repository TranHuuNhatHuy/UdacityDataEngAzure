USE azuredataeng_udacity;

-- Drop table if exists
IF OBJECT_ID('dbo.stagingDate') IS NOT NULL
    DROP EXTERNAL TABLE dbo.stagingDate

-- Create external staging table for Date data
CREATE EXTERNAL TABLE dbo.stagingDate (
    [date_id] VARCHAR(10),
    [day] INT,
    [month] INT,
    [quarter] INT,
    [year] BIGINT,
    [day_of_week] INT,
    [day_of_year] INT
) WITH (
    LOCATION = 'source/publicdate.csv',
    DATA_SOURCE = [blobStorage],
    FILE_FORMAT = [SynapseDelimitedTextFormat]
)
GO

-- Check
SELECT TOP 10 * FROM dbo.stagingDate
GO