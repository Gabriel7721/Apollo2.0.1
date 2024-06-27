-- Enable IDENTITY_INSERT for the variant table
SET IDENTITY_INSERT variant ON;

-- Ensure required variants exist
IF NOT EXISTS (SELECT 1 FROM variant WHERE ID = 1)
BEGIN
    INSERT INTO variant (ID, NAME, SKU_CODE, STOCK_QUANTITY, WEIGHT, PRICE, SALE_PRICE, IMG, IS_DELETED, PRODUCT_ID)
    VALUES (1, 'Variant 1', 'SKU1', 100, 1.0, 10.0, 9.0, 'img1.png', 0, 1);
END;

IF NOT EXISTS (SELECT 1 FROM variant WHERE ID = 2)
BEGIN
    INSERT INTO variant (ID, NAME, SKU_CODE, STOCK_QUANTITY, WEIGHT, PRICE, SALE_PRICE, IMG, IS_DELETED, PRODUCT_ID)
    VALUES (2, 'Variant 2', 'SKU2', 200, 2.0, 20.0, 18.0, 'img2.png', 0, 2);
END;

IF NOT EXISTS (SELECT 1 FROM variant WHERE ID = 3)
BEGIN
    INSERT INTO variant (ID, NAME, SKU_CODE, STOCK_QUANTITY, WEIGHT, PRICE, SALE_PRICE, IMG, IS_DELETED, PRODUCT_ID)
    VALUES (3, 'Variant 3', 'SKU3', 300, 3.0, 30.0, 27.0, 'img3.png', 0, 3);
END;

IF NOT EXISTS (SELECT 1 FROM variant WHERE ID = 4)
BEGIN
    INSERT INTO variant (ID, NAME, SKU_CODE, STOCK_QUANTITY, WEIGHT, PRICE, SALE_PRICE, IMG, IS_DELETED, PRODUCT_ID)
    VALUES (4, 'Variant 4', 'SKU4', 400, 4.0, 40.0, 36.0, 'img4.png', 0, 4);
END;

IF NOT EXISTS (SELECT 1 FROM variant WHERE ID = 5)
BEGIN
    INSERT INTO variant (ID, NAME, SKU_CODE, STOCK_QUANTITY, WEIGHT, PRICE, SALE_PRICE, IMG, IS_DELETED, PRODUCT_ID)
    VALUES (5, 'Variant 5', 'SKU5', 500, 5.0, 50.0, 45.0, 'img5.png', 0, 5);
END;

IF NOT EXISTS (SELECT 1 FROM variant WHERE ID = 6)
BEGIN
    INSERT INTO variant (ID, NAME, SKU_CODE, STOCK_QUANTITY, WEIGHT, PRICE, SALE_PRICE, IMG, IS_DELETED, PRODUCT_ID)
    VALUES (6, 'Variant 6', 'SKU6', 600, 6.0, 60.0, 54.0, 'img6.png', 0, 6);
END;

IF NOT EXISTS (SELECT 1 FROM variant WHERE ID = 7)
BEGIN
    INSERT INTO variant (ID, NAME, SKU_CODE, STOCK_QUANTITY, WEIGHT, PRICE, SALE_PRICE, IMG, IS_DELETED, PRODUCT_ID)
    VALUES (7, 'Variant 7', 'SKU7', 700, 7.0, 70.0, 63.0, 'img7.png', 0, 7);
END;

IF NOT EXISTS (SELECT 1 FROM variant WHERE ID = 8)
BEGIN
    INSERT INTO variant (ID, NAME, SKU_CODE, STOCK_QUANTITY, WEIGHT, PRICE, SALE_PRICE, IMG, IS_DELETED, PRODUCT_ID)
    VALUES (8, 'Variant 8', 'SKU8', 800, 8.0, 80.0, 72.0, 'img8.png', 0, 8);
END;

-- Disable IDENTITY_INSERT for the variant table
SET IDENTITY_INSERT variant OFF;

-- Now insert into variant_optionvalue table
IF NOT EXISTS (SELECT 1 FROM variant_optionvalue WHERE variant_id = 1 AND optionvalue_id = 1)
    INSERT INTO variant_optionvalue (variant_id, optionvalue_id) VALUES (1, 1);

IF NOT EXISTS (SELECT 1 FROM variant_optionvalue WHERE variant_id = 1 AND optionvalue_id = 3)
    INSERT INTO variant_optionvalue (variant_id, optionvalue_id) VALUES (1, 3);

IF NOT EXISTS (SELECT 1 FROM variant_optionvalue WHERE variant_id = 2 AND optionvalue_id = 2)
    INSERT INTO variant_optionvalue (variant_id, optionvalue_id) VALUES (2, 2);

IF NOT EXISTS (SELECT 1 FROM variant_optionvalue WHERE variant_id = 2 AND optionvalue_id = 4)
    INSERT INTO variant_optionvalue (variant_id, optionvalue_id) VALUES (2, 4);

IF NOT EXISTS (SELECT 1 FROM variant_optionvalue WHERE variant_id = 3 AND optionvalue_id = 1)
    INSERT INTO variant_optionvalue (variant_id, optionvalue_id) VALUES (3, 1);

IF NOT EXISTS (SELECT 1 FROM variant_optionvalue WHERE variant_id = 3 AND optionvalue_id = 4)
    INSERT INTO variant_optionvalue (variant_id, optionvalue_id) VALUES (3, 4);

IF NOT EXISTS (SELECT 1 FROM variant_optionvalue WHERE variant_id = 4 AND optionvalue_id = 2)
    INSERT INTO variant_optionvalue (variant_id, optionvalue_id) VALUES (4, 2);

IF NOT EXISTS (SELECT 1 FROM variant_optionvalue WHERE variant_id = 4 AND optionvalue_id = 3)
    INSERT INTO variant_optionvalue (variant_id, optionvalue_id) VALUES (4, 3);

IF NOT EXISTS (SELECT 1 FROM variant_optionvalue WHERE variant_id = 5 AND optionvalue_id = 5)
    INSERT INTO variant_optionvalue (variant_id, optionvalue_id) VALUES (5, 5);

IF NOT EXISTS (SELECT 1 FROM variant_optionvalue WHERE variant_id = 5 AND optionvalue_id = 7)
    INSERT INTO variant_optionvalue (variant_id, optionvalue_id) VALUES (5, 7);

IF NOT EXISTS (SELECT 1 FROM variant_optionvalue WHERE variant_id = 6 AND optionvalue_id = 5)
    INSERT INTO variant_optionvalue (variant_id, optionvalue_id) VALUES (6, 5);

IF NOT EXISTS (SELECT 1 FROM variant_optionvalue WHERE variant_id = 6 AND optionvalue_id = 8)
    INSERT INTO variant_optionvalue (variant_id, optionvalue_id) VALUES (6, 8);

IF NOT EXISTS (SELECT 1 FROM variant_optionvalue WHERE variant_id = 7 AND optionvalue_id = 6)
    INSERT INTO variant_optionvalue (variant_id, optionvalue_id) VALUES (7, 6);

IF NOT EXISTS (SELECT 1 FROM variant_optionvalue WHERE variant_id = 7 AND optionvalue_id = 7)
    INSERT INTO variant_optionvalue (variant_id, optionvalue_id) VALUES (7, 7);

IF NOT EXISTS (SELECT 1 FROM variant_optionvalue WHERE variant_id = 8 AND optionvalue_id = 6)
    INSERT INTO variant_optionvalue (variant_id, optionvalue_id) VALUES (8, 6);

IF NOT EXISTS (SELECT 1 FROM variant_optionvalue WHERE variant_id = 8 AND optionvalue_id = 8)
    INSERT INTO variant_optionvalue (variant_id, optionvalue_id) VALUES (8, 8);
