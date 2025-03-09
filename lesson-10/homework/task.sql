drop table if exists Shipments;
CREATE TABLE Shipments (
    n INT PRIMARY KEY,
    Num INT
);

insert into Shipments 
values	(1, 1), (2, 1), (3, 1), (4, 1), (5, 1), (6, 1), (7, 1), (8, 1), (9, 2), 
		(10, 2), (11, 2), (12, 2), (13, 2), (14, 4), (15, 4), (16, 4), (17, 4), 
		(18, 4), (19, 4), (20, 4), (21, 4), (22, 4), (23, 4), (24, 4), (25, 4), 
		(26, 5), (27, 5), (28, 5), (29, 5), (30, 5), (31, 5), (32, 6), (33, 7);

select * from Shipments;


WITH AllDays AS (
    SELECT 0 AS Num FROM generate_series(1, 7) 
    UNION ALL
    SELECT Num FROM Shipments
),
OrderedData AS (
    SELECT Num, ROW_NUMBER() OVER (ORDER BY Num) AS row_num
    FROM AllDays
)
SELECT AVG(Num) AS Median
FROM OrderedData
WHERE row_num IN (20, 21); 

