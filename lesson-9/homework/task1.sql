drop table if exists Employees;
CREATE TABLE Employees
(
	EmployeeID  INTEGER PRIMARY KEY,
	ManagerID   INTEGER NULL,
	JobTitle    VARCHAR(100) NOT NULL
);
INSERT INTO Employees (EmployeeID, ManagerID, JobTitle) 
VALUES
	(1001, NULL, 'President'),
	(2002, 1001, 'Director'),
	(3003, 1001, 'Office Manager'),
	(4004, 2002, 'Engineer'),
	(5005, 2002, 'Engineer'),
	(6006, 2002, 'Engineer');

with cte as (
	select *, 0 as Depth
    from Employees
    where ManagerID is NULL
	union all
	select 
		emp.EmployeeID as EmployeeID,
		mgr.EmployeeID as ManagerID,
		mgr.JobTitle as JobTitle,
		dense_rank() over (order by emp.ManagerID) as Depth
	from Employees emp
	join Employees mgr
		on emp.ManagerID = mgr.EmployeeID
)
select * from cte
;