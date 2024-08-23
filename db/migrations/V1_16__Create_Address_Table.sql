IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'address')
BEGIN
    CREATE TABLE address
    (
        ID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
        USER_ID INT,
        SELLER_ID INT,
        STREET VARCHAR(255),
        WARD VARCHAR(255),
        DISTRICT VARCHAR(255),
        CITY VARCHAR(255),
        FOREIGN KEY (USER_ID) REFERENCES [user](ID),
        FOREIGN KEY (SELLER_ID) REFERENCES seller(ID)
    );
END