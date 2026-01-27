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
WHERE soh.SalesOrderID = 43662;