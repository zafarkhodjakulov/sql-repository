create table students (
    id int primary key identity,
    name varchar(100),
    classes int,
    tuition_per_class decimal(10,2),
    total_tuition as (classes * tuition_per_class)
);

insert into students
values
	('Alice Johnson', 5, 200.00),
	('Bob Smith', 3, 150.50),
	('Charlie Brown', 4, 180.75);

select * from students;
