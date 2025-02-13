create database library;

create table book (
	book_id int primary key,
	title varchar(50),
	author varchar(50),
	published_year int
);

create table member (
	member_id int primary key,
	name varchar(50),
	email varchar(255),
	phone_number varchar(20)
);

create table loan(
	loan_id int primary key,
	book_id int foreign key references book(book_id),
	member_id int foreign key references member(member_id),
	loan_date Date,
	return_date Date default Null
);


insert into book
values (1, '1984', 'George Orwell', 1949),
	(2, 'Molxona', 'George Orwell', 1975),
	(3, 'Yashamoq', 'Yui Xua', 1964),
	(4, 'Men', 'Fotih Duman', 2012),
	(5, 'Katta Oyin', 'Adam Smith', 1823);

insert into member
values (1, 'Tom', 'tom@yandex.ru', '7894521'),
	(2, 'Nail', 'NailAxi@cloud.app', '7894521'),
	(3, 'Alex', 'AlexNa@gmail.com', '7894521'),
	(4, 'Kroos', 'ToniKroos@outlook.ru', '7894521');

insert into loan
values  (1, 2, 1, '2025-02-11', '2025-02-25'),
		(2, 5, 3, '2025-02-21', '2025-03-07'),
		(3, 4, 4, '2024-12-26', Null),
		(4, 5, 4, '2025-01-23', '2025-02-17'),
		(5, 1, 2, '2025-01-11', '2025-01-29'),
		(6, 3, 1, '2025-02-01', Null),
		(7, 2, 3, '2025-02-08', Null),
		(8, 1, 1, '2025-02-14', '2025-03-14');
