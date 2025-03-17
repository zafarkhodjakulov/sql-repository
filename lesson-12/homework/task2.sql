
CREATE PROCEDURE GetStoredProceduresAndFunctions
    @DatabaseName SYSNAME = NULL  -- Optional: specific database yoki NULL (hamma DB)
AS
BEGIN

    DECLARE @SQL NVARCHAR(MAX) = N'';
    DECLARE @DbName SYSNAME;

    IF @DatabaseName IS NOT NULL
    BEGIN
        SET @SQL = N'
        USE ' + @DatabaseName + ';
        SELECT 
            DB_NAME() AS DatabaseName,
            ROUTINES.SPECIFIC_SCHEMA AS SchemaName,
            ROUTINES.ROUTINE_NAME AS RoutineName,
            ROUTINES.ROUTINE_TYPE AS RoutineType,
            PARAMETERS.PARAMETER_NAME AS ParameterName,
            PARAMETERS.DATA_TYPE AS DataType,
            PARAMETERS.CHARACTER_MAXIMUM_LENGTH AS MaxLength
        FROM ' + @DatabaseName + '.INFORMATION_SCHEMA.ROUTINES ROUTINES
        LEFT JOIN ' + @DatabaseName + '.INFORMATION_SCHEMA.PARAMETERS PARAMETERS
            ON ROUTINES.SPECIFIC_NAME = PARAMETERS.SPECIFIC_NAME
        ORDER BY ROUTINES.SPECIFIC_SCHEMA, ROUTINES.ROUTINE_NAME;
        ';

        EXEC sp_executesql @SQL;
    END
    ELSE
    BEGIN
        DECLARE @DbList NVARCHAR(MAX) = N'';

        SELECT @DbList = @DbList + N'
        USE ' + name + ';
        SELECT 
            DB_NAME() AS DatabaseName,
            ROUTINES.SPECIFIC_SCHEMA AS SchemaName,
            ROUTINES.ROUTINE_NAME AS RoutineName,
            ROUTINES.ROUTINE_TYPE AS RoutineType,
            PARAMETERS.PARAMETER_NAME AS ParameterName,
            PARAMETERS.DATA_TYPE AS DataType,
            PARAMETERS.CHARACTER_MAXIMUM_LENGTH AS MaxLength
        FROM ' + name + '.INFORMATION_SCHEMA.ROUTINES ROUTINES
        LEFT JOIN ' + name + '.INFORMATION_SCHEMA.PARAMETERS PARAMETERS
            ON ROUTINES.SPECIFIC_NAME = PARAMETERS.SPECIFIC_NAME
        ORDER BY ROUTINES.SPECIFIC_SCHEMA, ROUTINES.ROUTINE_NAME;
        '
        FROM sys.databases
        WHERE state_desc = 'ONLINE';

        EXEC sp_executesql @DbList;
    END
END;

exec GetStoredProceduresAndFunctions