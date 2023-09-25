USE azuredataeng_udacity;

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

-- Check first 10 rows
SELECT TOP 10 * FROM dbo.dim_Station