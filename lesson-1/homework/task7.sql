create table invoice (
	invoice_id int primary key identity,
	amount decimal
);

insert into invoice(amount)
values  (1), 
		(2),
		(4),
		(15),
		(9);

SET IDENTITY_INSERT invoice ON;
insert into invoice(invoice_id, amount)
values (100, 13);

SET IDENTITY_INSERT invoice OFF;
