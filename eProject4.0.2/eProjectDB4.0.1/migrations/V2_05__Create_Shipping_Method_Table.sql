IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'shipping_method' AND TABLE_SCHEMA = 'dbo')
BEGIN
    CREATE TABLE dbo.shipping_method (
        ID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
        NAME VARCHAR(255) NOT NULL,
        PRICE FLOAT NOT NULL
    );
END
