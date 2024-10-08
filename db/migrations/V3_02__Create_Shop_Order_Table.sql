IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'shop_order') AND type in (N'U'))
BEGIN
    CREATE TABLE shop_order
    (
        ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
        USER_ID INT,
        VARIANT_ID INT,
        ORDER_DATE VARCHAR(255),
        ADDRESS_ID INT,
        PAYMENT_METHOD_ID INT,
        SHIPPING_METHOD_ID INT,
        QUANTITY INT,
        ORDER_TOTAL FLOAT,
        FOREIGN KEY (USER_ID) REFERENCES [user](ID),
        FOREIGN KEY (VARIANT_ID) REFERENCES variant(ID),
        FOREIGN KEY (ADDRESS_ID) REFERENCES address(ID),
        FOREIGN KEY (PAYMENT_METHOD_ID) REFERENCES payment_method(ID),
        FOREIGN KEY (SHIPPING_METHOD_ID) REFERENCES shipping_method(ID)
    );
END
