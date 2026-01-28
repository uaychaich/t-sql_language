SELECT BusinessEntityID, Title, FirstName, LastName FROM Person.Person;

-----------------

SELECT BusinessEntityID, Title, FirstName, LastName FROM Person.Person
ORDER BY LastName;

-----------------

SELECT BusinessEntityID, Title, FirstName, LastName FROM Person.Person
ORDER BY LastName ASC;

SELECT BusinessEntityID, Title, FirstName, LastName FROM Person.Person
ORDER BY LastName DESC;

-----------------

SELECT BusinessEntityID, Title, FirstName, LastName FROM Person.Person
ORDER BY LastName ASC, FirstName ASC, Title ASC, BusinessEntityID ASC;

-----------------

SELECT Title, FirstName, LastName FROM Person.Person
ORDER BY BusinessEntityID DESC;

-----------------

SELECT BusinessEntityID AS ID, Title, FirstName, LastName FROM Person.Person
ORDER BY ID DESC;

-----------------

SELECT * FROM Sales.SalesOrderHeader;
SELECT * FROM Sales.SalesOrderDetail;
SELECT * FROM Production.Product;

SELECT 
    soh.SalesOrderID,
    soh.OrderDate,
    sod.SalesOrderDetailID,
    sod.ProductID,
    p.Name AS ProductName,
    sod.OrderQty,
    sod.LineTotal 
FROM Sales.SalesOrderHeader AS soh
JOIN Sales.SalesOrderDetail AS sod
ON soh.SalesOrderID = sod.SalesOrderID
JOIN Production.Product AS p
ON sod.ProductID = p.ProductID
ORDER BY soh.OrderDate DESC, soh.SalesOrderID DESC, sod.SalesOrderDetailID ASC;