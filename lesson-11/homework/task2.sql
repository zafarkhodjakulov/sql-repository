drop table if exists Orders_DB1;
create table Orders_DB1 (
	OrderID int, 
	CustomerName varchar(50),
	Product Varchar(50),
	Quantity int
);
drop table if exists Orders_DB2;
create table Orders_DB2 (
	OrderID int, 
	CustomerName varchar(50),
	Product Varchar(50),
	Quantity int
);

insert into Orders_DB1
values	(101, 'Alice', 'Laptop', 1),
		(102, 'Bob', 'Phone', 2),
		(103, 'Charlie', 'Tablet', 1),
		(104, 'David', 'Monitor', 1);

insert into Orders_DB2
values	(101, 'Alice', 'Laptop', 1),
		(103, 'Charlie', 'Tablet', 1);

declare @MissingOrders table (
	OrderID int, 
	CustomerName varchar(50),
	Product Varchar(50),
	Quantity int
);
insert into @MissingOrders
select o1.*
from Orders_DB1 o1
left join Orders_DB2 o2
	on o1.OrderID = o2.OrderID
where o2.OrderID is null;

select * from @MissingOrders;

----select 
----	t.OrderID, t.CustomerName, t.Product, t.Quantity
----from (
----	select distinct
----		o1.*,
----		count(o1.orderid) over(partition by o1.orderid) as cnt
----	from Orders_DB1 o1
----	join Orders_DB2 o2
----		on o1.OrderID <> o2.OrderID
----	) t
----where cnt = 2;




