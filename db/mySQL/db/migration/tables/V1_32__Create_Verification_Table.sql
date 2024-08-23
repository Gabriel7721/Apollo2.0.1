CREATE TABLE IF NOT EXISTS verification_token(
    ID INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    TOKEN VARCHAR(200),
    EXPIRY_DATE DATE,
    USER_ID INT UNIQUE,
    FOREIGN KEY (USER_ID) REFERENCES user (ID)
    );