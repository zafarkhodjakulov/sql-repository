drop table if exists WorkLog;
create table WorkLog (
	EmployeeID int,
	EmployeeName varchar(50),
	Department varchar(50),
	WorkDate date,
	HoursWorked decimal(10, 2)
);

INSERT INTO WorkLog
VALUES
    (1, 'Alice', 'HR', '2024-03-01', 8),
    (2, 'Bob', 'IT', '2024-03-01', 9),
    (3, 'Charlie', 'Sales', '2024-03-02', 7),
    (1, 'Alice', 'HR', '2024-03-03', 6),
    (2, 'Bob', 'IT', '2024-03-03', 8),
    (3, 'Charlie', 'Sales', '2024-03-04', 9);

select * from WorkLog;

drop view if exists vw_MonthlyWorkSummary;
create view vw_MonthlyWorkSummary as 
with cte as (
	select distinct
		EmployeeID, EmployeeName, Department,
		sum(HoursWorked) over (partition by EmployeeID) TotalHoursWorked
	from WorkLog
),
cte1 as (
	select distinct
		Department, 
		sum(HoursWorked) over (partition by EmployeeID) TotalHoursDepartment,
		avg(HoursWorked) over (partition by EmployeeID) AverageHoursDepartment
	from WorkLog
)
select 
	cte.EmployeeID,
	cte.EmployeeName,
	cte.Department,
	cte.TotalHoursWorked,
	cte1.TotalHoursDepartment,
	cte1.AverageHoursDepartment
from cte
join cte1
	on cte.Department = cte1.Department

select * from vw_MonthlyWorkSummary;



