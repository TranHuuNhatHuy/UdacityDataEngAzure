USE azuredataeng_udacity;

-- Create fact_Payment table using the corresponding staging one
CREATE EXTERNAL TABLE dbo.fact_Payment WITH (
    LOCATION = 'starSchema/fact_Payment',
    DATA_SOURCE = [blobStorage],
    FILE_FORMAT = [SynapseDelimitedTextFormat]
) AS (
    SELECT
        [payment_id],
        [date],
        [amount],
        DATEPART(day, CONVERT(date, [date])) AS [day],
        DATEPART(month, CONVERT(date, [date])) AS [month],
        DATEPART(quarter, CONVERT(date, [date])) AS [quarter],
        DATEPART(year, CONVERT(date, [date])) AS [year],
        DATEPART(weekday, CONVERT(date, [date])) AS [day_of_week],
        DATEPART(dayofyear, CONVERT(date, [date])) AS [day_of_year],
        [rider_id]
    FROM
        dbo.stagingPayment
);

-- Check first 10 rows
SELECT TOP 10 * FROM dbo.fact_Payment