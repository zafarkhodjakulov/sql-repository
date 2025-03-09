declare @n int = 10;
;with cte(n, Fibonacci_Number, rnk) as (
	select 1, 1, 0
	union all
	select n + 1, (Fibonacci_Number) + rnk, Fibonacci_Number
	from cte
	where n < @n
)
select n, Fibonacci_Number from cte;