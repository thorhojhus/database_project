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
}

Table post {
  subforum_id varchar(255)
  post_id varchar(255)
  user_id varchar(255)
  title varchar(255)
  body text
  content_id varchar(255)
  created_at timestamp
}

Table comment {
  user_id varchar(255)
  content_id varchar(255)
  body text
  created_at timestamp
}

Table vote {
  user_id varchar(255)
  content_id varchar(255)
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
Ref: user.user_id < vote.user_id

//post references
Ref: post.subforum_id > forum.subforum_id
Ref: comment.content_id > post.content_id

//vote references
Ref: vote.content_id > post.content_id
Ref: vote.content_id > comment.content_id

//anon
Ref: anon.user_id > comment.user_id
Ref: anon.user_id > vote.user_id
