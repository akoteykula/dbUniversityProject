CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  first_name VARCHAR(64),
  last_name VARCHAR(64) NULL,
  email VARCHAR(128) UNIQUE,
  created_at TIMESTAMP
);

CREATE TABLE channels (
  id INTEGER PRIMARY KEY,
  name VARCHAR(64),
  shortName VARCHAR(64) NULL,
  language CHAR(4),
  creator_id INTEGER,
  CONSTRAINT relation_channels_fk FOREIGN KEY (creator_id) REFERENCES users (id)
);

CREATE TABLE videos (
  id INTEGER PRIMARY KEY,
  name VARCHAR(128),
  description VARCHAR(1024) NULL,
  shortLink VARCHAR(32) UNIQUE,
  channel_id INTEGER,
  CONSTRAINT relation_videos_fk FOREIGN KEY (channel_id) REFERENCES channels (id)
);

CREATE TABLE comments (
  id INTEGER PRIMARY KEY,
  user_id INTEGER,
  video_id INTEGER,
  t_content VARCHAR(512),
  reply_comment_id INTEGER NULL,
  created_at TIMESTAMP,
  CONSTRAINT relation_comments_fk1 FOREIGN KEY (user_id) REFERENCES users (id),
  CONSTRAINT relation_comments_fk2 FOREIGN KEY (video_id) REFERENCES videos (id),
  CONSTRAINT relation_comments_fk3 FOREIGN KEY (reply_comment_id) REFERENCES comments (id)
);

CREATE TABLE likes (
  id INTEGER PRIMARY KEY,
  user_id INTEGER,
  channel_id INTEGER,
  created_at TIMESTAMP,
  CONSTRAINT relation_likes_fk1 FOREIGN KEY (user_id) REFERENCES users (id),
  CONSTRAINT relation_likes_fk2 FOREIGN KEY (channel_id) REFERENCES channels (id)
);

CREATE TABLE channel_subscribers (
  id INTEGER PRIMARY KEY,
  user_id INTEGER,
  channel_id INTEGER,
  created_at TIMESTAMP,
  CONSTRAINT relation_channel_subscribers_fk1 FOREIGN KEY (user_id) REFERENCES users (id),
  CONSTRAINT relation_channel_subscribers_fk2 FOREIGN KEY (channel_id) REFERENCES channels (id)
);
