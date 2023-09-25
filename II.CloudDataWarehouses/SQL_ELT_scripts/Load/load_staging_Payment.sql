USE azuredataeng_udacity;

-- Create external table for staging Payment data
CREATE EXTERNAL TABLE dbo.stagingPayment (
    [payment_id] BIGINT,
    [date] VARCHAR(100),
    [amount] FLOAT,
    [rider_id] BIGINT
) WITH (
    LOCATION = 'source/publicpayment.csv',
    DATA_SOURCE = [blobStorage],
    FILE_FORMAT = [SynapseDelimitedTextFormat]
)
GO

-- Fetch first 10 rows from staging table and check them out
SELECT TOP 10 * FROM dbo.stagingPayment
GO