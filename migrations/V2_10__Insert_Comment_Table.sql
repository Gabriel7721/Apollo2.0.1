IF NOT EXISTS (SELECT 1 FROM review WHERE ID = 1)
BEGIN
    INSERT INTO review (STAR, TITLE, CONTENT, CREATE_AT, VARIANT_ID)
    VALUES (5, 'Review Title 1', 'Review Content 1', GETDATE(), 1);
END

IF NOT EXISTS (SELECT 1 FROM review WHERE ID = 2)
BEGIN
    INSERT INTO review (STAR, TITLE, CONTENT, CREATE_AT, VARIANT_ID)
    VALUES (4, 'Review Title 2', 'Review Content 2', GETDATE(), 1);
END

IF NOT EXISTS (SELECT 1 FROM review WHERE ID = 3)
BEGIN
    INSERT INTO review (STAR, TITLE, CONTENT, CREATE_AT, VARIANT_ID)
    VALUES (3, 'Review Title 3', 'Review Content 3', GETDATE(), 1);
END

IF NOT EXISTS (SELECT 1 FROM review WHERE ID = 4)
BEGIN
    INSERT INTO review (STAR, TITLE, CONTENT, CREATE_AT, VARIANT_ID)
    VALUES (2, 'Review Title 4', 'Review Content 4', GETDATE(), 1);
END

IF NOT EXISTS (SELECT 1 FROM review WHERE ID = 5)
BEGIN
    INSERT INTO review (STAR, TITLE, CONTENT, CREATE_AT, VARIANT_ID)
    VALUES (1, 'Review Title 5', 'Review Content 5', GETDATE(), 1);
END

-- Ensure the required seller exists
IF NOT EXISTS (SELECT 1 FROM seller WHERE ID = 1)
BEGIN
    INSERT INTO seller (SELLER_NAME)
    VALUES ('Seller Name');
END

-- Insert the first comment if it does not exist
IF NOT EXISTS (
    SELECT 1 FROM comment WHERE CAST(CONTENT AS VARCHAR(MAX)) = 'Wrong review!!!  ' AND REVIEW_ID = 1 AND SELLER_ID = 1
)
BEGIN
    INSERT INTO comment (CONTENT, REVIEW_ID, SELLER_ID)
    VALUES ('Wrong review!!!  ', 1, 1);
END

-- Insert the second comment if it does not exist
IF NOT EXISTS (
    SELECT 1 FROM comment WHERE CAST(CONTENT AS VARCHAR(MAX)) = 'Wrong1 review!!!  ' AND REVIEW_ID = 2 AND SELLER_ID = 1
)
BEGIN
    INSERT INTO comment (CONTENT, REVIEW_ID, SELLER_ID)
    VALUES ('Wrong1 review!!!  ', 2, 1);
END

-- Insert the third comment if it does not exist
IF NOT EXISTS (
    SELECT 1 FROM comment WHERE CAST(CONTENT AS VARCHAR(MAX)) = 'Wrong2 review!!!  ' AND REVIEW_ID = 3 AND SELLER_ID = 1
)
BEGIN
    INSERT INTO comment (CONTENT, REVIEW_ID, SELLER_ID)
    VALUES ('Wrong2 review!!!  ', 3, 1);
END

-- Insert the fourth comment if it does not exist
IF NOT EXISTS (
    SELECT 1 FROM comment WHERE CAST(CONTENT AS VARCHAR(MAX)) = 'Wrong3 review!!!  ' AND REVIEW_ID = 4 AND SELLER_ID = 1
)
BEGIN
    INSERT INTO comment (CONTENT, REVIEW_ID, SELLER_ID)
    VALUES ('Wrong3 review!!!  ', 4, 1);
END

-- Insert the fifth comment if it does not exist
IF NOT EXISTS (
    SELECT 1 FROM comment WHERE CAST(CONTENT AS VARCHAR(MAX)) = 'Wrong4 review!!!  ' AND REVIEW_ID = 5 AND SELLER_ID = 1
)
BEGIN
    INSERT INTO comment (CONTENT, REVIEW_ID, SELLER_ID)
    VALUES ('Wrong4 review!!!  ', 5, 1);
END