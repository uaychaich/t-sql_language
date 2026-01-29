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

