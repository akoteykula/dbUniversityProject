-- Inserting data into users table
INSERT INTO users (id, first_name, last_name, email, created_at) VALUES (1, 'Amal', 'Khamidov', 'khamidovamal@gmail.com', CURRENT_TIMESTAMP);

-- Inserting data into channels table
INSERT INTO channels (id, name, shortName, language, creator_id) VALUES (1, 'Mister Beast', 'beast', 'EN', 1);

-- Inserting data into videos table
INSERT INTO videos (id, name, description, shortLink, channel_id) VALUES (1, 'Video 1', 'This is video 1', 'v1', 1);

-- Inserting data into comments table
INSERT INTO comments (id, user_id, video_id, t_content, reply_comment_id, created_at) VALUES (1, 1, 1, 'Cool Vid', NULL, CURRENT_TIMESTAMP);

-- Inserting data into likes table
INSERT INTO likes (id, user_id, channel_id, created_at) VALUES (1, 1, 1, CURRENT_TIMESTAMP);

-- Inserting data into channel_subscribers table
INSERT INTO channel_subscribers (id, user_id, channel_id, created_at) VALUES (1, 1, 1, CURRENT_TIMESTAMP);

-- Select all users
SELECT * FROM users;

-- Select users with a specific last name
SELECT * FROM users WHERE last_name = 'Khamidov';

-- Select channels created by a specific user
SELECT * FROM channels WHERE creator_id = 1;

-- Select videos from a specific channel
SELECT * FROM videos WHERE channel_id = 1;

-- Select comments for a specific video
SELECT * FROM comments WHERE video_id = 1;

-- Select likes from a specific user
SELECT * FROM likes WHERE user_id = 1;

-- Select subscribers of a specific channel
SELECT * FROM channel_subscribers WHERE channel_id = 1;

-- Select all videos with their channel names
SELECT videos.name AS video_name, channels.name AS channel_name FROM videos INNER JOIN channels ON videos.channel_id = channels.id;

-- Select all comments with their user names and video names
SELECT comments.id AS comment_id, users.first_name AS user_name, videos.name AS video_name FROM comments INNER JOIN users ON comments.user_id = users.id INNER JOIN videos ON comments.video_id = videos.id;

-- Select all likes with their user names and channel names
SELECT likes.id AS like_id, users.first_name AS user_name, channels.name AS channel_name FROM likes INNER JOIN users ON likes.user_id = users.id INNER JOIN channels ON likes.channel_id = channels.id;

-- Select all channel subscribers with their user names and channel names
SELECT channel_subscribers.id AS subscriber_id, users.first_name AS user_name, channels.name AS channel_name FROM channel_subscribers INNER JOIN users ON channel_subscribers.user_id = users.id INNER JOIN channels ON channel_subscribers.channel_id = channels.id;

-- Count the number of videos in each channel
SELECT channel_id, COUNT(*) AS video_count FROM videos GROUP BY channel_id;

-- Count the number of comments for each video
SELECT video_id, COUNT(*) AS comment_count FROM comments GROUP BY video_id;

-- Count the number of likes for each channel
SELECT channel_id, COUNT(*) AS like_count FROM likes GROUP BY channel_id;

-- Count the number of subscribers for each channel
SELECT channel_id, COUNT(*) AS subscriber_count FROM channel_subscribers GROUP BY channel_id;
