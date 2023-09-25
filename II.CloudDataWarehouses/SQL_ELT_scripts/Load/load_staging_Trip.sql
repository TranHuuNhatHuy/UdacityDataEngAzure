USE azuredataeng_udacity;

-- Create external table for staging Trip data
CREATE EXTERNAL TABLE dbo.stagingTrip (
    [trip_id] NVARCHAR(1000),
    [rideable_type] NVARCHAR(1000),
    [started_at] NVARCHAR(100),
    [ended_at] NVARCHAR(100),
    [start_station_id] NVARCHAR(1000),
    [end_station_id] NVARCHAR(1000),
    [rider_id] NVARCHAR(10)
) WITH (
    LOCATION = 'source/publictrip.csv',
    DATA_SOURCE = [blobStorage],
    FILE_FORMAT = [SynapseDelimitedTextFormat]
)
GO

-- Fetch first 10 rows from staging table and check them out
SELECT TOP 10 * FROM dbo.stagingTrip
GO