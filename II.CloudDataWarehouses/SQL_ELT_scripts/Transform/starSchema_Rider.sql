USE azuredataeng_udacity;

-- Create dim_Rider table using the corresponding staging one
CREATE EXTERNAL TABLE dbo.dim_Rider WITH (
    LOCATION = 'starSchema/dim_Rider',
    DATA_SOURCE = [blobStorage],
    FILE_FORMAT = [SynapseDelimitedTextFormat]
) AS (
    SELECT
        [rider_id],
        [address],
        [first],
        [last],
        [birthday],
        [account_start_date],
        [account_end_date],
        [is_member]
    FROM
        dbo.stagingRider
);

-- Check first 10 rows
SELECT TOP 10 * FROM dbo.dim_Rider