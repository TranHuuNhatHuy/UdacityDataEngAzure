USE azuredataeng_udacity;

-- Drop table if exists
IF OBJECT_ID('dbo.stagingPayment') IS NOT NULL
    DROP EXTERNAL TABLE dbo.stagingPayment

-- Create external staging table for Payment data
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

-- Check
SELECT TOP 10 * FROM dbo.stagingPayment
GO