use Lesson6;
drop table if exists Employees;
drop table if exists Departments;
drop table if exists Projects;
create table Employees (
	ID int primary key identity,
	Name varchar(20),
	DepartmentID int,
	Salary int
);

create table Departments (
	DepartmentID int,
	DepartmentName varchar(20)
);

create table Projects (
	ProjectID int primary key identity,
	ProjectName varchar(50),
	EmployeeID int
);
insert into Employees
values  ('Alice', 101, 60000),
		('Bob', 102, 70000),
		('Charlie', 101, 65000),
		('David', 103, 72000),
		('Eva', NULL, 68000);

insert into Departments
values  (101, 'IT'),
		(102, 'HR'),
		(103, 'Finance'),
		(104, 'Marketing');

insert into Projects
values  ('Alpha', 1),
		('Betta', 2),
		('Gamma', 1),
		('Delta', 4),
		('Omega', NULL);


-- task1
select
	* 
from Employees e
join Departments d
	on e.DepartmentID = d.DepartmentID;

-- task2
select
	* 
from Employees e
left join Departments d
	on e.DepartmentID = d.DepartmentID;

-- task3
select
	* 
from Employees e
right join Departments d
	on e.DepartmentID = d.DepartmentID;

-- task4
select
	* 
from Employees e
full outer join Departments d
	on e.DepartmentID = d.DepartmentID;

-- task5
select
	e.ID,
	e.Name,
	d.departmentname,
	e.salary,
	sum(Salary) over(partition by e.departmentid) as total_salary
from Employees e
join Departments d
	on e.DepartmentID = d.DepartmentID;

-- task6
select
	*
from Departments d
cross join Projects p

-- task7
select
	e.ID,
	e.Name,
	e.Salary,
	d.DepartmentID,
	p.ProjectName
from Employees e
join Departments d
	on e.DepartmentID = d.DepartmentID
full outer join Projects p
	on p.EmployeeID = e.ID
