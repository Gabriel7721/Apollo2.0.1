IF NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'All Department' AND parent_Category_Id IS NULL)
BEGIN
    INSERT INTO category (attribute, parent_Category_Id) VALUES ('All Department', NULL);
END

IF NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Electronic' AND parent_Category_Id IS NULL)
BEGIN
    INSERT INTO category (attribute, parent_Category_Id) VALUES ('Electronic', 1);
END

IF NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Computers' AND parent_Category_Id IS NULL)
BEGIN
    INSERT INTO category (attribute, parent_Category_Id) VALUES ('Computers', 1);
END

IF NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Smart Homes' AND parent_Category_Id IS NULL)
BEGIN
    INSERT INTO category (attribute, parent_Category_Id) VALUES ('Smart Homes', 1);
END

IF NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Arts & Craft' AND parent_Category_Id IS NULL)
BEGIN
    INSERT INTO category (attribute, parent_Category_Id) VALUES ('Arts & Craft', 1);
END

IF NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Automotive' AND parent_Category_Id IS NULL)
BEGIN
    INSERT INTO category (attribute, parent_Category_Id) VALUES ('Automotive', 1);
END

IF NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Baby' AND parent_Category_Id IS NULL)
BEGIN
    INSERT INTO category (attribute, parent_Category_Id) VALUES ('Baby', 1);
END

IF NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Beauty and Personal Care' AND parent_Category_Id IS NULL)
BEGIN
    INSERT INTO category (attribute, parent_Category_Id) VALUES ('Beauty and Personal Care', 1);
END

IF NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Women''s Fashion' AND parent_Category_Id IS NULL)
BEGIN
    INSERT INTO category (attribute, parent_Category_Id) VALUES ('Women''s Fashion', 1);
END

IF NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Men''s Fashion' AND parent_Category_Id IS NULL)
BEGIN
    INSERT INTO category (attribute, parent_Category_Id) VALUES ('Men''s Fashion', 1);
END

IF NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Girl''s Fashion' AND parent_Category_Id IS NULL)
BEGIN
    INSERT INTO category (attribute, parent_Category_Id) VALUES ('Girl''s Fashion', 1);
END

IF NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Boy''s Fashion' AND parent_Category_Id IS NULL)
BEGIN
    INSERT INTO category (attribute, parent_Category_Id) VALUES ('Boy''s Fashion', 1);
END

INSERT INTO category (attribute,parent_Category_Id)
SELECT 'Health and Household', 1
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Health and Household' AND parent_Category_Id IS NULL);

INSERT INTO category (attribute,parent_Category_Id)
SELECT 'Home and Kitchen', 1
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Home and Kitchen' AND parent_Category_Id IS NULL);

INSERT INTO category (attribute,parent_Category_Id)
SELECT 'Industrial and Scientific', 1
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Industrial and Scientific' AND parent_Category_Id IS NULL);

-- Continue the same pattern for the remaining statements

INSERT INTO category (attribute,parent_Category_Id)
SELECT 'Luggage', 1
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Luggage' AND parent_Category_Id IS NULL);

INSERT INTO category (attribute,parent_Category_Id)
SELECT 'Movies & Television', 1
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Movies & Television' AND parent_Category_Id IS NULL);

INSERT INTO category (attribute,parent_Category_Id)
SELECT 'Pet supplies', 1
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Pet supplies' AND parent_Category_Id IS NULL);

INSERT INTO category (attribute,parent_Category_Id)
SELECT 'Software', 1
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Software' AND parent_Category_Id IS NULL);

INSERT INTO category (attribute,parent_Category_Id)
SELECT 'Sport and outdoors', 1
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Sport and outdoors' AND parent_Category_Id IS NULL);

INSERT INTO category (attribute,parent_Category_Id)
SELECT 'Tool & Home Improvement', 1
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Tool & Home Improvement' AND parent_Category_Id IS NULL);

INSERT INTO category (attribute,parent_Category_Id)
SELECT 'Toys and Games', 1
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Toys and Games' AND parent_Category_Id IS NULL);

INSERT INTO category (attribute,parent_Category_Id)
SELECT 'Video Games', 1
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Video Games' AND parent_Category_Id IS NULL);

-- ------------------------------------------------------------------------------------------------------------------

INSERT INTO category (attribute,parent_Category_Id)
SELECT 'Accessories & Supplies', 2
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Accessories & Supplies' AND parent_Category_Id = 2);

INSERT INTO category (attribute,parent_Category_Id)
SELECT 'Camera & Photo', 2
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Camera & Photo' AND parent_Category_Id = 2);

INSERT INTO category (attribute,parent_Category_Id)
SELECT 'Car & Vehicle Electronics', 2
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Car & Vehicle Electronics' AND parent_Category_Id = 2);

INSERT INTO category (attribute,parent_Category_Id)
SELECT 'Cell Phones & Accessories', 2
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Cell Phones & Accessories' AND parent_Category_Id = 2);

INSERT INTO category (attribute,parent_Category_Id)
SELECT 'Computers Accessories', 2
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Computers Accessories' AND parent_Category_Id = 2);

INSERT INTO category (attribute,parent_Category_Id)
SELECT 'GPS & Navigation', 2
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'GPS & Navigation' AND parent_Category_Id = 2);

INSERT INTO category (attribute,parent_Category_Id)
SELECT 'Headphones', 2
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Headphones' AND parent_Category_Id = 2);

INSERT INTO category (attribute,parent_Category_Id)
SELECT 'Home Audio', 2
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Home Audio' AND parent_Category_Id = 2);

INSERT INTO category (attribute,parent_Category_Id)
SELECT 'Office Electronics', 2
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Office Electronics' AND parent_Category_Id = 2);

INSERT INTO category (attribute,parent_Category_Id)
SELECT 'Portable Audio & Video', 2
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Portable Audio & Video' AND parent_Category_Id = 2);

INSERT INTO category (attribute,parent_Category_Id)
SELECT 'Security & Surveillance', 2
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Security & Surveillance' AND parent_Category_Id = 2);

INSERT INTO category (attribute,parent_Category_Id)
SELECT 'Service Plans', 2
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Service Plans' AND parent_Category_Id = 2);

INSERT INTO category (attribute,parent_Category_Id)
SELECT 'Television & Video', 2
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Television & Video' AND parent_Category_Id = 2);

INSERT INTO category (attribute,parent_Category_Id)
SELECT 'Video Game Consoles & Accessories', 2
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Video Game Consoles & Accessories' AND parent_Category_Id = 2);

INSERT INTO category (attribute,parent_Category_Id)
SELECT 'Video Projectors', 2
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Video Projectors' AND parent_Category_Id = 2);

INSERT INTO category (attribute,parent_Category_Id)
SELECT 'Wearable Technology', 2
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Wearable Technology' AND parent_Category_Id = 2);

------------------------------------------------------------------------------------------------------------------------------

INSERT INTO category (attribute,parent_Category_Id)
SELECT 'Computer Accessories & Peripherals', 3
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Computer Accessories & Peripherals' AND parent_Category_Id = 3);

INSERT INTO category (attribute,parent_Category_Id)
SELECT 'Computer Components', 3
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Computer Components' AND parent_Category_Id = 3);

INSERT INTO category (attribute,parent_Category_Id)
SELECT 'Computers & Tables', 3
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Computers & Tables' AND parent_Category_Id = 3);

INSERT INTO category (attribute,parent_Category_Id)
SELECT 'Data Storage', 3
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Data Storage' AND parent_Category_Id = 3);

INSERT INTO category (attribute,parent_Category_Id)
SELECT 'External Components', 3
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'External Components' AND parent_Category_Id = 3);

INSERT INTO category (attribute,parent_Category_Id)
SELECT 'Laptop Accessories', 3
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Laptop Accessories' AND parent_Category_Id = 3);

INSERT INTO category (attribute,parent_Category_Id)
SELECT 'Monitors', 3
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Monitors' AND parent_Category_Id = 3);

INSERT INTO category (attribute,parent_Category_Id)
SELECT 'Networking Products', 3
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Networking Products' AND parent_Category_Id = 3);

INSERT INTO category (attribute,parent_Category_Id)
SELECT 'Power Strips & Surge Protectors', 3
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Power Strips & Surge Protectors' AND parent_Category_Id = 3);

INSERT INTO category (attribute,parent_Category_Id)
SELECT 'Printers', 3
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Printers' AND parent_Category_Id = 3);

INSERT INTO category (attribute,parent_Category_Id)
SELECT 'Scanners', 3
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Scanners' AND parent_Category_Id = 3);

INSERT INTO category (attribute,parent_Category_Id)
SELECT 'Servers', 3
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Servers' AND parent_Category_Id = 3);

INSERT INTO category (attribute,parent_Category_Id)
SELECT 'Tablet Accessories', 3
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Tablet Accessories' AND parent_Category_Id = 3);

INSERT INTO category (attribute,parent_Category_Id)
SELECT 'Tablet Replacement Parts', 3
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Tablet Replacement Parts' AND parent_Category_Id = 3);

INSERT INTO category (attribute,parent_Category_Id)
SELECT 'Warranties & Services', 3
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Warranties & Services' AND parent_Category_Id = 3);

------------------------------------------------------------------------------------------------------------------------------

INSERT INTO category (attribute,parent_Category_Id)
SELECT 'Amazon Smart Home', 4
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Amazon Smart Home' AND parent_Category_Id = 4);

INSERT INTO category (attribute,parent_Category_Id)
SELECT 'Works With Alexa Devices', 4
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Works With Alexa Devices' AND parent_Category_Id = 4);

INSERT INTO category (attribute,parent_Category_Id)
SELECT 'SmartHome Lighting', 4
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'SmartHome Lighting' AND parent_Category_Id = 4);

INSERT INTO category (attribute,parent_Category_Id)
SELECT 'Smart Lock And Entry', 4
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Smart Lock And Entry' AND parent_Category_Id = 4);

INSERT INTO category (attribute,parent_Category_Id)
SELECT 'Security Cameras And Systems', 4
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Security Cameras And Systems' AND parent_Category_Id = 4);

INSERT INTO category (attribute,parent_Category_Id)
SELECT 'Plugs and Outlets', 4
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Plugs and Outlets' AND parent_Category_Id = 4);

INSERT INTO category (attribute,parent_Category_Id)
SELECT 'New Smart Devices', 4
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'New Smart Devices' AND parent_Category_Id = 4);

INSERT INTO category (attribute,parent_Category_Id)
SELECT 'Heating and Cooking', 4
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Heating and Cooking' AND parent_Category_Id = 4);

INSERT INTO category (attribute,parent_Category_Id)
SELECT 'Detectors and Sensors', 4
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Detectors and Sensors' AND parent_Category_Id = 4);

INSERT INTO category (attribute,parent_Category_Id)
SELECT 'Home Entertainment', 4
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Home Entertainment' AND parent_Category_Id = 4);

INSERT INTO category (attribute,parent_Category_Id)
SELECT 'Pet', 4
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Pet' AND parent_Category_Id = 4);

INSERT INTO category (attribute,parent_Category_Id)
SELECT 'Voice Assistants And Hubs', 4
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Voice Assistants And Hubs' AND parent_Category_Id = 4);

INSERT INTO category (attribute,parent_Category_Id)
SELECT 'Kitchen', 4
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Kitchen' AND parent_Category_Id = 4);

------------------------------------------------------------------------------------------------------------------------------

INSERT INTO category (attribute,parent_Category_Id)
SELECT 'Painting, Drawing & Art Supplies', 5
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Painting, Drawing & Art Supplies' AND parent_Category_Id = 5);

INSERT INTO category (attribute,parent_Category_Id)
SELECT 'Breading & Jewelry Making', 5
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Breading & Jewelry Making' AND parent_Category_Id = 5);

INSERT INTO category (attribute,parent_Category_Id)
SELECT 'Crafting', 5
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Crafting' AND parent_Category_Id = 5);

INSERT INTO category (attribute,parent_Category_Id)
SELECT 'Fabric', 5
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Fabric' AND parent_Category_Id = 5);

INSERT INTO category (attribute,parent_Category_Id)
SELECT 'Fabric Decorating', 5
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Fabric Decorating' AND parent_Category_Id = 5);

INSERT INTO category (attribute,parent_Category_Id)
SELECT 'Knitting & Crochet', 5
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Knitting & Crochet' AND parent_Category_Id = 5);

INSERT INTO category (attribute,parent_Category_Id)
SELECT 'Needlework', 5
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Needlework' AND parent_Category_Id = 5);

INSERT INTO category (attribute,parent_Category_Id)
SELECT 'Organization, Storage & Transport', 5
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Organization, Storage & Transport' AND parent_Category_Id = 5);

INSERT INTO category (attribute,parent_Category_Id)
SELECT 'Printmaking', 5
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Printmaking' AND parent_Category_Id = 5);

INSERT INTO category (attribute,parent_Category_Id)
SELECT 'ScrapBooking & Stamping', 5
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'ScrapBooking & Stamping' AND parent_Category_Id = 5);

INSERT INTO category (attribute,parent_Category_Id)
SELECT 'Sewing', 5
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Sewing' AND parent_Category_Id = 5);

INSERT INTO category (attribute,parent_Category_Id)
SELECT 'Party Decoration & Supplies', 5
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Party Decoration & Supplies' AND parent_Category_Id = 5);

INSERT INTO category (attribute,parent_Category_Id)
SELECT 'Gift Wrapping Supplies', 5
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Gift Wrapping Supplies' AND parent_Category_Id = 5);

------------------------------------------------------------------------------------------------------------------------------

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Car Care', 6 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Car Care' AND parent_Category_Id = 6);
INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Car Electronic & Accessories', 6 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Car Electronic & Accessories' AND parent_Category_Id = 6);
INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Exterior Accessories', 6 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Exterior Accessories' AND parent_Category_Id = 6);
INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Light & Lighting Accessories', 6 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Light & Lighting Accessories' AND parent_Category_Id = 6);
INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Motorcycle & PowerSports', 6 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Motorcycle & PowerSports' AND parent_Category_Id = 6);
INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Oil & Fluids', 6 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Oil & Fluids' AND parent_Category_Id = 6);
INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Paint & Paint Supplies', 6 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Paint & Paint Supplies' AND parent_Category_Id = 6);
INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Performance Part Supplies', 6 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Performance Part Supplies' AND parent_Category_Id = 6);
INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Replacement Parts', 6 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Replacement Parts' AND parent_Category_Id = 6);
INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'RV Parts & Accessories', 6 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'RV Parts & Accessories' AND parent_Category_Id = 6);
INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Tires & Wheels', 6 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Tires & Wheels' AND parent_Category_Id = 6);
INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Tools & Equipment', 6 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Tools & Equipment' AND parent_Category_Id = 6);
INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Automotive Enthusiast Merchandise', 6 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Automotive Enthusiast Merchandise' AND parent_Category_Id = 6);
INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Heavy Duty & Commercial Vehicle Equipment', 6 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Heavy Duty & Commercial Vehicle Equipment' AND parent_Category_Id = 6);

------------------------------------------------------------------------------------------------------------------------------

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Activity & Entertainment', 7 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Activity & Entertainment' AND parent_Category_Id = 7);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Apparel & Accessories', 7 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Apparel & Accessories' AND parent_Category_Id = 7);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Baby & Toddler Toys', 7 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Baby & Toddler Toys' AND parent_Category_Id = 7);

-- Continue with the remaining INSERT statements in a similar fashion

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Baby Care', 7 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Baby Care' AND parent_Category_Id = 7);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Baby Stationery', 7 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Baby Stationery' AND parent_Category_Id = 7);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Car Seats & Accessories', 7 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Car Seats & Accessories' AND parent_Category_Id = 7);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Diapering', 7 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Diapering' AND parent_Category_Id = 7);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Feeding', 7 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Feeding' AND parent_Category_Id = 7);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Gifts', 7 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Gifts' AND parent_Category_Id = 7);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Nursery', 7 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Nursery' AND parent_Category_Id = 7);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Potty Training', 7 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Potty Training' AND parent_Category_Id = 7);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Pregnancy & Maternity', 7 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Pregnancy & Maternity' AND parent_Category_Id = 7);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Safety', 7 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Safety' AND parent_Category_Id = 7);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Strollers & Accessories', 7 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Strollers & Accessories' AND parent_Category_Id = 7);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Travel Gear', 7 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Travel Gear' AND parent_Category_Id = 7);

------------------------------------------------------------------------------------------------------------------------------

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Makeup', 8 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Makeup' AND parent_Category_Id = 8);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Skin Care', 8 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Skin Care' AND parent_Category_Id = 8);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Hair Care', 8 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Hair Care' AND parent_Category_Id = 8);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Fragrance', 8 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Fragrance' AND parent_Category_Id = 8);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Tool, Hand & Nail Care', 8 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Tool, Hand & Nail Care' AND parent_Category_Id = 8);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Shave & Hair Removal', 8 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Shave & Hair Removal' AND parent_Category_Id = 8);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Personal Care', 8 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Personal Care' AND parent_Category_Id = 8);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Oral Care', 8 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Oral Care' AND parent_Category_Id = 8);

------------------------------------------------------------------------------------------------------------------------------

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Clothing', 9 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Clothing' AND parent_Category_Id = 9);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Shoes', 9 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Shoes' AND parent_Category_Id = 9);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Jewelry', 9 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Jewelry' AND parent_Category_Id = 9);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Watches', 9 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Watches' AND parent_Category_Id = 9);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Handbags', 9 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Handbags' AND parent_Category_Id = 9);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Accessories', 9 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Accessories' AND parent_Category_Id = 9);

------------------------------------------------------------------------------------------------------------------------------

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Clothing', 10 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Clothing' AND parent_Category_Id = 10);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Shoes', 10 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Shoes' AND parent_Category_Id = 10);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Watches', 10 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Watches' AND parent_Category_Id = 10);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Accessories', 10 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Accessories' AND parent_Category_Id = 10);

------------------------------------------------------------------------------------------------------------------------------

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Clothing', 11 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Clothing' AND parent_Category_Id = 11);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Shoes', 11 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Shoes' AND parent_Category_Id = 11);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Jewelry', 11 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Jewelry' AND parent_Category_Id = 11);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Watches', 11 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Watches' AND parent_Category_Id = 11);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Accessories', 11 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Accessories' AND parent_Category_Id = 11);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'School Uniforms', 11 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'School Uniforms' AND parent_Category_Id = 11);

------------------------------------------------------------------------------------------------------------------------------

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Clothing', 12 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Clothing' AND parent_Category_Id = 12);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Shoes', 12 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Shoes' AND parent_Category_Id = 12);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Jewelry', 12 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Jewelry' AND parent_Category_Id = 12);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Watches', 12 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Watches' AND parent_Category_Id = 12);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Accessories', 12 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Accessories' AND parent_Category_Id = 12);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'School Uniforms', 12 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'School Uniforms' AND parent_Category_Id = 12);

------------------------------------------------------------------------------------------------------------------------------

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Baby & Child Care', 13 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Baby & Child Care' AND parent_Category_Id = 13);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Health Care', 13 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Health Care' AND parent_Category_Id = 13);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Household Supplies', 13 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Household Supplies' AND parent_Category_Id = 13);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Medical Supplies & Equipment', 13 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Medical Supplies & Equipment' AND parent_Category_Id = 13);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Oral Care', 13 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Oral Care' AND parent_Category_Id = 13);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Personal Care', 13 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Personal Care' AND parent_Category_Id = 13);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Sexual Wellness', 13 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Sexual Wellness' AND parent_Category_Id = 13);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Sports Nutrition', 13 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Sports Nutrition' AND parent_Category_Id = 13);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Stationery & Gift Wrapping Supplies', 13 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Stationery & Gift Wrapping Supplies' AND parent_Category_Id = 13);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Vision Care', 13 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Vision Care' AND parent_Category_Id = 13);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Vitamin & Dietary Supplements', 13 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Vitamin & Dietary Supplements' AND parent_Category_Id = 13);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Wellness & Relaxation ', 13 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Wellness & Relaxation ' AND parent_Category_Id = 13);

------------------------------------------------------------------------------------------------------------------------------

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Kids'' Home Store', 14 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Kids'' Home Store' AND parent_Category_Id = 14);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Kitchen & Dining', 14 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Kitchen & Dining' AND parent_Category_Id = 14);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Bedding', 14 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Bedding' AND parent_Category_Id = 14);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Bath', 14 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Bath' AND parent_Category_Id = 14);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Furniture', 14 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Furniture' AND parent_Category_Id = 14);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Home Decor', 14 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Home Decor' AND parent_Category_Id = 14);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Wall Art', 14 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Wall Art' AND parent_Category_Id = 14);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Lighting & Ceiling Fans', 14 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Lighting & Ceiling Fans' AND parent_Category_Id = 14);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Seasonal Decor', 14 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Seasonal Decor' AND parent_Category_Id = 14);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Event & Party Supplies', 14 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Event & Party Supplies' AND parent_Category_Id = 14);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Heating, Cooling & Air Quality', 14 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Heating, Cooling & Air Quality' AND parent_Category_Id = 14);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Iron & Steamers', 14 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Iron & Steamers' AND parent_Category_Id = 14);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Vacuums & Floor Care', 14 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Vacuums & Floor Care' AND parent_Category_Id = 14);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Storage & Organization', 14 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Storage & Organization' AND parent_Category_Id = 14);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Cleaning Supplies', 14 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Cleaning Supplies' AND parent_Category_Id = 14);

------------------------------------------------------------------------------------------------------------------------------

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Abrasive & Finishing Products', 15 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Abrasive & Finishing Products' AND parent_Category_Id = 15);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Additive Manufacturing Products', 15 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Additive Manufacturing Products' AND parent_Category_Id = 15);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Commercial Door Products', 15 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Commercial Door Products' AND parent_Category_Id = 15);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Cutting Tools', 15 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Cutting Tools' AND parent_Category_Id = 15);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Fasteners', 15 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Fasteners' AND parent_Category_Id = 15);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Filtration', 15 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Filtration' AND parent_Category_Id = 15);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Food Service Equipment & Supplies', 15 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Food Service Equipment & Supplies' AND parent_Category_Id = 15);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Hydraulics, Pneumatics & Plumbing', 15 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Hydraulics, Pneumatics & Plumbing' AND parent_Category_Id = 15);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Industrial Electrical', 15 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Industrial Electrical' AND parent_Category_Id = 15);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Industrial Power & Hand Tools', 15 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Industrial Power & Hand Tools' AND parent_Category_Id = 15);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Janitorial & Sanitation Supplies', 15 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Janitorial & Sanitation Supplies' AND parent_Category_Id = 15);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Lab & Scientific Products', 15 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Lab & Scientific Products' AND parent_Category_Id = 15);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Material Handling Products', 15 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Material Handling Products' AND parent_Category_Id = 15);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Occupational Health & Safety Products', 15 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Occupational Health & Safety Products' AND parent_Category_Id = 15);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Packaging & Shipping Supplies', 15 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Packaging & Shipping Supplies' AND parent_Category_Id = 15);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Power Transmission Products', 15 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Power Transmission Products' AND parent_Category_Id = 15);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Professional Dental Supplies', 15 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Professional Dental Supplies' AND parent_Category_Id = 15);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Professional Medical Supplies', 15 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Professional Medical Supplies' AND parent_Category_Id = 15);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Raw Material', 15 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Raw Material' AND parent_Category_Id = 15);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Retail Store Fixtures & Equipment', 15 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Retail Store Fixtures & Equipment' AND parent_Category_Id = 15);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Robotics', 15 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Robotics' AND parent_Category_Id = 15);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Science Education', 15 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Science Education' AND parent_Category_Id = 15);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Tapes, Adhesives & Sealants', 15 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Tapes, Adhesives & Sealants' AND parent_Category_Id = 15);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Test, Measure & Inspect', 15 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Test, Measure & Inspect' AND parent_Category_Id = 15);

------------------------------------------------------------------------------------------------------------------------------

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Carry-ons', 16 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Carry-ons' AND parent_Category_Id = 16);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Backpacks', 16 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Backpacks' AND parent_Category_Id = 16);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Garment Bags', 16 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Garment Bags' AND parent_Category_Id = 16);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Travel Totes', 16 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Travel Totes' AND parent_Category_Id = 16);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Luggage Sets', 16 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Luggage Sets' AND parent_Category_Id = 16);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Laptop Bags', 16 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Laptop Bags' AND parent_Category_Id = 16);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Suitcases', 16 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Suitcases' AND parent_Category_Id = 16);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Kids Luggage', 16 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Kids Luggage' AND parent_Category_Id = 16);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Messenger Bags', 16 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Messenger Bags' AND parent_Category_Id = 16);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Umbrellas', 16 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Umbrellas' AND parent_Category_Id = 16);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Duffles', 16 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Duffles' AND parent_Category_Id = 16);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Travel Accessories', 16 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Travel Accessories' AND parent_Category_Id = 16);

------------------------------------------------------------------------------------------------------------------------------

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Movies', 17 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Movies' AND parent_Category_Id = 17);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'TV Shows', 17 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'TV Shows' AND parent_Category_Id = 17);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Blu-ray', 17 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Blu-ray' AND parent_Category_Id = 17);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT '4K Ultra HD', 17 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = '4K Ultra HD' AND parent_Category_Id = 17);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Best Sellers', 17 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Best Sellers' AND parent_Category_Id = 17);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Today''s Deals', 17 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Today''s Deals' AND parent_Category_Id = 17);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'New Releases', 17 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'New Releases' AND parent_Category_Id = 17);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Pre-orders', 17 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Pre-orders' AND parent_Category_Id = 17);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Kids & Family', 17 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Kids & Family' AND parent_Category_Id = 17);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Prime Video', 17 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Prime Video' AND parent_Category_Id = 17);

------------------------------------------------------------------------------------------------------------------------------

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Dogs', 18 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Dogs' AND parent_Category_Id = 18);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Cats', 18 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Cats' AND parent_Category_Id = 18);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Fish & Aquatic Pets', 18 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Fish & Aquatic Pets' AND parent_Category_Id = 18);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Birds', 18 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Birds' AND parent_Category_Id = 18);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Horses', 18 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Horses' AND parent_Category_Id = 18);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Reptiles & Amphibians', 18 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Reptiles & Amphibians' AND parent_Category_Id = 18);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Small Animals', 18 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Small Animals' AND parent_Category_Id = 18);

------------------------------------------------------------------------------------------------------------------------------

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Accounting & Finance', 19 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Accounting & Finance' AND parent_Category_Id = 19);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Antivirus & Security', 19 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Antivirus & Security' AND parent_Category_Id = 19);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Business & Office', 19 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Business & Office' AND parent_Category_Id = 19);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Children''s', 19 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Children''s' AND parent_Category_Id = 19);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Design & Illustration', 19 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Design & Illustration' AND parent_Category_Id = 19);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Digital Software', 19 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Digital Software' AND parent_Category_Id = 19);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Education & Reference', 19 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Education & Reference' AND parent_Category_Id = 19);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Games', 19 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Games' AND parent_Category_Id = 19);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Lifestyle & Hobbies', 19 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Lifestyle & Hobbies' AND parent_Category_Id = 19);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Music', 19 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Music' AND parent_Category_Id = 19);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Networking & Servers', 19 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Networking & Servers' AND parent_Category_Id = 19);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Operating & Servers', 19 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Operating & Servers' AND parent_Category_Id = 19);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Operating Systems', 19 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Operating Systems' AND parent_Category_Id = 19);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Photography', 19 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Photography' AND parent_Category_Id = 19);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Programming & Web Development', 19 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Programming & Web Development' AND parent_Category_Id = 19);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Tax Preparation', 19 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Tax Preparation' AND parent_Category_Id = 19);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Utilities', 19 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Utilities' AND parent_Category_Id = 19);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Video', 19 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Video' AND parent_Category_Id = 19);

------------------------------------------------------------------------------------------------------------------------------

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Sports and Outdoors', 20 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Sports and Outdoors' AND parent_Category_Id = 20);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Outdoor Recreation', 20 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Outdoor Recreation' AND parent_Category_Id = 20);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Sports & Fitness', 20 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Sports & Fitness' AND parent_Category_Id = 20);

------------------------------------------------------------------------------------------------------------------------------

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Appliances', 21 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Appliances' AND parent_Category_Id = 21);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Building Supplies', 21 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Building Supplies' AND parent_Category_Id = 21);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Electrical', 21 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Electrical' AND parent_Category_Id = 21);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Hardware', 21 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Hardware' AND parent_Category_Id = 21);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Kitchen & Bath Fixtures', 21 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Kitchen & Bath Fixtures' AND parent_Category_Id = 21);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Light Bulbs', 21 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Light Bulbs' AND parent_Category_Id = 21);

INSERT INTO category (attribute, parent_Category_Id) 
SELECT 'Lighting & Ceiling Fans', 21 WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Lighting & Ceiling Fans' AND parent_Category_Id = 21);

INSERT INTO category (attribute, parent_Category_Id)
SELECT 'Measuring & Layout Tools', 21
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Measuring & Layout Tools' AND parent_Category_Id = 21);

INSERT INTO category (attribute, parent_Category_Id)
SELECT 'Painting Supplies & Wall Treatments', 21
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Painting Supplies & Wall Treatments' AND parent_Category_Id = 21);

INSERT INTO category (attribute, parent_Category_Id)
SELECT 'Power & Hand Tools', 21
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Power & Hand Tools' AND parent_Category_Id = 21);

INSERT INTO category (attribute, parent_Category_Id)
SELECT 'Rough Plumbing', 21
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Rough Plumbing' AND parent_Category_Id = 21);

INSERT INTO category (attribute, parent_Category_Id)
SELECT 'Safety & Security', 21
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Safety & Security' AND parent_Category_Id = 21);

INSERT INTO category (attribute, parent_Category_Id)
SELECT 'Storage & Home Organization', 21
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Storage & Home Organization' AND parent_Category_Id = 21);

INSERT INTO category (attribute, parent_Category_Id)
SELECT 'Welding & Soldering', 21
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Welding & Soldering' AND parent_Category_Id = 21);

------------------------------------------------------------------------------------------------------------------------------

INSERT INTO category (attribute, parent_Category_Id)
SELECT 'Action Figures & Statues', 22
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Action Figures & Statues' AND parent_Category_Id = 22);

INSERT INTO category (attribute, parent_Category_Id)
SELECT 'Arts & Crafts', 22
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Arts & Crafts' AND parent_Category_Id = 22);

INSERT INTO category (attribute, parent_Category_Id)
SELECT 'Baby & Toddler Toys', 22
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Baby & Toddler Toys' AND parent_Category_Id = 22);

INSERT INTO category (attribute, parent_Category_Id)
SELECT 'Building Toys', 22
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Building Toys' AND parent_Category_Id = 22);

INSERT INTO category (attribute, parent_Category_Id)
SELECT 'Dolls & Accessories', 22
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Dolls & Accessories' AND parent_Category_Id = 22);

-- Repeat the pattern for the rest of the INSERT statements
INSERT INTO category (attribute, parent_Category_Id)
SELECT 'Dress Up & Pretend Play', 22
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Dress Up & Pretend Play' AND parent_Category_Id = 22);

INSERT INTO category (attribute, parent_Category_Id)
SELECT 'Kid"s Electronic', 22
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Kid"s Electronic' AND parent_Category_Id = 22);

INSERT INTO category (attribute, parent_Category_Id)
SELECT 'Games', 22
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Games' AND parent_Category_Id = 22);

INSERT INTO category (attribute, parent_Category_Id)
SELECT 'Grown-Up Toys', 22
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Grown-Up Toys' AND parent_Category_Id = 22);

INSERT INTO category (attribute, parent_Category_Id)
SELECT 'Hobbies', 22
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Hobbies' AND parent_Category_Id = 22);

INSERT INTO category (attribute, parent_Category_Id)
SELECT 'Kids Furniture, Decor & Storage', 22
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Kids Furniture, Decor & Storage' AND parent_Category_Id = 22);

INSERT INTO category (attribute, parent_Category_Id)
SELECT 'Learning & Education', 22
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Learning & Education' AND parent_Category_Id = 22);

INSERT INTO category (attribute, parent_Category_Id)
SELECT 'Novelty & Gag Toys', 22
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Novelty & Gag Toys' AND parent_Category_Id = 22);

INSERT INTO category (attribute, parent_Category_Id)
SELECT 'Party Supplies', 22
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Party Supplies' AND parent_Category_Id = 22);

INSERT INTO category (attribute, parent_Category_Id)
SELECT 'Puppets', 22
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Puppets' AND parent_Category_Id = 22);

INSERT INTO category (attribute, parent_Category_Id)
SELECT 'Puzzles', 22
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Puzzles' AND parent_Category_Id = 22);

INSERT INTO category (attribute, parent_Category_Id)
SELECT 'Sports & Outdoor Play', 22
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Sports & Outdoor Play' AND parent_Category_Id = 22);

INSERT INTO category (attribute, parent_Category_Id)
SELECT 'Stuffed Animals & Plush Toys', 22
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Stuffed Animals & Plush Toys' AND parent_Category_Id = 22);

INSERT INTO category (attribute, parent_Category_Id)
SELECT 'Toy Remote Control & Play Vehicles', 22
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Toy Remote Control & Play Vehicles' AND parent_Category_Id = 22);

INSERT INTO category (attribute, parent_Category_Id)
SELECT 'Tricycles, Scooters 7 Wagons', 22
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Tricycles, Scooters 7 Wagons' AND parent_Category_Id = 22);

INSERT INTO category (attribute, parent_Category_Id)
SELECT 'Video Games', 22
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Video Games' AND parent_Category_Id = 22);
INSERT INTO category (attribute, parent_Category_Id)

------------------------------------------------------------------------------------------------------------------------------

SELECT 'PlayStation 4', 23
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'PlayStation 4' AND parent_Category_Id = 23);

INSERT INTO category (attribute, parent_Category_Id)
SELECT 'PlayStation 3', 23
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'PlayStation 3' AND parent_Category_Id = 23);

INSERT INTO category (attribute, parent_Category_Id)
SELECT 'Xbox One', 23
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Xbox One' AND parent_Category_Id = 23);

INSERT INTO category (attribute, parent_Category_Id)
SELECT 'Xbox 360', 23
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Xbox 360' AND parent_Category_Id = 23);

INSERT INTO category (attribute, parent_Category_Id)
SELECT 'Nintendo Switch', 23
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Nintendo Switch' AND parent_Category_Id = 23);

INSERT INTO category (attribute, parent_Category_Id)
SELECT 'Wii U', 23
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Wii U' AND parent_Category_Id = 23);

INSERT INTO category (attribute, parent_Category_Id)
SELECT 'Wii', 23
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Wii' AND parent_Category_Id = 23);

INSERT INTO category (attribute, parent_Category_Id)
SELECT 'PC', 23
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'PC' AND parent_Category_Id = 23);

INSERT INTO category (attribute, parent_Category_Id)
SELECT 'Mac', 23
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Mac' AND parent_Category_Id = 23);

INSERT INTO category (attribute, parent_Category_Id)
SELECT 'Nintendo 3DS & 2DS', 23
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Nintendo 3DS & 2DS' AND parent_Category_Id = 23);

INSERT INTO category (attribute, parent_Category_Id)
SELECT 'Nintendo DS', 23
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Nintendo DS' AND parent_Category_Id = 23);

INSERT INTO category (attribute, parent_Category_Id)
SELECT 'PlayStation Vita', 23
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'PlayStation Vita' AND parent_Category_Id = 23);

INSERT INTO category (attribute, parent_Category_Id)
SELECT 'Sony PSP', 23
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Sony PSP' AND parent_Category_Id = 23);

INSERT INTO category (attribute, parent_Category_Id)
SELECT 'Retro Gaming & MicroConsole', 23
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Retro Gaming & MicroConsole' AND parent_Category_Id = 23);

INSERT INTO category (attribute, parent_Category_Id)
SELECT 'Accessories', 23
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Accessories' AND parent_Category_Id = 23);

INSERT INTO category (attribute, parent_Category_Id)
SELECT 'Digital Game', 23
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Digital Game' AND parent_Category_Id = 23);

INSERT INTO category (attribute, parent_Category_Id)
SELECT 'Kids & Family', 23
WHERE NOT EXISTS (SELECT 1 FROM category WHERE attribute = 'Kids & Family' AND parent_Category_Id = 23);
