-- Insert images if they do not exist
IF NOT EXISTS (
    SELECT 1 FROM image WHERE img_path = 'https://m.media-amazon.com/images/I/91dI8T51gYL._AC_SX679_.jpg' AND variant_id = 1 AND store_category_id IS NULL
)
BEGIN
    INSERT INTO image (img_path, variant_id, store_category_id) VALUES ('https://m.media-amazon.com/images/I/91dI8T51gYL._AC_SX679_.jpg', 1, NULL);
END

IF NOT EXISTS (
    SELECT 1 FROM image WHERE img_path = 'https://m.media-amazon.com/images/I/715HTlX42QL._AC_SX679_.jpg' AND variant_id = 1 AND store_category_id IS NULL
)
BEGIN
    INSERT INTO image (img_path, variant_id, store_category_id) VALUES ('https://m.media-amazon.com/images/I/715HTlX42QL._AC_SX679_.jpg', 1, NULL);
END

IF NOT EXISTS (
    SELECT 1 FROM image WHERE img_path = 'https://m.media-amazon.com/images/I/81pwUSEVbbL._AC_SX679_.jpg' AND variant_id = 1 AND store_category_id IS NULL
)
BEGIN
    INSERT INTO image (img_path, variant_id, store_category_id) VALUES ('https://m.media-amazon.com/images/I/81pwUSEVbbL._AC_SX679_.jpg', 1, NULL);
END

IF NOT EXISTS (
    SELECT 1 FROM image WHERE img_path = 'https://m.media-amazon.com/images/I/71VgBuiQSfL._AC_SX679_.jpg' AND variant_id = 1 AND store_category_id IS NULL
)
BEGIN
    INSERT INTO image (img_path, variant_id, store_category_id) VALUES ('https://m.media-amazon.com/images/I/71VgBuiQSfL._AC_SX679_.jpg', 1, NULL);
END

IF NOT EXISTS (
    SELECT 1 FROM image WHERE img_path = 'https://m.media-amazon.com/images/I/913mGdwOKEL._AC_SX679_.jpg' AND variant_id = 2 AND store_category_id IS NULL
)
BEGIN
    INSERT INTO image (img_path, variant_id, store_category_id) VALUES ('https://m.media-amazon.com/images/I/913mGdwOKEL._AC_SX679_.jpg', 2, NULL);
END

IF NOT EXISTS (
    SELECT 1 FROM image WHERE img_path = 'https://m.media-amazon.com/images/I/91PiwPsIvhL._AC_SX679_.jpg' AND variant_id = 2 AND store_category_id IS NULL
)
BEGIN
    INSERT INTO image (img_path, variant_id, store_category_id) VALUES ('https://m.media-amazon.com/images/I/91PiwPsIvhL._AC_SX679_.jpg', 2, NULL);
END

-- Repeat similar IF NOT EXISTS blocks for the remaining image insertions

IF NOT EXISTS (
    SELECT 1 FROM image WHERE img_path = 'https://m.media-amazon.com/images/I/61JQeqmlXdL._AC_SX679_.jpg' AND variant_id = 6 AND store_category_id IS NULL
)
BEGIN
    INSERT INTO image (img_path, variant_id, store_category_id) VALUES ('https://m.media-amazon.com/images/I/61JQeqmlXdL._AC_SX679_.jpg', 6, NULL);
END
