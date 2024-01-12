show tables;

create table room (
	checkInDate date not null,
	checkOutDate date not null
);

drop table room;

delete from room where checkInDate = 2024-00-17;

select * from room where checkInDate <= '2024-01-13' and checkOutDate <= '2024-01-15';