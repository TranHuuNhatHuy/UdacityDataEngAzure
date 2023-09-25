USE azuredataeng_udacity;

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

-- Check first 10 rows
SELECT TOP 10 * FROM dbo.fact_Payment