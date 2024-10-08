-- Insert Samsung Store
IF NOT EXISTS (
    SELECT 1 
    FROM store 
    WHERE CAST(name AS VARCHAR(MAX)) = 'Samsung Store' 
    AND seller_id = 1
)
BEGIN
    INSERT INTO store (name, logo, home_image, deals_image, deals_square_image, interactive_image, seller_id)
    VALUES (
        'Samsung Store', 
        'https://1000logos.net/wp-content/uploads/2017/06/Samsung-emblem.png', 
        'https://m.media-amazon.com/images/S/al-na-9d5791cf-3faf/1f6cbd86-1e6a-42d5-bd7c-e137bfef3fc6._CR0%2C0%2C3000%2C600_SX1920_.jpg', 
        'https://m.media-amazon.com/images/S/al-na-9d5791cf-3faf/d055fa5e-475d-46bf-b294-20e0032ca4ae._CR0%2C0%2C3000%2C600_SX1920_.jpg', 
        'https://m.media-amazon.com/images/S/al-na-9d5791cf-3faf/b54208fd-28ef-4d09-87e0-e7fb7a2a63c1._CR0%2C0%2C1500%2C1500_SX480_SY480_.jpg', 
        'https://m.media-amazon.com/images/S/aplus-media-library-service-media/4ecf88c7-c019-4a3e-8d40-6867ac6ebd8a.__CR0,0,2022,1251_PT0_SX970_V1___.png', 
        1
    );
END;

-- Insert Flowers Store
IF NOT EXISTS (
    SELECT 1 
    FROM store 
    WHERE CAST(name AS VARCHAR(MAX)) = 'Flowers Store'  
    AND seller_id = 1
)
BEGIN
    INSERT INTO store (name, logo, home_image, deals_image, deals_square_image, interactive_image, seller_id)
    VALUES (
        'Flowers Store', 
        'https://1000logos.net/wp-content/uploads/2017/06/Samsung-emblem.png', 
        'https://m.media-amazon.com/images/S/al-na-9d5791cf-3faf/1f6cbd86-1e6a-42d5-bd7c-e137bfef3fc6._CR0%2C0%2C3000%2C600_SX1920_.jpg', 
        'https://m.media-amazon.com/images/S/al-na-9d5791cf-3faf/d055fa5e-475d-46bf-b294-20e0032ca4ae._CR0%2C0%2C3000%2C600_SX1920_.jpg', 
        'https://m.media-amazon.com/images/S/al-na-9d5791cf-3faf/b54208fd-28ef-4d09-87e0-e7fb7a2a63c1._CR0%2C0%2C1500%2C1500_SX480_SY480_.jpg', 
        'https://m.media-amazon.com/images/S/aplus-media-library-service-media/4ecf88c7-c019-4a3e-8d40-6867ac6ebd8a.__CR0,0,2022,1251_PT0_SX970_V1___.png', 
        1
    );
END;

-- Insert Decor Store
IF NOT EXISTS (
    SELECT 1 
    FROM store 
    WHERE CAST(name AS VARCHAR(MAX)) = 'Decor Store' 
    AND seller_id = 1
)
BEGIN
    INSERT INTO store (name, logo, home_image, deals_image, deals_square_image, interactive_image, seller_id)
    VALUES (
        'Decor Store', 
        'https://1000logos.net/wp-content/uploads/2017/06/Samsung-emblem.png', 
        'https://m.media-amazon.com/images/S/al-na-9d5791cf-3faf/1f6cbd86-1e6a-42d5-bd7c-e137bfef3fc6._CR0%2C0%2C3000%2C600_SX1920_.jpg', 
        'https://m.media-amazon.com/images/S/al-na-9d5791cf-3faf/d055fa5e-475d-46bf-b294-20e0032ca4ae._CR0%2C0%2C3000%2C600_SX1920_.jpg', 
        'https://m.media-amazon.com/images/S/al-na-9d5791cf-3faf/b54208fd-28ef-4d09-87e0-e7fb7a2a63c1._CR0%2C0%2C1500%2C1500_SX480_SY480_.jpg', 
        'https://m.media-amazon.com/images/S/aplus-media-library-service-media/4ecf88c7-c019-4a3e-8d40-6867ac6ebd8a.__CR0,0,2022,1251_PT0_SX970_V1___.png', 
        1
    );
END;
