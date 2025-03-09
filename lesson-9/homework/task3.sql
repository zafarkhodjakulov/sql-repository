declare @n int = 10;
;with cte(n, Fibonacci_Number, rnk) as (
	select 1, 1, 1
	union all
	select n + 1, rnk, Fibonacci_Number + rnk
	from cte
	where n < @n
)
select n, Fibonacci_Number from cte;