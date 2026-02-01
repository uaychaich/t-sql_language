DECLARE @countrows TINYINT 
SELECT @countrows = COUNT(*) FROM Production.Product;
SELECT @countrows
GO

-------------------------------------

DECLARE @countrows TINYINT 
BEGIN TRY
    SELECT @countrows = COUNT(*) FROM Production.Product;
    SELECT @countrows;
END TRY
BEGIN CATCH
    SELECT ERROR_LINE() AS ErrorLine, ERROR_MESSAGE() AS ErrorMessage, 
           ERROR_NUMBER() AS ErrorNumber, ERROR_PROCEDURE() AS ErrorProc, 
           ERROR_SEVERITY() AS ErrorSeverity, ERROR_STATE() AS ErrorState;
    IF ERROR_NUMBER() = 220 PRINT 'Your variable cannot receive the value.';
    ELSE PRINT 'Something went wrong.';
END CATCH
GO

-------------------------------------

DECLARE @Territory INT = 20;
SELECT * FROM Sales.SalesOrderHeader WHERE TerritoryID=@Territory;
GO

-------------------------------------

DECLARE @Territory INT = 20;
IF @Territory >=1 AND @Territory <=10
    SELECT * FROM Sales.SalesOrderHeader WHERE TerritoryID=@Territory;
ELSE
    THROW 50001, 'Territory can be between 1 and 10', 0;
GO

-------------------------------------