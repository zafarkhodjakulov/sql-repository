drop table if exists emplooyees_n;
create table emplooyees_n
(
    EmployeeID int NOT NULL,
    FirstName varchar(20) NULL,
    HireDate date NOT NULL
);
INSERT INTO emplooyees_n 
VALUES  (1, 'John', '1975-06-15'),
		(2, 'Alice', '1976-08-20'),
		(3, 'Bob', '1977-03-10'),
		(4, 'Charlie', '1979-11-25'),
		(5, 'David', '1980-07-12'),
		(6, 'Eve', '1982-04-18'),
		(7, 'Frank', '1983-09-05'),
		(8, 'Grace', '1984-12-30'),
		(9, 'Hank', '1985-06-22'),
		(10, 'Ivy', '1990-02-14'),
		(11, 'Jack', '1997-05-09');

select 
	CONCAT(min(y), '-', MAX(y)) as all_years
from (
	select
		y,
		y- ROW_NUMBER() over(order by y) as years
	from (
		select
			t.yil as y
		from (
			select ordinal + 1970 as yil
			from string_split(replicate(',', year(getdate()) - 1971), ',', 1)) t
		left join emplooyees_n e
			on year(e.hiredate) = t.yil
		where year(e.hiredate) is null
		) t1
		where y > 1975
	) t2
group by years;