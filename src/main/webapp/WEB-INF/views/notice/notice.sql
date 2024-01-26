show tables;

create table notice(
	idx int not null auto_increment primary key,
	mid varchar(20) not null,
	nickName varchar(20) not null,
	email varchar(30),
	title varchar(50) not null,
	content text not null,
	wDate datetime default now()
)

insert into notice values(default, '실험자', 'afwe@fase.com', '실험1', '잘저장되나요??')

delete from notice where idx = 1

select * from notice

drop table notice