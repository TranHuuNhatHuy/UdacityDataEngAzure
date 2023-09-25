USE azuredataeng_udacity;

-- Drop table if exists
IF OBJECT_ID('dbo.fact_Trip') IS NOT NULL
    DROP EXTERNAL TABLE dbo.fact_Trip

-- Create fact_Trip table using the corresponding staging one
CREATE EXTERNAL TABLE dbo.fact_Trip WITH (
    LOCATION = 'starSchema/fact_Trip',
    DATA_SOURCE = [blobStorage],
    FILE_FORMAT = [SynapseDelimitedTextFormat]
) AS (
    SELECT
        T.[trip_id],
        CONVERT(varchar(10), T.[started_at], 111) AS [trip_date],
        CONVERT(time, T.[started_at]) AS [trip_time],
        LEFT(T.[started_at], 19) AS [started_at],
        LEFT(T.[ended_at], 19) AS [ended_at],
        T.[rider_id],
        T.[rideable_type],
        DATEDIFF(year, R.[birthday], T.[started_at]) AS [rider_age],
        T.[start_station_id],
        T.[end_station_id],
        DATEDIFF(second, T.[started_at], T.[ended_at]) AS [duration]
    FROM
        dbo.stagingTrip AS T
        JOIN
        dbo.stagingRider AS R
        ON
        T.rider_id = R.rider_id
);

SELECT TOP 10 * FROM dbo.fact_Trip