CREATE TABLE TestMax
(
    Year1 INT
    ,Max1 INT
    ,Max2 INT
    ,Max3 INT
);
GO
 
INSERT INTO TestMax 
VALUES
    (2001,10,101,87)
    ,(2002,103,19,88)
    ,(2003,21,23,89)
    ,(2004,27,28,91);

SELECT Year1, MAX(MaxValue) AS MaxValue
FROM 
(
    SELECT Year1, Max1, Max2, Max3 FROM TestMax
) t
UNPIVOT 
(
    MaxValue FOR MaxColumn IN (Max1, Max2, Max3)
) AS unpvt
GROUP BY Year1;