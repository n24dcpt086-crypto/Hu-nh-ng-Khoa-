drop table if exists post_like;
drop table if exists post;
create table post (
post_id serial primary key,
user_id int not null,
content text,
tags text[] ,
created_at timestamp default current_timestamp,
is_public boolean default true
);
create table post_like (
user_id int not null,
post_id int not null,
liked_at timestamp default current_timestamp,
primary key (user_id, post_id)
);
select * from post
where is_public = true 
and content ilike '%du lịch%';
create index idx_post_content_lower
on post (lower(content));
explain analyze 
select * from post 
where is_public = true 
and lower(content) ilike '%du lịch%';
explain analyze 
select * from post 
where tags @> array['tech'];
create index idx_post_tags_gin
on post using gin(tags);
explain analyze 
select * from post 
where tags @> array['tech'];
SELECT * FROM post
WHERE is_public = TRUE
AND created_at >= NOW() - INTERVAL '7 days';
CREATE INDEX idx_post_public_recent
ON post (created_at desc)
WHERE is_public = TRUE; 
create index idx_post_user_created_desc
on post (user_id, created_at desc);
explain analyze 
select * from post 
where user_id in(1,2,3)
order by created_at desc ;

