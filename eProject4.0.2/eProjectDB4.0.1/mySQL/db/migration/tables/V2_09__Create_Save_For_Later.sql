CREATE TABLE IF NOT EXISTS save_for_later
(
    ID         INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    QUANTITY   INT                NOT NULL CHECK ( QUANTITY >= 0 ),
    CART_ID    INT,
    VARIANT_ID INT,
    FOREIGN KEY (CART_ID) REFERENCES cart (ID),
    FOREIGN KEY (VARIANT_ID) REFERENCES variant (ID)
);