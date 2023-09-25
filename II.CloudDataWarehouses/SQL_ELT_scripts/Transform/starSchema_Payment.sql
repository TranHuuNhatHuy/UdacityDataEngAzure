USE azuredataeng_udacity;

-- Drop table if exists
IF OBJECT_ID('dbo.fact_Payment') IS NOT NULL
    DROP EXTERNAL TABLE dbo.fact_Payment

-- Create fact_Payment table using the corresponding staging one
CREATE EXTERNAL TABLE dbo.fact_Payment WITH (
    LOCATION = 'starSchema/fact_Payment',
    DATA_SOURCE = [blobStorage],
    FILE_FORMAT = [SynapseDelimitedTextFormat]
) AS (
    SELECT
        [payment_id],
        CONVERT(varchar(10), [date], 111) AS [date],
        [amount],
        [rider_id]
    FROM
        dbo.stagingPayment
);

-- Check
SELECT TOP 10 * FROM dbo.fact_Payment