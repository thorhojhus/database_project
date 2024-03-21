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

INSERT INTO user (user_id, username, upvotes, downvotes)
VALUES
(1, 'john_doe', 50, 10),
(2, 'jane_smith', 75, 5),
(3, 'mike_johnson', 30, 20),
(4, 'emily_brown', 100, 0);

INSERT INTO account (account_id, user_id, passwordhash, email, created_at)

VALUES
(1, 1, 'hash1', 'john@example.com', '2022-01-01 10:00:00'),
(2, 2, 'hash2', 'jane@example.com', '2022-02-15 14:30:00'),
(3, 3, 'hash3', 'mike@example.com', '2022-03-20 09:45:00');

INSERT INTO anon_user (user_id)
VALUES (4);

INSERT INTO forum (forum_id, user_id, description, created_at)
VALUES
(1, 1, 'General Discussion', '2022-01-01 10:00:00'),
(2, 2, 'Technology Talk', '2022-02-15 14:30:00'),
(3, 1, 'Sports Forum', '2022-03-20 09:45:00');

INSERT INTO forum_threads (thread_id, user_id, forum_id, title, content, created_at, sum_of_votes, upvotes, downvotes)
VALUES

(1, 1, 1, 'Welcome to the Forum', 'This is the first post!', '2022-01-01 10:00:00', 10, 15, 5),
(2, 2, 2, 'Latest Tech Gadgets', 'Discuss the latest gadgets here.', '2022-02-15 14:30:00', 25, 30, 5),
(3, 3, 3, 'Upcoming Sports Events', 'Share info on upcoming sports events.', '2022-03-20 09:45:00', 5, 10, 5);

INSERT INTO thread_comments (comment_id, thread_id, user_id, content, created_at, sum_of_votes, upvotes, downvotes)
VALUES
(1, 1, 2, 'Thanks for creating this forum!', '2022-01-02 11:00:00', 8, 10, 2),
(2, 1, 3, 'Glad to be here!', '2022-01-03 09:30:00', 3, 5, 2),
(3, 2, 1, 'I love new tech!', '2022-02-16 10:00:00', 5, 5, 0),
(4, 3, 4, 'Can''t wait for the next game!', '2022-03-21 14:00:00', 0, 0, 0);

INSERT INTO comment_replies (reply_id, comment_id, user_id, content, created_at, sum_of_votes, upvotes, downvotes)
VALUES

(1, 1, 1, 'You''re welcome!', '2022-01-02 12:00:00', 2, 2, 0),
(2, 2, 1, 'Happy to have you!', '2022-01-03 10:00:00', 1, 1, 0),
(3, 3, 2, 'Me too! What''s your favorite?', '2022-02-16 11:30:00', 1, 1, 0);