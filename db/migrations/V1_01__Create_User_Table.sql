IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[users]') AND type in (N'U'))
BEGIN
    CREATE TABLE [dbo].[users] (
        ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
        CLIENT_NAME VARCHAR(50),
        ROLE VARCHAR(50),
        EMAIL VARCHAR(100),
        PASSWORD VARCHAR(400),
        ENABLED BIT NOT NULL DEFAULT 0
    );
END
