// Use DBML to define your database structure
// Docs: https://dbml.dbdiagram.io/docs

Table account {
  user_id varchar(255)
  passwordhash varchar(255)
  email varchar(255)
}

Table user {
  user_id varchar(255)
  username varchar(255)
  created_at timestamp
  upvotes longtext
  downvotes longtext
}

Table thread {
  forum_id varchar(255)
  thread_id varchar(255)
  user_id varchar(255)
  title varchar(255)
  body text
  sum_of_votes int
  created_at timestamp
}

Table comment {
  comment_id varchar(255)
  thread_id varchar(255)
  user_id varchar(255)
  content text
  created_at timestamp
  sum_of_votes int
}
Table reply {
  reply_id varchar(255)
  comment_id varchar(255)
  user_id varchar(255)
  content text
  created_at timestamp
  sum_of_votes int
}

Table forum {
  forum_id varchar(255)
  admin_id varchar(255)
  description text
  created_at timestamp
}

Table anon {
  user_id varchar(255)
  ip_address varchar(255)
  created_at timestamp
}


//user_id references
Ref: user.user_id < account.user_id
Ref: user.user_id < forum.admin_id
Ref: user.user_id < thread.user_id
Ref: user.user_id < comment.thread_id
Ref: user.upvotes < thread.thread_id
Ref: user.downvotes < thread.thread_id
Ref: user.upvotes < comment.comment_id
Ref: user.downvotes < comment.comment_id


//thread references
Ref: thread.forum_id < forum.forum_id
Ref: comment.comment_id > thread.thread_id

//replyreferences
Ref: reply.user_id < anon.user_id
Ref: reply.user_id < user.user_id
Ref: comment.comment_id < reply.comment_id

//anon
Ref: anon.user_id > comment.thread_id
Ref: anon.user_id > comment.comment_id
