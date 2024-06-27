-- Insert product attributes if they do not exist
IF NOT EXISTS (
    SELECT 1 FROM productattribute WHERE NAME = 'Brand' AND VALUE = 'Amazon' AND PRODUCT_ID = 1
)
BEGIN
    INSERT INTO productattribute (NAME, VALUE, PRODUCT_ID) VALUES ('Brand', 'Amazon', 1);
END

IF NOT EXISTS (
    SELECT 1 FROM productattribute WHERE NAME = 'Material' AND VALUE = 'Saga' AND PRODUCT_ID = 1
)
BEGIN
    INSERT INTO productattribute (NAME, VALUE, PRODUCT_ID) VALUES ('Material', 'Saga', 1);
END

IF NOT EXISTS (
    SELECT 1 FROM productattribute WHERE NAME = 'Expired' AND VALUE = '3 years' AND PRODUCT_ID = 1
)
BEGIN
    INSERT INTO productattribute (NAME, VALUE, PRODUCT_ID) VALUES ('Expired', '3 years', 1);
END

IF NOT EXISTS (
    SELECT 1 FROM productattribute WHERE NAME = 'Manufacturer' AND VALUE = '4 Value' AND PRODUCT_ID = 1
)
BEGIN
    INSERT INTO productattribute (NAME, VALUE, PRODUCT_ID) VALUES ('Manufacturer', '4 Value', 1);
END

IF NOT EXISTS (
    SELECT 1 FROM productattribute WHERE NAME = 'Brand' AND VALUE = 'Amazon' AND PRODUCT_ID = 2
)
BEGIN
    INSERT INTO productattribute (NAME, VALUE, PRODUCT_ID) VALUES ('Brand', 'Amazon', 2);
END

IF NOT EXISTS (
    SELECT 1 FROM productattribute WHERE NAME = 'Material' AND VALUE = 'Saga' AND PRODUCT_ID = 2
)
BEGIN
    INSERT INTO productattribute (NAME, VALUE, PRODUCT_ID) VALUES ('Material', 'Saga', 2);
END

IF NOT EXISTS (
    SELECT 1 FROM productattribute WHERE NAME = 'Expired' AND VALUE = '3 years' AND PRODUCT_ID = 2
)
BEGIN
    INSERT INTO productattribute (NAME, VALUE, PRODUCT_ID) VALUES ('Expired', '3 years', 2);
END

IF NOT EXISTS (
    SELECT 1 FROM productattribute WHERE NAME = 'Manufacturer' AND VALUE = '4 Value' AND PRODUCT_ID = 2
)
BEGIN
    INSERT INTO productattribute (NAME, VALUE, PRODUCT_ID) VALUES ('Manufacturer', '4 Value', 2);
END

IF NOT EXISTS (
    SELECT 1 FROM productattribute WHERE NAME = 'Brand' AND VALUE = 'Amazon' AND PRODUCT_ID = 3
)
BEGIN
    INSERT INTO productattribute (NAME, VALUE, PRODUCT_ID) VALUES ('Brand', 'Amazon', 3);
END

IF NOT EXISTS (
    SELECT 1 FROM productattribute WHERE NAME = 'Material' AND VALUE = 'Saga' AND PRODUCT_ID = 3
)
BEGIN
    INSERT INTO productattribute (NAME, VALUE, PRODUCT_ID) VALUES ('Material', 'Saga', 3);
END

IF NOT EXISTS (
    SELECT 1 FROM productattribute WHERE NAME = 'Expired' AND VALUE = '3 years' AND PRODUCT_ID = 4
)
BEGIN
    INSERT INTO productattribute (NAME, VALUE, PRODUCT_ID) VALUES ('Expired', '3 years', 4);
END

IF NOT EXISTS (
    SELECT 1 FROM productattribute WHERE NAME = 'Manufacturer' AND VALUE = '4 Value' AND PRODUCT_ID = 5
)
BEGIN
    INSERT INTO productattribute (NAME, VALUE, PRODUCT_ID) VALUES ('Manufacturer', '4 Value', 5);
END

IF NOT EXISTS (
    SELECT 1 FROM productattribute WHERE NAME = 'Brand' AND VALUE = 'Amazon' AND PRODUCT_ID = 5
)
BEGIN
    INSERT INTO productattribute (NAME, VALUE, PRODUCT_ID) VALUES ('Brand', 'Amazon', 5);
END

IF NOT EXISTS (
    SELECT 1 FROM productattribute WHERE NAME = 'Material' AND VALUE = 'Saga' AND PRODUCT_ID = 5
)
BEGIN
    INSERT INTO productattribute (NAME, VALUE, PRODUCT_ID) VALUES ('Material', 'Saga', 5);
END

IF NOT EXISTS (
    SELECT 1 FROM productattribute WHERE NAME = 'Expired' AND VALUE = '3 years' AND PRODUCT_ID = 5
)
BEGIN
    INSERT INTO productattribute (NAME, VALUE, PRODUCT_ID) VALUES ('Expired', '3 years', 5);
END

IF NOT EXISTS (
    SELECT 1 FROM productattribute WHERE NAME = 'Manufacturer' AND VALUE = '4 Value' AND PRODUCT_ID = 5
)
BEGIN
    INSERT INTO productattribute (NAME, VALUE, PRODUCT_ID) VALUES ('Manufacturer', '4 Value', 5);
END
