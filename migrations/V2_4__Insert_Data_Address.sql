IF NOT EXISTS (SELECT 1 FROM address WHERE USER_ID = 1 AND SELLER_ID = 1 AND STREET = '7' AND WARD = 'PHUONG 1' AND DISTRICT = 'PHU NHUAN' AND CITY = 'HCM')
BEGIN
    INSERT INTO address (USER_ID, SELLER_ID, STREET, WARD, DISTRICT, CITY) VALUES (1, 1, '7', 'PHUONG 1', 'PHU NHUAN', 'HCM');
END;

IF NOT EXISTS (SELECT 1 FROM address WHERE USER_ID = 1 AND SELLER_ID = 1 AND STREET = '5' AND WARD = 'PHUONG 5' AND DISTRICT = 'QUAN 1' AND CITY = 'HCM')
BEGIN
    INSERT INTO address (USER_ID, SELLER_ID, STREET, WARD, DISTRICT, CITY) VALUES (1, 1, '5', 'PHUONG 5', 'QUAN 1', 'HCM');
END;