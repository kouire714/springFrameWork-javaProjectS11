show tables;

create table member (
	idx int not null auto_increment primary key,
	mid varchar(20) not null,
	pwd varchar(50) not null,
	nickName varchar(20) not null,
	name varchar(20) not null,
	gender char(2),
	birth varchar(8),
	address varchar(70),
	phone varchar(11) not null,
	email varchar(30) not null,
	level int default 1
);

drop table member

insert into member values (default, 'gildong', '1234', '길동원', '길동', '남자', '19951025', '길동마을', '010-1234-1234', 'gildong@naver.com', default)