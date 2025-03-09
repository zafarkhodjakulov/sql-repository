declare @n int = 10;

;with cte(Num, Factorial) as (
	select 1, 1
	union all
	select Num + 1, (Num * (Factorial + 1))
	from cte
	where Num < @n
)
select * from cte;