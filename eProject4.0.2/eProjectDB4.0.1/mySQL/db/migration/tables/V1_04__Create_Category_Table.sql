CREATE TABLE IF NOT EXISTS category (
    ID  INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    ATTRIBUTE VARCHAR(255) NOT NULL,
    PARENT_CATEGORY_ID INT ,
    FOREIGN KEY (PARENT_CATEGORY_ID) REFERENCES category(ID)
)