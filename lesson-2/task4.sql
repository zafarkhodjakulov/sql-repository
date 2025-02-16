CREATE TABLE Photos (
	id int,
	photo varbinary(max)
);

INSERT INTO Photos
SELECT 1, * FROM openrowset (
	BULK 'D:\bai and ai\sql-repository\lesson-2\shazi.jpg', single_blob) as img
union
SELECT 2, * FROM OPENROWSET (
	BULK 'D:\bai and ai\sql-repository\lesson-2\elina.jpg', single_blob) as img;

