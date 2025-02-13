create table customer(
	customer_id int primary key,
	name varchar(50),
	city varchar(20) CONSTRAINT df_city default 'Unknown'
);
drop table if exists customer;

Alter table customer
drop constraint df_city;

Alter table customer 
add constraint df_city
default 'Unknown' for city;