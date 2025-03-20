declare @data varchar(max) = (
	select 
		tb.name td, '',
		i.name td, '',
		i.type td, '',
		CONCAT(
			ty.name,'('+
				CASE
					WHEN CAST(ty.max_length AS VARCHAR) = -1
					THEN 'max'
					WHEN CAST(ty.max_length AS VARCHAR) = 8000
					THEN 'max'
					ELSE CAST(ty.max_length AS VARCHAR)
					END
				+')'
		) td, ''
	from sys.indexes i
	join sys.tables tb
		on i.object_id = tb.object_id
	join sys.columns c
		on i.object_id = c.object_id
	join sys.types ty
		on ty.user_type_id = c.user_type_id
	for xml path('tr')
)	

set @data = '<table>' + @data + '</table>';


EXEC msdb.dbo.sp_send_dbmail
     @profile_name = 'MyDbProfile',
     @recipients = 'zafarabdihafizovich@gmail.com',
     @body = @data,
     @subject = 'Index Metadata',
	 @body_format = 'HTML';