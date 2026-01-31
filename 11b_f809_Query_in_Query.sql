SELECT SalesOrderID, YEAR(OrderDate) AS YearOrderDate, TotalDue
FROM Sales.SalesOrderHeader AS SOH;

SELECT AVG(TotalDue) AS AvgTotalDue FROM Sales.SalesOrderHeader AS SOH

-----------------------------------------

SELECT SalesOrderID, YEAR(OrderDate) AS YearOrderDate, TotalDue, 
       (SELECT AVG(TotalDue) FROM Sales.SalesOrderHeader AS SOH2) AS AvgTotalDue
FROM Sales.SalesOrderHeader AS SOH;

-----------------------------------------

SELECT SalesOrderID, YEAR(OrderDate) AS YearOrderDate, TotalDue, 
       (SELECT AVG(TotalDue) FROM Sales.SalesOrderHeader AS SOH2 WHERE YEAR(OrderDate)=YEAR(SOH.OrderDate)) AS AvgTotalDue
FROM Sales.SalesOrderHeader AS SOH;

-----------------------------------------

SELECT SalesOrderID, YEAR(OrderDate) AS YearOrderDate, TotalDue, 
       (SELECT AVG(TotalDue) FROM Sales.SalesOrderHeader AS SOH2 WHERE YEAR(OrderDate)=YEAR(SOH.OrderDate)) AS AvgTotalDue
FROM Sales.SalesOrderHeader AS SOH
WHERE TotalDue > (SELECT AVG(TotalDue) FROM Sales.SalesOrderHeader AS SOH3 WHERE YEAR(OrderDate)=YEAR(SOH.OrderDate));

-----------------------------------------

SELECT RANK() OVER (ORDER BY SUM(LineTotal) DESC) AS RANK, ProductID, SUM(LineTotal) AS SumLineTotal
FROM Sales.SalesOrderDetail AS SOD
GROUP BY ProductID
HAVING RANK() OVER (ORDER BY SUM(LineTotal) DESC) IN (5,20,35);

-----------------------------------------

SELECT *
FROM (
       SELECT RANK() OVER (ORDER BY SUM(LineTotal) DESC) AS RANK, ProductID, SUM(LineTotal) AS SumLineTotal
       FROM Sales.SalesOrderDetail AS SOD
       GROUP BY ProductID) AS RankedProducts
WHERE RANK IN (5,20,35);

-----------------------------------------

SELECT * FROM Production.Product p
WHERE NOT EXISTS(SELECT * FROM Sales.SalesOrderDetail sod WHERE sod.ProductID = p.ProductID)

-----------------------------------------

SELECT SalesOrderID, YEAR(OrderDate) AS YearOrderDate, TotalDue, 
       (SELECT AVG(TotalDue) FROM Sales.SalesOrderHeader AS SOH2 ORDER BY AVG(TotalDue)) AS AvgTotalDue
FROM Sales.SalesOrderHeader AS SOH;

SELECT *
FROM (
       SELECT RANK() OVER (ORDER BY SUM(LineTotal) DESC) AS RANK, ProductID, SUM(LineTotal) AS SumLineTotal
       FROM Sales.SalesOrderDetail AS SOD
       GROUP BY ProductID ORDER BY RANK) AS RankedProducts
WHERE RANK IN (5,20,35);

-----------------------------------------

WITH RankedProducts AS (
       SELECT RANK() OVER (ORDER BY SUM(LineTotal) DESC) AS RANK, ProductID, SUM(LineTotal) AS SumLineTotal
       FROM Sales.SalesOrderDetail AS SOD
       GROUP BY ProductID)
SELECT *
FROM RankedProducts
WHERE RANK IN (5,20,35);

-----------------------------------------

SELECT * FROM uay.Employees;

-----------------------------------------

WITH EmployeeCTE AS (
       SELECT EmployeeID, Name, ManagerID, 1 AS Level, CAST(NULL AS VARCHAR(100)) AS ManagerName FROM uay.Employees WHERE ManagerID IS NULL
       UNION ALL
       SELECT E.EmployeeID, E.Name, E.ManagerID, EC.Level + 1 AS Level, EC.Name AS ManagerName
       FROM uay.Employees E
       JOIN EmployeeCTE EC ON E.ManagerID = EC.EmployeeID
)
SELECT * FROM EmployeeCTE ORDER BY Level, ManagerName, Name;

-----------------------------------------

SELECT * FROM Sales.vSalesPerson;

SELECT * FROM dbo.ufnGetContactInformation(280);

-----------------------------------------