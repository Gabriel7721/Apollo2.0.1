IF NOT EXISTS (SELECT 1 FROM optionvalue WHERE value = 'Blue' AND option_id = 1)
BEGIN
    INSERT INTO optionvalue (value, option_id) VALUES ('Blue', 1);
END;

IF NOT EXISTS (SELECT 1 FROM optionvalue WHERE value = 'Red' AND option_id = 1)
BEGIN
    INSERT INTO optionvalue (value, option_id) VALUES ('Red', 1);
END;

IF NOT EXISTS (SELECT 1 FROM optionvalue WHERE value = 'S' AND option_id = 2)
BEGIN
    INSERT INTO optionvalue (value, option_id) VALUES ('S', 2);
END;

IF NOT EXISTS (SELECT 1 FROM optionvalue WHERE value = 'M' AND option_id = 2)
BEGIN
    INSERT INTO optionvalue (value, option_id) VALUES ('M', 2);
END;

IF NOT EXISTS (SELECT 1 FROM optionvalue WHERE value = 'XL' AND option_id = 6)
BEGIN
    INSERT INTO optionvalue (value, option_id) VALUES ('XL', 6);
END;

IF NOT EXISTS (SELECT 1 FROM optionvalue WHERE value = 'Pink' AND option_id = 7)
BEGIN
    INSERT INTO optionvalue (value, option_id) VALUES ('Pink', 7);
END;

IF NOT EXISTS (SELECT 1 FROM optionvalue WHERE value = 'Green' AND option_id = 7)
BEGIN
    INSERT INTO optionvalue (value, option_id) VALUES ('Green', 7);
END;

IF NOT EXISTS (SELECT 1 FROM optionvalue WHERE value = '12cm' AND option_id = 8)
BEGIN
    INSERT INTO optionvalue (value, option_id) VALUES ('12cm', 8);
END;

IF NOT EXISTS (SELECT 1 FROM optionvalue WHERE value = '10cm' AND option_id = 8)
BEGIN
    INSERT INTO optionvalue (value, option_id) VALUES ('10cm', 8);
END;

IF NOT EXISTS (SELECT 1 FROM optionvalue WHERE value = 'Pink' AND option_id = 9)
BEGIN
    INSERT INTO optionvalue (value, option_id) VALUES ('Pink', 9);
END;

IF NOT EXISTS (SELECT 1 FROM optionvalue WHERE value = 'Green' AND option_id = 9)
BEGIN
    INSERT INTO optionvalue (value, option_id) VALUES ('Green', 9);
END;

IF NOT EXISTS (SELECT 1 FROM optionvalue WHERE value = '12cm' AND option_id = 10)
BEGIN
    INSERT INTO optionvalue (value, option_id) VALUES ('12cm', 10);
END;

IF NOT EXISTS (SELECT 1 FROM optionvalue WHERE value = '10cm' AND option_id = 10)
BEGIN
    INSERT INTO optionvalue (value, option_id) VALUES ('10cm', 10);
END;

IF NOT EXISTS (SELECT 1 FROM optionvalue WHERE value = 'Pink' AND option_id = 11)
BEGIN
    INSERT INTO optionvalue (value, option_id) VALUES ('Pink', 11);
END;

IF NOT EXISTS (SELECT 1 FROM optionvalue WHERE value = 'Green' AND option_id = 11)
BEGIN
    INSERT INTO optionvalue (value, option_id) VALUES ('Green', 11);
END;

IF NOT EXISTS (SELECT 1 FROM optionvalue WHERE value = '12cm' AND option_id = 12)
BEGIN
    INSERT INTO optionvalue (value, option_id) VALUES ('12cm', 12);
END;

IF NOT EXISTS (SELECT 1 FROM optionvalue WHERE value = '10cm' AND option_id = 12)
BEGIN
    INSERT INTO optionvalue (value, option_id) VALUES ('10cm', 12);
END;






