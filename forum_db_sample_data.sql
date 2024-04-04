DROP DATABASE IF EXISTS forum_db;
CREATE DATABASE forum_db;
USE forum_db;

DROP TABLE IF EXISTS forum_threads;
DROP TABLE IF EXISTS thread_comments;
DROP TABLE IF EXISTS comment_replies;
DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS account;
DROP TABLE IF EXISTS anon_user;

CREATE TABLE forum (
forum_id INT PRIMARY KEY,
user_id INT,
description VARCHAR(255),
created_at DATETIME
);

CREATE TABLE user (
user_id INT PRIMARY KEY,
username VARCHAR(50),
upvotes INT,
downvotes INT
);

CREATE TABLE account (
account_id INT PRIMARY KEY,
user_id INT,
passwordhash VARCHAR(255),
email VARCHAR(255),
created_at DATETIME,
FOREIGN KEY (user_id) REFERENCES user(user_id)
);

CREATE TABLE anon_user (
user_id INT PRIMARY KEY,
FOREIGN KEY (user_id) REFERENCES user(user_id)
);

CREATE TABLE forum_threads (
thread_id INT PRIMARY KEY,
user_id INT,
forum_id INT,
title VARCHAR(255),
content TEXT,
created_at DATETIME,
sum_of_votes INT,
upvotes INT,
downvotes INT,
FOREIGN KEY (user_id) REFERENCES user(user_id),
FOREIGN KEY (forum_id) REFERENCES forum(forum_id)

);

CREATE TABLE thread_comments (
comment_id INT PRIMARY KEY,
thread_id INT,
user_id INT,
content TEXT,
created_at DATETIME,
sum_of_votes INT,
upvotes INT,
downvotes INT,
FOREIGN KEY (thread_id) REFERENCES forum_threads(thread_id),
FOREIGN KEY (user_id) REFERENCES user(user_id)
);

CREATE TABLE comment_replies (
reply_id INT PRIMARY KEY,
comment_id INT,
user_id INT,
content TEXT,
created_at DATETIME,
sum_of_votes INT,
upvotes INT,
downvotes INT,

FOREIGN KEY (comment_id) REFERENCES thread_comments(comment_id),
FOREIGN KEY (user_id) REFERENCES user(user_id)
);


-- Populate user table
INSERT INTO user (user_id, username, upvotes, downvotes)
VALUES
    (1, 'tech_geek', 1500, 200),
    (2, 'movie_buff', 800, 150),
    (3, 'sports_fanatic', 1200, 100),
    (4, 'bookworm', 900, 50),
    (5, 'gamer_girl', 1100, 80),
    (6, 'fitness_guru', 700, 120),
    (7, 'foodie_lover', 1000, 90),
    (8, 'travel_enthusiast', 1300, 60),
    (9, 'music_addict', 600, 110),
    (10, 'art_collector', 400, 70);

-- Populate account table
INSERT INTO account (account_id, user_id, passwordhash, email, created_at)
VALUES
    (1, 1, '0ed5034e', 'tech_geek@reddit.com', '2022-01-01 10:00:00'),
    (2, 2, '0a4b02a7', 'movie_buff@reddit.com', '2022-02-15 14:30:00'),
    (3, 3, '05ed01d8', 'sports_fanatic@reddit.com', '2022-03-10 09:45:00'),
    (4, 4, '05ee01d9', 'bookworm@reddit.com', '2022-04-05 16:20:00'),
    (5, 5, '05ef01da', 'gamer_girl@reddit.com', '2022-05-20 11:10:00'),
    (6, 6, '05f001db', 'fitness_guru@reddit.com', '2022-06-12 08:30:00'),
    (7, 7, '05f101dc', 'foodie_lover@reddit.com', '2022-07-08 19:45:00'),
    (8, 8, '05f201dd', 'travel_enthusiast@reddit.com', '2022-08-03 13:15:00'),
    (9, 9, '05f301de', 'music_addict@reddit.com', '2022-09-18 22:00:00'),
    (10, 10, '07f10206', 'art_collector@reddit.com', '2022-10-25 17:30:00');

-- Populate anon_user table
INSERT INTO anon_user (user_id)
VALUES
    (4),
    (7),
    (9);

-- Populate forum table
INSERT INTO forum (forum_id, user_id, description, created_at)
VALUES
    (1, 1, 'Technology and Gadgets', '2022-01-01 10:00:00'),
    (2, 2, 'Movies and TV Shows', '2022-02-15 14:30:00'),
    (3, 3, 'Sports and Athletics', '2022-03-10 09:45:00'),
    (4, 4, 'Books and Literature', '2022-04-05 16:20:00'),
    (5, 5, 'Gaming and Esports', '2022-05-20 11:10:00'),
    (6, 6, 'Health and Fitness', '2022-06-12 08:30:00'),
    (7, 7, 'Food and Cuisine', '2022-07-08 19:45:00'),
    (8, 8, 'Travel and Adventure', '2022-08-03 13:15:00'),
    (9, 9, 'Music and Festivals', '2022-09-18 22:00:00'),
    (10, 10, 'Art and Design', '2022-10-25 17:30:00');

-- Populate forum_threads table
INSERT INTO forum_threads (thread_id, user_id, forum_id, title, content, created_at, sum_of_votes, upvotes, downvotes)
VALUES
    (1, 1, 1, 'Latest smartphone releases', 'What are your thoughts on the latest smartphone releases?', '2022-01-01 10:00:00', 50, 60, 10),
    (2, 2, 2, 'Recommendations for sci-fi movies', 'Can anyone recommend some good sci-fi movies to watch?', '2022-02-15 14:30:00', 30, 35, 5),
    (3, 3, 3, 'Favorite sports moments', 'Share your favorite sports moments of all time!', '2022-03-10 09:45:00', 80, 90, 10),
    (4, 4, 4, 'Book club discussion', 'Let''s discuss our thoughts on the latest book we read.', '2022-04-05 16:20:00', 20, 25, 5),
    (5, 5, 5, 'Gaming tournament announcement', 'Announcing the upcoming gaming tournament! Who''s excited?', '2022-05-20 11:10:00', 100, 110, 10),
    (6, 6, 6, 'Workout routine tips', 'Share your favorite workout routines and tips for staying fit.', '2022-06-12 08:30:00', 40, 45, 5),
    (7, 7, 7, 'Recipes for healthy meals', 'Let''s exchange recipes for delicious and healthy meals!', '2022-07-08 19:45:00', 60, 70, 10),
    (8, 8, 8, 'Hidden travel gems', 'What are some hidden travel gems you''ve discovered?', '2022-08-03 13:15:00', 90, 100, 10),
    (9, 9, 9, 'Upcoming music festivals', 'Which music festivals are you excited about this year?', '2022-09-18 22:00:00', 70, 80, 10),
    (10, 10, 10, 'Art exhibition reviews', 'Share your reviews of recent art exhibitions you''ve visited.', '2022-10-25 17:30:00', 30, 35, 5);

-- Populate thread_comments table
INSERT INTO thread_comments (comment_id, thread_id, user_id, content, created_at, sum_of_votes, upvotes, downvotes)
VALUES
    (1, 1, 2, 'I''m excited about the new camera features in the latest smartphones!', '2022-01-01 11:00:00', 15, 20, 5),
    (2, 1, 3, 'I think the battery life improvements are the most notable.', '2022-01-01 12:30:00', 10, 12, 2),
    (3, 2, 1, 'I highly recommend "Interstellar" and "Blade Runner 2049".', '2022-02-15 15:00:00', 8, 10, 2),
    (4, 2, 4, '"Ex Machina" is another great sci-fi movie worth watching.', '2022-02-15 16:30:00', 5, 7, 2),
    (5, 3, 5, 'The comeback victory in the last Super Bowl was incredible!', '2022-03-10 10:15:00', 20, 25, 5),
    (6, 3, 6, 'I still get goosebumps thinking about the winning goal in the World Cup final.', '2022-03-10 11:45:00', 18, 20, 2),
    (7, 4, 7, 'I found the character development in the book to be outstanding.', '2022-04-05 17:00:00', 6, 8, 2),
    (8, 4, 8, 'The plot twist at the end caught me by surprise!', '2022-04-05 18:30:00', 4, 5, 1),
    (9, 5, 9, 'I can''t wait to participate in the gaming tournament! It''s going to be epic.', '2022-05-20 12:00:00', 30, 35, 5),
    (10, 5, 10, 'I''ve been practicing my skills for this tournament. Bring it on!', '2022-05-20 13:30:00', 25, 30, 5);

-- Populate comment_replies table
INSERT INTO comment_replies (reply_id, comment_id, user_id, content, created_at, sum_of_votes, upvotes, downvotes)
VALUES
    (1, 1, 4, 'I agree! The camera quality is amazing.', '2022-01-01 13:00:00', 5, 7, 2),
    (2, 3, 5, 'Those are great recommendations. I would also add "Arrival" to the list.', '2022-02-15 16:00:00', 3, 4, 1),
    (3, 5, 7, 'That comeback was one for the ages!', '2022-03-10 12:00:00', 10, 12, 2),
    (4, 7, 9, 'I completely agree about the character development. It was masterfully done.', '2022-04-05 19:00:00', 2, 3, 1),
    (5, 9, 1, 'Good luck in the tournament! I''ll be rooting for you.', '2022-05-20 14:00:00', 8, 10, 2);

SHOW TABLES;
SELECT * FROM account;
SELECT * FROM user;
SELECT * FROM anon_user;
SELECT * FROM comment_replies;
SELECT * FROM forum;
SELECT * FROM forum_threads;
SELECT * FROM thread_comments;
