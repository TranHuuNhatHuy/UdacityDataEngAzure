USE azuredataeng_udacity;

-- Drop table if exists
IF OBJECT_ID('dbo.dim_Station') IS NOT NULL
    DROP EXTERNAL TABLE dbo.dim_Station

-- Create dim_Station table using the corresponding staging one
CREATE EXTERNAL TABLE dbo.dim_Station WITH (
    LOCATION = 'starSchema/dim_Station',
    DATA_SOURCE = [blobStorage],
    FILE_FORMAT = [SynapseDelimitedTextFormat]
) AS (
    SELECT
        [station_id],
        [name],
        [latitude],
        [longitude]
    FROM
        dbo.stagingStation
);

-- Check
SELECT TOP 10 * FROM dbo.dim_Station