SELECT BusinessEntityID, PersonType, Title, FirstName, LastName FROM Person.Person;

-----------------

SELECT LastName FROM Person.Person;

-----------------

SELECT DISTINCT LastName FROM Person.Person;

-----------------

SELECT DISTINCT FirstName, LastName FROM Person.Person;

-----------------

SELECT TOP 10 BusinessEntityID, PersonType, Title, FirstName, LastName FROM Person.Person;

-----------------

SELECT TOP 10 PERCENT BusinessEntityID, PersonType, Title, FirstName, LastName FROM Person.Person;

-----------------

SELECT TOP 10 SalesOrderID, OrderDate, TotalDue FROM Sales.SalesOrderHeader ORDER BY TotalDue ASC;

-----------------

SELECT TOP 10 WITH TIES SalesOrderID, OrderDate, TotalDue FROM Sales.SalesOrderHeader ORDER BY TotalDue ASC;

-----------------

SELECT SalesOrderID, OrderDate, TotalDue FROM Sales.SalesOrderHeader ORDER BY TotalDue DESC;

SELECT SalesOrderID, OrderDate, TotalDue FROM Sales.SalesOrderHeader ORDER BY TotalDue DESC OFFSET 5 ROWS FETCH NEXT 5 ROWS ONLY;

-----------------

SELECT BusinessEntityID, PersonType, Title, FirstName, LastName FROM Person.Person
WHERE LastName = 'Smith';

-----------------

SELECT BusinessEntityID, PersonType, Title, FirstName, LastName FROM Person.Person
WHERE LastName <> 'Smith';

-----------------

SELECT BusinessEntityID, PersonType, Title, FirstName, LastName FROM Person.Person
WHERE LastName != 'Smith';

-----------------

SELECT BusinessEntityID, PersonType, Title, FirstName, LastName FROM Person.Person
WHERE BusinessEntityID <= 3;

-----------------

SELECT BusinessEntityID, PersonType, Title, FirstName, LastName FROM Person.Person
WHERE FirstName >= 'K';

-----------------

SELECT BusinessEntityID, PersonType, Title, FirstName, LastName FROM Person.Person
WHERE FirstName LIKE 'K%';

-----------------

SELECT BusinessEntityID, PersonType, Title, FirstName, LastName FROM Person.Person
WHERE FirstName LIKE '___';

-----------------

SELECT BusinessEntityID, PersonType, Title, FirstName, LastName FROM Person.Person
WHERE FirstName LIKE '[ab]%';

-----------------

SELECT BusinessEntityID, PersonType, Title, FirstName, LastName FROM Person.Person
WHERE FirstName LIKE '[^ab]%';

-----------------

SELECT BusinessEntityID, PersonType, Title, FirstName, LastName FROM Person.Person
WHERE BusinessEntityID >=3 AND BusinessEntityID <=7;

-----------------

SELECT BusinessEntityID, PersonType, Title, FirstName, LastName FROM Person.Person
WHERE BusinessEntityID >=3 OR BusinessEntityID <=7;

-----------------

SELECT BusinessEntityID, PersonType, Title, FirstName, LastName FROM Person.Person
WHERE BusinessEntityID BETWEEN 3 AND 7;

SELECT BusinessEntityID, PersonType, Title, FirstName, LastName FROM Person.Person
WHERE BusinessEntityID >=3 AND BusinessEntityID <=7;

-----------------

SELECT BusinessEntityID, PersonType, Title, FirstName, LastName FROM Person.Person
WHERE BusinessEntityID IN (1, 3, 5);

SELECT BusinessEntityID, PersonType, Title, FirstName, LastName FROM Person.Person
WHERE BusinessEntityID =1 OR BusinessEntityID =3 OR BusinessEntityID =7;

-----------------

SELECT BusinessEntityID, PersonType, Title, FirstName, LastName FROM Person.Person
WHERE NOT BusinessEntityID IN (1, 3, 5);

SELECT BusinessEntityID, PersonType, Title, FirstName, LastName FROM Person.Person
WHERE NOT FirstName LIKE '___';

-----------------

SELECT BusinessEntityID, PersonType, Title, FirstName, LastName FROM Person.Person
WHERE Title IS NULL;

SELECT BusinessEntityID, PersonType, Title, FirstName, LastName FROM Person.Person
WHERE Title IS NOT NULL;

-----------------

SELECT Title, FirstName, LastName FROM Person.Person
WHERE BusinessEntityID = 5;

-----------------

SELECT Title, FirstName, LastName, FirstName + ' ' + LastName AS FullName FROM Person.Person
WHERE FullName = 'Dylan Miller';

SELECT Title, FirstName, LastName, FirstName + ' ' + LastName AS FullName FROM Person.Person
WHERE FirstName + ' ' + LastName = 'Dylan Miller';

-----------------

SELECT Title, FirstName, LastName FROM Person.Person
WHERE FirstName LIKE '%d%'

SELECT Title, FirstName, LastName FROM Person.Person
WHERE FirstName LIKE '%d%' COLLATE SQL_Latin1_General_CP1_CI_AS;

SELECT Title, FirstName, LastName FROM Person.Person
WHERE FirstName LIKE '%d%' COLLATE SQL_Latin1_General_CP1_CS_AS;

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
WHERE soh.SalesOrderID = 43662
ORDER BY p.ProductID ASC;

-----------------