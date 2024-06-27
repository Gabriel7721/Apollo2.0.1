IF NOT EXISTS (SELECT 1 FROM option_table WHERE name = 'Color' AND product_id = 1)
BEGIN
    INSERT INTO option_table (name, product_id) VALUES ('Color', 1);
END;

IF NOT EXISTS (SELECT 1 FROM option_table WHERE name = 'Size' AND product_id = 1)
BEGIN
    INSERT INTO option_table (name, product_id) VALUES ('Size', 1);
END;

IF NOT EXISTS (SELECT 1 FROM option_table WHERE name = 'Color' AND product_id = 2)
BEGIN
    INSERT INTO option_table (name, product_id) VALUES ('Color', 2);
END;

IF NOT EXISTS (SELECT 1 FROM option_table WHERE name = 'Size' AND product_id = 2)
BEGIN
    INSERT INTO option_table (name, product_id) VALUES ('Size', 2);
END;

IF NOT EXISTS (SELECT 1 FROM option_table WHERE name = 'Color' AND product_id = 3)
BEGIN
    INSERT INTO option_table (name, product_id) VALUES ('Color', 3);
END;

IF NOT EXISTS (SELECT 1 FROM option_table WHERE name = 'Size' AND product_id = 3)
BEGIN
    INSERT INTO option_table (name, product_id) VALUES ('Size', 3);
END;

IF NOT EXISTS (SELECT 1 FROM option_table WHERE name = 'Color' AND product_id = 4)
BEGIN
    INSERT INTO option_table (name, product_id) VALUES ('Color', 4);
END;

IF NOT EXISTS (SELECT 1 FROM option_table WHERE name = 'Length' AND product_id = 4)
BEGIN
    INSERT INTO option_table (name, product_id) VALUES ('Length', 4);
END;

IF NOT EXISTS (SELECT 1 FROM option_table WHERE name = 'Color' AND product_id = 5)
BEGIN
    INSERT INTO option_table (name, product_id) VALUES ('Color', 5);
END;

IF NOT EXISTS (SELECT 1 FROM option_table WHERE name = 'Length' AND product_id = 5)
BEGIN
    INSERT INTO option_table (name, product_id) VALUES ('Length', 5);
END;

IF NOT EXISTS (SELECT 1 FROM option_table WHERE name = 'Color' AND product_id = 6)
BEGIN
    INSERT INTO option_table (name, product_id) VALUES ('Color', 6);
END;

IF NOT EXISTS (SELECT 1 FROM option_table WHERE name = 'Length' AND product_id = 6)
BEGIN
    INSERT INTO option_table (name, product_id) VALUES ('Length', 6);
END;
