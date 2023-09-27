USE azuredataeng_udacity;

-- Create master key in the database
CREATE MASTER KEY ENCRYPTION BY PASSWORD = '[REDACTED]';

-- Secure connection to the storage
CREATE DATABASE SCOPED CREDENTIAL StorageCredential
WITH
    IDENTITY = 'SHARED ACCESS SIGNATURE',
    SECRET = '[REDACTED]';

-- Redefine a new delimited text format
IF NOT EXISTS (SELECT * FROM sys.external_file_formats WHERE name = 'SynapseDelimitedTextFormat')
    CREATE EXTERNAL FILE FORMAT [SynapseDelimitedTextFormat] 
        WITH ( FORMAT_TYPE = DELIMITEDTEXT ,
            FORMAT_OPTIONS (
                FIELD_TERMINATOR = ',',
                STRING_DELIMITER = '"',
                USE_TYPE_DEFAULT = FALSE
            )
        )
    GO

-- Redefine a new parquet file format
IF NOT EXISTS (SELECT * FROM sys.external_file_formats WHERE name = 'SynapseParquetFormat') 
    CREATE EXTERNAL FILE FORMAT [SynapseParquetFormat]
    WITH (FORMAT_TYPE = PARQUET)
GO

-- Create new data source that links to blob storage
IF EXISTS (SELECT * FROM sys.external_data_sources WHERE name = 'blobStorage')
    DROP EXTERNAL DATA SOURCE [blobStorage]
CREATE EXTERNAL DATA SOURCE [blobStorage] WITH (
    location = 'abfss://adlsnycpayroll-huythn-lastintial@huythn.dfs.core.windows.net',
    CREDENTIAL = StorageCredential
)
GO
