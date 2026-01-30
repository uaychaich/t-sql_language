SELECT SalesOrderID, OrderDate, SalesPersonID, TotalDue FROM Sales.SalesOrderHeader AS soh;

SELECT * FROM dbo.ufnGetContactInformation(280) AS ci;

-------------------------------

SELECT soh.SalesOrderID, soh.OrderDate, soh.SalesPersonID, 
       ci.FirstName, ci.LastName, ci.JobTitle,
       soh.TotalDue
FROM Sales.SalesOrderHeader AS soh CROSS APPLY dbo.ufnGetContactInformation(soh.SalesPersonID) AS ci;

-------------------------------

SELECT soh.SalesOrderID, soh.OrderDate, soh.SalesPersonID, 
       ci.FirstName, ci.LastName, ci.JobTitle,
       soh.TotalDue
FROM Sales.SalesOrderHeader AS soh OUTER APPLY dbo.ufnGetContactInformation(soh.SalesPersonID) AS ci;

-------------------------------