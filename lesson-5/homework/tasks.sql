drop table if exists employees;
create table Employees(
  EmployeeID int,
  Name varchar(50),
  Department varchar(50),
  Salary decimal(10,2),
  HireDate date
);
INSERT INTO Employees ([Name], Department, Salary, HireDate) VALUES
('Alice', 'HR', 50000, '2020-06-15'),
('Bob', 'HR', 60000, '2018-09-10'),
('Charlie', 'IT', 70000, '2019-03-05'),
('David', 'IT', 80000, '2021-07-22'),
('Eve', 'Finance', 90000, '2017-11-30'),
('Frank', 'Finance', 75000, '2019-12-25'),
('Grace', 'Marketing', 65000, '2016-05-14'),
('Hank', 'Marketing', 72000, '2019-10-08'),
('Ivy', 'IT', 67000, '2022-01-12'),
('Jack', 'HR', 52000, '2021-03-29');

-- ==================== 1

select
	*,
	ROW_NUMBER() OVER(Order by Salary)
from Employees
Order by EmployeeID;

-- ===================== 2

select * from (
	select *,
		RANK() over(partition by salary order by employeeID) as cnt
	from Employees
	) t
where cnt>=2;

-- ============================ 3

Select * from (
	select *,
		DENSE_RANK() OVER(partition by department order by Salary desc) as cnt
	from Employees
	) t
where cnt <= 2
order by Department, cnt;

-- ============================ 4

Select * from (
	select *,
		DENSE_RANK() OVER(partition by department order by Salary) as cnt
	from Employees
	) t
where cnt = 1
order by Department, cnt;

-- ======================== 5

SELECT
	*,
	SUM(Salary) over(partition by department order by Department)
from Employees;

-- ======================== 6

select 
	distinct department,
	sum(salary) over(partition by department) as total
from Employees;

-- ======================== 7

SELECT
	DISTINCT department,
	CAST(AVG(Salary) OVER(PARTITION BY Department ORDER BY Department) AS INT) 
FROM Employees;

-- ======================== 8

SELECT
	*,
	ABS(Salary - AVG(Salary) OVER(PARTITION BY Department)) as difference_salary
FROM Employees;

-- ======================== 9

SELECT 
	*,
	CAST(AVG(Salary) OVER(ORDER BY NAME ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) AS INT) AS ROW1
FROM Employees
ORDER BY NAME;

-- ======================== 10

SELECT  TOP 3 *,
SUM(Salary) OVER(ORDER BY HireDate DESC) AS TotalSalary
FROM Employees;

--SELECT *, SUM(Salary) OVER() AS TotalSalary
--FROM (
--	SELECT *
--	FROM Employees
--    ORDER BY HireDate DESC
--    OFFSET 0 ROWS FETCH NEXT 3 ROWS ONLY
--) AS Last3Employees;

-- ======================== 11

SELECT
	*,
	AVG(Salary) OVER(ORDER BY EmployeeID) as Average
FROM Employees;

-- ======================== 12

SELECT 
	*,
	MAX(Salary) OVER(ORDER BY EmployeeID ROWS BETWEEN  2 PRECEDING AND 2 FOLLOWING) AS MAX_SALARY
FROM Employees;

-- ======================== 13

SELECT 
	*,
	CAST(Salary / SUM(Salary) OVER (PARTITION BY DEPARTMENT) * 100 AS DECIMAL(10, 2)) AS PER
FROM Employees
ORDER BY DEPARTMENT, PER;

-- ===================

SELECT * FROM Employees;