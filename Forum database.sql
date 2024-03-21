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

Table post {
  subforum_id varchar(255)
  post_id varchar(255)
  user_id varchar(255)
  title varchar(255)
  body text
  created_at timestamp
}

Table comment {
  user_id varchar(255)
  comment_id varchar(255)
  body text
  created_at timestamp
}

Table forum {
  subforum_id varchar(255)
  admin_id varchar(255)
  created_at timestamp
}

Table anon {
  user_id varchar(255)
  ip_address varchar(255)
  created_at timestamp
}


//user_id references
Ref: user.user_id < account.user_id
Ref: user.user_id < comment.user_id
Ref: user.user_id < forum.admin_id
Ref: user.user_id < post.user_id
Ref: user.upvotes < post.post_id
Ref: user.downvotes < post.post_id
Ref: user.upvotes < comment.comment_id
Ref: user.downvotes < comment.comment_id


//post references
Ref: post.subforum_id < forum.subforum_id
Ref: comment.comment_id > post.post_id

//vote references


//anon
