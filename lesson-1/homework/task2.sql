CREATE TABLE Product
(
	product_id int unique,
	product_name varchar(50),
	price decimal
);

Alter table product
Drop CONSTRAINT UQ__Product__47027DF46B68F901 unique(product_id);

Alter Table product
add unique(product_id);

Alter Table product
add unique(product_id, product_name);
