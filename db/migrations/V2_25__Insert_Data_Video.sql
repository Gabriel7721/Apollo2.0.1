-- Insert videos if they do not exist
IF NOT EXISTS (
    SELECT 1 FROM video WHERE video_path = 'video1.mp4' AND variant_id = 1
)
BEGIN
    INSERT INTO video (video_path, variant_id) VALUES ('video1.mp4', 1);
END

IF NOT EXISTS (
    SELECT 1 FROM video WHERE video_path = 'video2.mp4' AND variant_id = 2
)
BEGIN
    INSERT INTO video (video_path, variant_id) VALUES ('video2.mp4', 2);
END
