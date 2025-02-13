create table orders (
	order_id int primary key,
	customer_name varchar(50),
	order_date date
);

Alter Table orders
drop constraint PK__orders__46596229345069CE;

Alter table orders
Add primary key (order_id);
