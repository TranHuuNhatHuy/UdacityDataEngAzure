USE azuredataeng_udacity;

-- Create external table for staging Rider data
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

-- Fetch first 10 rows from staging table and check them out
SELECT TOP 10 * FROM dbo.stagingRider
GO