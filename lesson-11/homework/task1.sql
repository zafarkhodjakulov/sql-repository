drop table if exists Employees;
create table Employees (
	EmployeeID int,
	Name varchar(50),
	Department varchar(50),
	Salary int
);
insert into Employees
values	(1, 'Alice', 'HR', 5000),
		(2, 'Bob', 'IT', 7000),
		(3, 'Charlie', 'Sales', 6000),
		(4, 'David', 'HR', 5500),
		(5, 'Emma', 'IT', 7200);

drop table if exists #EmployeeTransfers;
create table #EmployeeTransfers (
	EmployeeID int,
	Name varchar(50),
	Department varchar(50),
	Salary int
);

insert into #EmployeeTransfers
select	EmployeeID,
		Name,
		(CASE 
			WHEN Department = 'HR' THEN 'IT' 
			WHEN Department = 'IT' THEN 'Sales'
		ELSE 'HR' 
		END) as Department,
		Salary
from Employees;

select * from Employees;
select * from #EmployeeTransfers;