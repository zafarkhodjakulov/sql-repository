create table #temp(
	DatabaseName varchar(max),
	SchemaName varchar(max),
	TableName varchar(max),
	ColumnName varchar(max),
	DataType varchar(max)
);

declare @name varchar(255);
declare @i int = 1;
declare @count int;
select @count = count(1)
from sys.databases where name not in ('master', 'tempdb', 'model', 'msdb')

while @i < @count
begin
	;with cte as (
		select name, ROW_NUMBER() OVER(order BY name) as rn
		from sys.databases where name not in ('master', 'tempdb', 'model', 'msdb')
	)
	select @name=name from cte
	where rn = @i;
	set @i = @i + 1;

	declare @DataName varchar(max) = 
	'select 
		TABLE_CATALOG DatabaseName,
		TABLE_SCHEMA SchemaName,
		TABLE_NAME TableName,
		COLUMN_NAME ColumnName,
		CONCAT(
			DATA_TYPE,''(''+
				CASE
					WHEN CAST(CHARACTER_MAXIMUM_LENGTH AS VARCHAR) = -1
					THEN ''MAX''
					ELSE CAST(CHARACTER_MAXIMUM_LENGTH AS VARCHAR)
					END
				+'')''
		) DataType
	from ' + @name + '.INFORMATION_SCHEMA.COLUMNS'

	insert into #temp
	exec(@dataname)
end

select * from #temp;