declare @n int = 10;

;with cte(Num, Factorial) as (
	select 1, 1
	union all
	select Num + 1, ((Num + 1) *Factorial)
	from cte
	where Num < @n
)
select * from cte;