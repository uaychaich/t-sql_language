DECLARE @data01 INT = 10;
IF @data01 > 5
    PRINT 'Data is greater than 5';
ELSE
    PRINT 'Data is 5 or less';
GO

-------------------------------------

DECLARE @data01 INT = 10;
IF @data01 > 5
    PRINT 'Data is greater than 5';
    PRINT 'Uaychai';
ELSE
    PRINT 'Data is 5 or less';
    PRINT 'Naja';
GO

-------------------------------------

DECLARE @data01 INT = 10;
IF @data01 > 5
BEGIN
    PRINT 'Data is greater than 5';
    PRINT 'Uaychai';
END
ELSE
    PRINT 'Data is 5 or less';
    PRINT 'Naja';
GO

-------------------------------------

DECLARE @data01 INT = 10;
IF @data01 > 5
BEGIN
    PRINT 'Data is greater than 5';
    PRINT 'Uaychai';
END
ELSE
BEGIN
    PRINT 'Data is 5 or less';
    PRINT 'Naja';
END
GO

-------------------------------------

DECLARE @ProductID INT = 1;
IF EXISTS (SELECT * FROM Sales.SalesOrderDetail WHERE ProductID = @ProductID)
    PRINT CAST(@ProductID AS VARCHAR(10)) + ' exists in SalesOrderDetail';
ELSE
    PRINT 'ProductID ' + CAST(@ProductID AS VARCHAR(10)) + ' does not exist in SalesOrderDetail';
GO

-------------------------------------

DECLARE @ProductID INT = 1;
IF @ProductID = SOME(SELECT ProductID FROM Sales.SalesOrderDetail)
    PRINT CAST(@ProductID AS VARCHAR(10)) + ' exists in SalesOrderDetail';
ELSE
    PRINT 'ProductID ' + CAST(@ProductID AS VARCHAR(10)) + ' does not exist in SalesOrderDetail';
GO

-------------------------------------

DECLARE @ExptectedOrderDue NUMERIC(7,2) = 10000;
IF @ExptectedOrderDue >= ALL(SELECT TotalDue FROM Sales.SalesOrderHeader)
    PRINT 'No order''s totaldue that have reach to ' + CAST(@ExptectedOrderDue AS VARCHAR(20));
ELSE
    PRINT 'There are some orders''totaldue that have reach to ' + CAST(@ExptectedOrderDue AS VARCHAR(20));
GO

-------------------------------------

DECLARE @ExptectedOrderDue NUMERIC(9,2) = 150000;
IF @ExptectedOrderDue >= ALL(SELECT TotalDue FROM Sales.SalesOrderHeader)
    PRINT 'No order''s totaldue that have reach to ' + CAST(@ExptectedOrderDue AS VARCHAR(20));
ELSE
BEGIN
    PRINT 'There are some orders''totaldue that have reach to ' + CAST(@ExptectedOrderDue AS VARCHAR(20));
    SELECT * FROM Sales.SalesOrderHeader WHERE TotalDue >= @ExptectedOrderDue;
END
GO

-------------------------------------