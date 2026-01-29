SELECT SUM(LineTotal) as TotalSales,
       AVG(LineTotal) as AverageSales,
       MIN(LineTotal) as MinimumSales,
       MAX(LineTotal) as MaximumSales,
       COUNT(*) as NumberOfLineItems
FROM Sales.SalesOrderDetail

-------------------------------------------

SELECT SalesOrderID, SUM(LineTotal) as TotalSales
FROM Sales.SalesOrderDetail
