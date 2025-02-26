### Table Structure

```
Employees:
    - EmployeeID    INT
    - Name          VARCHAR(50)
    - Department    VARCHAR(50)
    - Salary        DECIMAL(10,2)
    - HireDate      DATE

drop table if exists Employees;
CREATE TABLE Employees (
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    [Name] VARCHAR(50) NOT NULL,
    Department VARCHAR(50) NOT NULL,
    Salary DECIMAL(10,2) NOT NULL,
    HireDate DATE NOT NULL
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

```

---

### Tasks

#### Ranking Functions

1. Assign a Unique Rank to Each Employee Based on Salary
2. Find Employees Who Have the Same Salary Rank
3. Identify the Top 2 Highest Salaries in Each Department
4. Find the Lowest-Paid Employee in Each Department
5. Calculate the Running Total of Salaries in Each Department
6. Find the Total Salary of Each Department Without GROUP BY
7. Calculate the Average Salary in Each Department Without GROUP BY
8. Find the Difference Between an Employee’s Salary and Their Department’s Average
9. Calculate the Moving Average Salary Over 3 Employees (Including Current, Previous, and Next)
10. Find the Sum of Salaries for the Last 3 Hired Employees
11. Calculate the Running Average of Salaries Over All Previous Employees
12. Find the Maximum Salary Over a Sliding Window of 2 Employees Before and After
13. Determine the Percentage Contribution of Each Employee’s Salary to Their Department’s Total Salary
