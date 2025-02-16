Create Table Test_identity (
	id int primary key identity(1,1),
	name varchar(50),
	age int
);

INSERT INTO Test_identity
VALUES	('Tom', 12),
		('Alisa', 19),
		('Shox', 14),
		('Munir', 21),
		('Komila', 17);

DELETE FROM Test_identity;

TRUNCATE TABLE Test_identity;

DROP TABLE Test_identity;

SELECT * FROM Test_identity;