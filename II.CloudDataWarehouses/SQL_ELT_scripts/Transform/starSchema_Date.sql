USE azuredataeng_udacity;

-- Drop table if exists
IF OBJECT_ID('dbo.dim_Date') IS NOT NULL
    DROP EXTERNAL TABLE dbo.dim_Date

-- Create dim_Date table using the corresponding staging one
CREATE EXTERNAL TABLE dbo.dim_Date WITH (
    LOCATION = 'starSchema/dim_Date',
    DATA_SOURCE = [blobStorage],
    FILE_FORMAT = [SynapseDelimitedTextFormat]
) AS (
    SELECT
        [date_id],
        [day],
        [month],
        [quarter],
        [year],
        [day_of_week],
        [day_of_year]
    FROM
        dbo.stagingDate
);

SELECT TOP 10 * FROM dbo.dim_Date