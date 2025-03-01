CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT FOREIGN KEY REFERENCES Orders(OrderID),
    ProductID INT,
    Quantity INT,
    Price DECIMAL(10,2)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50)
);

INSERT INTO Customers (CustomerID, CustomerName) VALUES
(1, 'Alice Johnson'),
(2, 'Bob Smith'),
(3, 'Charlie Brown'),
(4, 'David Williams'),
(5, 'Eva Adams');

INSERT INTO Orders (OrderID, CustomerID, OrderDate) VALUES
(101, 1, '2024-01-15'),
(102, 2, '2024-01-18'),
(103, 3, '2024-01-20'),
(104, 1, '2024-02-01'),
(105, 4, '2024-02-05');

INSERT INTO Products (ProductID, ProductName, Category) VALUES
(1001, 'Laptop', 'Electronics'),
(1002, 'Smartphone', 'Electronics'),
(1003, 'Office Chair', 'Furniture'),
(1004, 'Desk Lamp', 'Furniture'),
(1005, 'Coffee Maker', 'Appliances');

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity, Price) VALUES
(1, 101, 1001, 1, 1200.00),
(2, 101, 1002, 2, 800.00),
(3, 102, 1003, 1, 150.00),
(4, 103, 1004, 3, 50.00),
(5, 104, 1005, 1, 99.99),
(6, 105, 1002, 1, 400.00),
(7, 105, 1003, 2, 150.00);

-- task1
select 
	c.CustomerID,
	c.CustomerName,
	o.OrderID,
	o.OrderDate
from Customers c
left join Orders o
	on c.CustomerID = o.CustomerID;

-- task2
select
	*
from Customers c
left join Orders o
	on c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL;

-- task3
select
	o.OrderID,
	o.OrderDate,
	p.ProductName,
	od.Quantity
from Orders o
join OrderDetails od
	on o.OrderID = od.OrderID
join Products p
	on od.ProductID = p.ProductID

-- task4
SELECT 
    c.CustomerID, 
    c.CustomerName, 
    COUNT(o.OrderID) AS OrderCount
FROM Customers c
JOIN Orders o 
    ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.CustomerName
HAVING COUNT(o.OrderID) > 1;

-- task5
SELECT OrderID, ProductName, Price
FROM (
    SELECT 
        od.OrderID, 
        p.ProductName, 
        od.Price,
        RANK() OVER(PARTITION BY od.OrderID ORDER BY od.Price DESC) AS rnk
    FROM OrderDetails od
    JOIN Products p 
        ON od.ProductID = p.ProductID
) ranked
WHERE rnk = 1;

-- task6
select * from(
	select
		o.OrderID,
		c.CustomerName,
		o.orderDate,
		RANK() over (partition by c.CustomerName order by o.orderdate desc) last_date
	from Customers c
	join Orders o
		on c.CustomerID = o.CustomerID
	) t
where last_date = 1

-- task7
select distinct
	c.CustomerID,
	c.CustomerName,
	p.ProductName
from Customers c
join Orders o
	on c.CustomerID = o.CustomerID
join OrderDetails od
	on od.OrderID = o.OrderID
join Products p
	on p.ProductID = od.ProductID
where p.Category = 'Electronics';

-- task8
select
	c.CustomerID,
	c.CustomerName,
	p.ProductName
from Customers c
join Orders o
	on c.CustomerID = o.CustomerID
join OrderDetails od
	on od.OrderID = o.OrderID
join Products p
	on p.ProductID = od.ProductID
where p.Category = 'Stationery'

-- task9
select distinct
	c.CustomerID,
	CustomerName,
	sum(od.Price * od.Quantity) as TotalSpent
from Customers c
join Orders o
	on c.CustomerID = o.CustomerID
join OrderDetails od
	on o.OrderID = od.OrderID
group by c.CustomerID, c.CustomerName
order by c.CustomerID;

