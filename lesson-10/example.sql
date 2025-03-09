drop table if exists Orders;
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    OrderDate DATE
);

drop table if exists OrderDetails;
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductName VARCHAR(100),
    Quantity INT,
    UnitPrice DECIMAL(10,2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

INSERT INTO Orders VALUES
(1, 'Alice', '2024-03-01'),
(2, 'Bob', '2024-03-02'),
(3, 'Charlie', '2024-03-03');

INSERT INTO OrderDetails VALUES
(1, 1, 'Laptop', 1, 1000.00),
(2, 1, 'Mouse', 2, 50.00),
(3, 2, 'Phone', 1, 700.00),
(4, 3, 'Charger', 1, 30.00),
(5, 3, 'Tablet', 1, 400.00),
(6, 3, 'Keyboard', 1, 80.00);

select * from Orders;
select * from OrderDetails;


;with cte as (
select 
	o.OrderID OrderID,
	o.CustomerName CustomerName,
	o.OrderDate OrderDate,
	od.ProductName ProductName,
	od.Quantity Quantity,
	od.UnitPrice UnitPrice,
	row_number() over(partition by o.CustomerName order by od.UnitPrice desc) as rnk
from Orders o
join OrderDetails od
	on o.OrderID = od.OrderID
)select
	OrderID,
	CustomerName,
	OrderDate,
	ProductName,
	Quantity,
	UnitPrice	
from cte
where rnk = 1;

-- =============================================

create table TestMax(
	Year1 int,
	Max1 int,
	Max2 int,
	Max3 int
);

Insert into TestMax
values	(2001, 10, 101, 87),
		(2002, 103, 19, 88),
		(2003, 21, 23, 89),
		(2004, 27, 28, 91);

select year1, 
	iif (max1>max2 and max1>max3, max1,
	iif (max2>max3, max2, max3)) as Maxx
from TestMax

--------------------------------------------

select year1,
		case
			when max1>max2 and max1>max3 then max1
			when max2>max3 then max2
			else max3
		end
from TestMax;

-------------------------------------------

select 
	year1,
	(select
		max(val)
	from (
		values (max1), (max2), (max3)
		) t(val)
	)
from testmax;

---------------------------

select year1, max(max1)
from(
	select year1, Max1 from TestMax
	union all
	select year1, Max2 from TestMax
	union all
	select year1, Max3 from TestMax
) as t
group by year1










