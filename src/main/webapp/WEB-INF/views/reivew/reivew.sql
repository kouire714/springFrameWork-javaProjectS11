show tables;

create table review (
	idx int not null auto_increment primary key,
	nickName varchar(20) not null,
	email varchar(30),
	title varchar(50) not null,
	content text not null
)

insert into review values (default, '승수', 'kourie2@gmail.com', '게시판글', '게시판글작동되나용?');

drop table review