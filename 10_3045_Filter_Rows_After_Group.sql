SELECT * FROM Sales.SalesOrderHeader

-----------------------------------

SELECT YEAR(OrderDate) AS YearOrderDate, SUM(TotalDue) AS SumTotalDue
FROM Sales.SalesOrderHeader
WHERE TerritoryID = 5
GROUP BY YEAR(OrderDate)
ORDER BY YEAR(OrderDate);

-----------------------------------

SELECT YEAR(OrderDate) AS YearOrderDate, SUM(TotalDue) AS SumTotalDue
FROM Sales.SalesOrderHeader
WHERE SUM(TotalDue) > 3000000
GROUP BY YEAR(OrderDate)
ORDER BY YEAR(OrderDate);

-----------------------------------

SELECT YEAR(OrderDate) AS YearOrderDate, SUM(TotalDue) AS SumTotalDue
FROM Sales.SalesOrderHeader
GROUP BY YEAR(OrderDate)
HAVING SUM(TotalDue) > 3000000
ORDER BY YEAR(OrderDate);

-----------------------------------

SELECT YEAR(OrderDate) AS YearOrderDate, SUM(TotalDue) AS SumTotalDue
FROM Sales.SalesOrderHeader
GROUP BY YEAR(OrderDate)
HAVING TerritoryID = 5
ORDER BY YEAR(OrderDate);