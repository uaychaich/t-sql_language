DECLARE @data01 INT = 0;
WHILE @data01 < 5
BEGIN
    SET @data01 = @data01+1;
    PRINT @data01;
END
GO

------------------------------------------

DECLARE @data01 INT = 0;
WHILE @data01 < 5
BEGIN
    SET @data01 = @data01+1;
    IF @data01 = 2 CONTINUE; 
    IF @data01 = 4 BREAK;
    PRINT @data01;
END
GO

------------------------------------------

