create table books(
	book_id int primary key identity,
	title varchar(50) not null,
	price decimal check(price > 0),
	genre varchar(50) default 'Unknown'
);

insert into books (title, price)
values ('1984', 9)

insert into books (title, price)
values ('1984', 9, 'literature')
