SELECT forum_id, description, created_at FROM forum WHERE user_id = 1;

SELECT thread_id, title, content FROM forum_threads WHERE forum_id = 2;

SELECT forum_id, COUNT(thread_id) AS thread_count FROM forum_threads GROUP BY forum_id;

SELECT username, upvotes FROM user ORDER BY upvotes DESC LIMIT 5;

SELECT thread_id, (upvotes + downvotes) AS total_votes FROM forum_threads;

SELECT ft.thread_id, ft.title, u.username
FROM forum_threads AS ft
JOIN user AS u ON ft.user_id = u.user_id;

SELECT cr.reply_id, cr.content, u.username
FROM comment_replies AS cr
JOIN user AS u ON cr.user_id = u.user_id
WHERE cr.comment_id = 1;

SELECT u.username, ft.title, tc.content
FROM user AS u
JOIN forum_threads ft ON u.user_id = ft.user_id
JOIN thread_comments tc ON ft.thread_id = tc.thread_id
WHERE u.username = 'tech_geek';

SELECT thread_id, title, content, created_at, sum_of_votes, upvotes, downvotes
FROM forum_threads
WHERE forum_id = 2;

SELECT * FROM forum;

SELECT * FROM anon_user;

SELECT ft.thread_id, ft.title, ft.content, ft.created_at, ft.sum_of_votes, ft.upvotes, ft.downvotes
FROM forum_threads AS ft
JOIN forum AS f ON ft.forum_id = f.forum_id
WHERE f.description = 'Technology and Gadgets';

SELECT * FROM forum;
