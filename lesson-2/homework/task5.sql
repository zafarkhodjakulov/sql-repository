Create table worker (
	id int primary key,
	name varchar(20)
);

BULK INSERT worker
FROM 'D:\bai and ai\sql-repository\lesson-2\employees.csv'
WITH (
	firstrow=2,
	fieldterminator=',',
	rowterminator='\n'
);

Select * from Worker;