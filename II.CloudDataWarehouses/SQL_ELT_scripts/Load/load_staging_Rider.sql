USE azuredataeng_udacity;

-- Drop table if exists
IF OBJECT_ID('dbo.stagingRider') IS NOT NULL
    DROP EXTERNAL TABLE dbo.stagingRider

-- Create external staging table for Rider data
CREATE EXTERNAL TABLE dbo.stagingRider (
    [rider_id] NVARCHAR(10),
    [first] NVARCHAR(100),
    [last] NVARCHAR(100),
    [address] NVARCHAR(1000),
    [birthday] NVARCHAR(100),
    [account_start_date] NVARCHAR(100),
    [account_end_date] NVARCHAR(100),
    [is_member] NVARCHAR(10)
) WITH (
    LOCATION = 'source/publicrider.csv',
    DATA_SOURCE = [blobStorage],
    FILE_FORMAT = [SynapseDelimitedTextFormat]
)
GO

-- Check
SELECT TOP 10 * FROM dbo.stagingRider
GO