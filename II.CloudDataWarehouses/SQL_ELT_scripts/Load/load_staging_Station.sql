USE azuredataeng_udacity;

-- Create external table for staging Station data
CREATE EXTERNAL TABLE dbo.stagingStation (
    [station_id] NVARCHAR(1000),
    [name] NVARCHAR(1000),
    [latitude] FLOAT,
    [longitude] FLOAT
) WITH (
    LOCATION = 'source/publicstation.csv',
    DATA_SOURCE = [blobStorage],
    FILE_FORMAT = [SynapseDelimitedTextFormat]
)
GO

-- Fetch first 10 rows from staging table and check them out
SELECT TOP 10 * FROM dbo.stagingStation
GO