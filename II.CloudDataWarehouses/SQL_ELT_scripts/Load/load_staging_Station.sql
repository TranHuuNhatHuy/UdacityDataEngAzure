USE azuredataeng_udacity;

-- Drop table if exists
IF OBJECT_ID('dbo.stagingStation') IS NOT NULL
    DROP EXTERNAL TABLE dbo.stagingStation

-- Create external staging table for Station data
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

-- Check
SELECT TOP 10 * FROM dbo.stagingStation
GO