CREATE VIEW uay.SalesOrderHeaderDetail
AS
    SELECT h.SalesOrderID, h.OrderDate, d.SalesOrderDetailID, d.ProductID, d.OrderQty, d.UnitPrice, d.LineTotal
    FROM Sales.SalesOrderHeader h JOIN Sales.SalesOrderDetail d
    ON h.SalesOrderID = d.SalesOrderID ;
GO

-----------------------------------------

CREATE PROCEDURE uay.SearchProduct @ProductID INT 
AS
    IF EXISTS(SELECT * FROM Production.Product WHERE ProductID =@ProductID)
        SELECT * FROM Production.Product WHERE ProductID =@ProductID;
    ELSE
        THROW 50001, 'Your product id does not exist.',0;
GO

-----------------------------------------

CREATE FUNCTION uay.Age(@input DATETIME) RETURNS INT 
AS 
BEGIN
    RETURN YEAR(GETDATE()) - YEAR(@input);
END
GO
-----------------------------------------

SELECT * FROM uay.SalesOrderHeaderDetail WHERE YEAR(OrderDate) = 2023 ORDER BY SalesOrderID

EXEC uay.SearchProduct 777

SELECT SalesOrderID, OrderDate, uay.Age(OrderDate) AS Age FROM Sales.SalesOrderHeader

-----------------------------------------

DROP VIEW uay.SalesOrderHeaderDetail;
DROP PROCEDURE uay.SearchProduct;
DROP FUNCTION uay.Age;

-----------------------------------------