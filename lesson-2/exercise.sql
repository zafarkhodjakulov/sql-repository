-- TINYINT
CREATE TABLE Numbers (
	ID TINYINT
);

INSERT INTO Numbers
VALUES (255);
-- 0 to 255

INSERT INTO Numbers
VALUES (-102);
-- Arithmetic overflow error for data type tinyint, value = 256.

SELECT * FROM Numbers;


-- SMALLINT
DROP TABLE IF EXISTS Numbers;
CREATE TABLE Numbers (
	ID INT
);

INSERT INTO Numbers
VALUES (-2147483648);

INSERT INTO Numbers
VALUES (32767);
-- -32,768 to 32,767

SELECT * FROM Numbers;

-- INT
-- 2,147,483,647 --- 2^32 INT

-- 8,388,607  --- 2^24 MediumINT

-- 32,767 --- 2^16 SmallINT

-- 255 --- 2^8 TinyINT