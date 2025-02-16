CREATE TABLE data_types_demo (
	tint tinyint,
	sint smallint,
	number int,
	bint bigint,
	demic decimal(10, 2),
	but_son float,
	charac char(10),
	ncharac nchar(10),
	varkar varchar(20),
	nvarkar nvarchar(20),
	txt TEXT,
	sana Date,
	vaqt time,
	sanavaqt datetime,
	guide uniqueidentifier
);

INSERT INTO data_types_demo
VALUES (200, 100, 2000, 10025265, 10.26, 14.12665, 'huwegd723',
		'as2783239', 'kjebfuwebf', 'sjdhbu38h3', 'vfbiek', '2024-03-30', '10:22',
		GETDATE(), NEWID());

SELECT * FROM data_types_demo;