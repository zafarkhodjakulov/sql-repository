drop table if exists #tempcalendar
DECLARE @sana DATE = '2025-03-15';

;WITH cte AS (
    SELECT 
        DATEFROMPARTS(YEAR(@sana), MONTH(@sana), 1) AS All_date,
        1 AS Num,
        DATEPART(WEEKDAY, DATEFROMPARTS(YEAR(@sana), MONTH(@sana), 1)) AS WN
    UNION ALL
    SELECT 
        DATEADD(DAY, 1, All_date),  
        CASE 
            WHEN DATEPART(WEEKDAY, DATEADD(DAY, 1, All_date)) > WN THEN Num
            ELSE Num + 1
        END,
        DATEPART(WEEKDAY, DATEADD(DAY, 1, All_date))
    FROM cte
    WHERE All_date < EOMONTH(@sana)  
)
Select 
	All_date as Dt,
	Num as N,
	WN as wdn
into #TempCalendar
from cte;

SELECT
    MAX(CASE WHEN wdn = 1 THEN DAY(Dt) END) AS Sunday,
    MAX(CASE WHEN wdn = 2 THEN DAY(Dt) END) AS Monday,
    MAX(CASE WHEN wdn = 3 THEN DAY(Dt) END) AS Tuesday,
    MAX(CASE WHEN wdn = 4 THEN DAY(Dt) END) AS Wednesday,
    MAX(CASE WHEN wdn = 5 THEN DAY(Dt) END) AS Thursday,
    MAX(CASE WHEN wdn = 6 THEN DAY(Dt) END) AS Friday,
    MAX(CASE WHEN wdn = 7 THEN DAY(Dt) END) AS Saturday
FROM #TempCalendar
GROUP BY N;



