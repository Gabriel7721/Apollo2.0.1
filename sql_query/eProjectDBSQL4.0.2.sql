drop database Apollo103

-- jdbc:sqlserver://localhost:1433;authentication=sqlPassword;databaseName=Apollo101;encrypt=true;trustServerCertificate=true

create database Apollo103
go
use Apollo103
go

use master

UPDATE store
SET interactive_image = 'https://m.media-amazon.com/images/S/al-na-9d5791cf-3faf/88d230b8-5f6d-4382-a2aa-a238f6d2131c._CR0%2C0%2C3000%2C1500_SX1500_.png'
WHERE id = 1;
go
select * from store
go

UPDATE product
SET main_picture = 'https://m.media-amazon.com/images/I/71NngboUC6L._AC_SL1500_.jpg'
WHERE id = 5;
go
select * from product
go

INSERT INTO variant_optionvalue VALUES (6, 4);
select * from variant_optionvalue
ALTER TABLE product
ALTER COLUMN description VARCHAR(2000);

ALTER TABLE review
ALTER COLUMN content VARCHAR(2000);

select * from verification_token
select * from users
select * from admins
select * from shippers

select * from store
select * from store_category
select * from product
select * from category

select * from cart

select * from cart_line
select * from variant
select * from optionvalue
select * from option_table
select * from variant_optionvalue
select * from image
select * from video
select * from review
select * from shop_order

select * from address
select * from payment_method
select * from shipping_method

select * from verification_token
select * from flyway_schema_history


SELECT id FROM store_category WHERE id = 15;

delete from store where id IN (2);
DELETE FROM variant_optionvalue
WHERE (variant_id = 6 AND optionvalue_id = 6)
   OR (variant_id = 6 AND optionvalue_id = 6);
DELETE FROM cart WHERE id IN (2);
DELETE FROM store_category WHERE id BETWEEN 15 AND 21;
delete from variant where id = 1
delete from store_category where id = 19

-- Drop all foreign key constraints referencing the table
-- Drop foreign key constraints
ALTER TABLE bullet DROP CONSTRAINT constraint_name;
ALTER TABLE cart_line DROP CONSTRAINT constraint_name;
ALTER TABLE comment DROP CONSTRAINT constraint_name;
ALTER TABLE hashtag DROP CONSTRAINT constraint_name;
ALTER TABLE review DROP CONSTRAINT constraint_name;
ALTER TABLE save_for_later DROP CONSTRAINT constraint_name1;
ALTER TABLE variant_optionvalue DROP CONSTRAINT constraint_name1;
ALTER TABLE verification_token DROP CONSTRAINT constraint_name1;
ALTER TABLE video DROP CONSTRAINT constraint_name1;
ALTER TABLE cart DROP CONSTRAINT constraint_name1;
ALTER TABLE optionvalue DROP CONSTRAINT constraint_name1;
ALTER TABLE option_table DROP CONSTRAINT constraint_name1;
ALTER TABLE category DROP CONSTRAINT constraint_name;
ALTER TABLE address DROP CONSTRAINT constraint_name;
ALTER TABLE image DROP CONSTRAINT constraint_name1;
ALTER TABLE payment_method DROP CONSTRAINT constraint_name1;
ALTER TABLE productattribute DROP CONSTRAINT constraint_name1;
ALTER TABLE shipping_method DROP CONSTRAINT constraint_name1;
ALTER TABLE users DROP CONSTRAINT constraint_name1;
ALTER TABLE variant DROP CONSTRAINT constraint_name1;
ALTER TABLE product DROP CONSTRAINT constraint_name1;
ALTER TABLE store_category DROP CONSTRAINT constraint_name1;
ALTER TABLE store DROP CONSTRAINT seller_id;
ALTER TABLE seller DROP CONSTRAINT constraint_name1;
ALTER TABLE flyway_schema_history DROP CONSTRAINT constraint_name1;


-- Drop the table
DROP TABLE IF EXISTS category;

drop table bullet
drop table cart_line
drop table comment
drop table hashtag
drop table review
drop table save_for_later
drop table variant_optionvalue
drop table verification_token
drop table video
drop table cart
drop table optionvalue
drop table option_table
drop table category
drop table address
drop table image
drop table payment_method
drop table productattribute
drop table shipping_method
drop table users
drop table variant
drop table product
drop table store_category
drop table store
drop table seller
drop table flyway_schema_history

UPDATE variant
SET img = 'https://m.media-amazon.com/images/I/61NKaFRAyRL._AC_SL1500_.jpg',
    is_deleted = NULL,
    name = 'SAMSUNG Galaxy Z Flip5 AI Phone, 256GB Unlocked Android Smartphone, Compact, Foldable Design, One-Hand Control, Best Selfies, Full Cover Screen, Hands-Free Use, US Version, 2023, Mint',
    price = 150.91,
    sale_price = 125.19,
    sku_code = 'SKU007',
    stock_quantity = 100,
    weight = 0.65,
    product_id = 1
WHERE id = 7;

UPDATE variant_optionvalue
SET variant_id = 6, optionvalue_id = 6
WHERE variant_id = 6 AND optionvalue_id = 4;

UPDATE variant_optionvalue
SET variant_id = 6, optionvalue_id = 4
WHERE variant_id = 6 AND optionvalue_id = 6;

