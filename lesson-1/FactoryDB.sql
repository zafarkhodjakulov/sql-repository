CREATE DATABASE Factory;

USE Factory;

CREATE TABLE Suppliers (
	SupplierID INT primary key,
	SupplierName VARCHAR(255),
	ContactName VARCHAR(255),
	Address VARCHAR(255),
	City VARCHAR(255),
	PostalCode VARCHAR(255),
	Country VARCHAR(255),
	Phone VARCHAR(255)
);

CREATE TABLE Categories (
	CategoryID INT primary key,
	CategoryName VARCHAR(255),
	Description VARCHAR(255)
);

CREATE TABLE Employees (
	EmployeeID INT PRIMARY KEY,
	LastName VARCHAR(255),
	FirstName VARCHAR(255),
	BirthDate DATE,
	Photo VARCHAR(255),
	Notes TEXT
);

CREATE TABLE Shippers (
	ShipperID INT PRIMARY KEY,
	ShipperName VARCHAR(255),
	Phone VARCHAR(255)
);

CREATE TABLE Customers (
	CustomerID INT PRIMARY KEY,
	CustomerName VARCHAR(255),
	ContactName VARCHAR(255),
	Address VARCHAR(255),
	City VARCHAR(255),
	PostalCode VARCHAR(255),
	Country VARCHAR(255)
);


CREATE TABLE Products (
	ProductID INT PRIMARY KEY,
	ProductName VARCHAR(255),
	SupplierID INT FOREIGN KEY REFERENCES Suppliers(SupplierID),
	CategoryID INT FOREIGN KEY REFERENCES Categories(CategoryID),
	Unit VARCHAR(255),
	Price DOUBLE PRECISION
);

CREATE TABLE Orders (
	OrderID INT PRIMARY KEY,
	CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID),
	EpmolyeeID INT FOREIGN KEY REFERENCES Employees(EmployeeID),
	OrderDate DATE,
	ShipperID INT FOREIGN KEY REFERENCES Shippers(ShipperID)
);

CREATE TABLE OrderDetails (
	OrderDetailID INT PRIMARY KEY,
	OrderID INT FOREIGN KEY REFERENCES Orders(OrderID),
	ProductID INT FOREIGN KEY REFERENCES Products(ProductID),
	Quantity INT
);