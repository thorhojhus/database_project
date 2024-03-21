CREATE TABLE `account` (
  `user_id` varchar(255),
  `passwordhash` varchar(255),
  `email` varchar(255)
);

CREATE TABLE `user` (
  `user_id` varchar(255),
  `username` varchar(255),
  `created_at` timestamp
);

CREATE TABLE `post` (
  `subforum_id` varchar(255),
  `post_id` varchar(255),
  `user_id` varchar(255),
  `title` varchar(255),
  `body` text,
  `content_id` varchar(255),
  `created_at` timestamp
);

CREATE TABLE `comment` (
  `user_id` varchar(255),
  `content_id` varchar(255),
  `body` text,
  `created_at` timestamp
);

CREATE TABLE `vote` (
  `user_id` varchar(255),
  `content_id` varchar(255)
);

CREATE TABLE `subforum` (
  `subforum_id` varchar(255),
  `admin_id` varchar(255),
  `created_at` timestamp
);

ALTER TABLE `account` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

ALTER TABLE `comment` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

ALTER TABLE `subforum` ADD FOREIGN KEY (`admin_id`) REFERENCES `user` (`user_id`);

ALTER TABLE `post` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

ALTER TABLE `vote` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

ALTER TABLE `post` ADD FOREIGN KEY (`subforum_id`) REFERENCES `subforum` (`subforum_id`);

ALTER TABLE `comment` ADD FOREIGN KEY (`content_id`) REFERENCES `post` (`content_id`);

ALTER TABLE `vote` ADD FOREIGN KEY (`content_id`) REFERENCES `post` (`content_id`);

ALTER TABLE `vote` ADD FOREIGN KEY (`content_id`) REFERENCES `comment` (`content_id`);
