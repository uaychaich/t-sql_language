SELECT YEAR(OrderDate)
FROM Sales.SalesOrderHeader;

----------------------------------

SELECT YEAR(OrderDate)
FROM Sales.SalesOrderHeader 
GROUP BY YEAR(OrderDate);

----------------------------------

SELECT DISTINCT YEAR(OrderDate)
FROM Sales.SalesOrderHeader;

----------------------------------

SELECT YEAR(OrderDate), SUM(TotalDue) AS SumTotalDue
FROM Sales.SalesOrderHeader 
GROUP BY YEAR(OrderDate);

----------------------------------

SELECT DISTINCT YEAR(OrderDate), SUM(TotalDue) AS SumTotalDue
FROM Sales.SalesOrderHeader;

----------------------------------

SELECT YEAR(OrderDate) AS YearOrderDate, MONTH(OrderDate) AS MonthOrderDate, SUM(TotalDue) AS SumTotalDue
FROM Sales.SalesOrderHeader 
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
ORDER BY YEAR(OrderDate), MONTH(OrderDate);

SELECT YEAR(OrderDate) AS YearOrderDate, SUM(TotalDue) AS SumTotalDue
FROM Sales.SalesOrderHeader 
GROUP BY YEAR(OrderDate)
ORDER BY YEAR(OrderDate);

SELECT SUM(TotalDue) AS SumTotalDue
FROM Sales.SalesOrderHeader;

----------------------------------

SELECT YEAR(OrderDate) AS YearOrderDate, MONTH(OrderDate) AS MonthOrderDate, SUM(TotalDue) AS SumTotalDue
FROM Sales.SalesOrderHeader 
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
ORDER BY YEAR(OrderDate), MONTH(OrderDate);

SELECT YEAR(OrderDate) AS YearOrderDate, NULL ,SUM(TotalDue) AS SumTotalDue
FROM Sales.SalesOrderHeader 
GROUP BY YEAR(OrderDate)
ORDER BY YEAR(OrderDate);

SELECT NULL, NULL, SUM(TotalDue) AS SumTotalDue
FROM Sales.SalesOrderHeader;

----------------------------------

SELECT YEAR(OrderDate) AS YearOrderDate, MONTH(OrderDate) AS MonthOrderDate, SUM(TotalDue) AS SumTotalDue
FROM Sales.SalesOrderHeader 
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
UNION 
SELECT YEAR(OrderDate) AS YearOrderDate, NULL ,SUM(TotalDue) AS SumTotalDue
FROM Sales.SalesOrderHeader 
GROUP BY YEAR(OrderDate)
UNION
SELECT NULL, NULL, SUM(TotalDue) AS SumTotalDue
FROM Sales.SalesOrderHeader
ORDER BY YearOrderDate, MonthOrderDate;

----------------------------------

SELECT YEAR(OrderDate) AS YearOrderDate, MONTH(OrderDate) AS MonthOrderDate, SUM(TotalDue) AS SumTotalDue
FROM Sales.SalesOrderHeader 
GROUP BY GROUPING SETS ((YEAR(OrderDate), MONTH(OrderDate)), (YEAR(OrderDate)), ())
ORDER BY YearOrderDate, MonthOrderDate;

----------------------------------

SELECT YEAR(OrderDate) AS YearOrderDate, MONTH(OrderDate) AS MonthOrderDate, SUM(TotalDue) AS SumTotalDue
FROM Sales.SalesOrderHeader 
GROUP BY GROUPING SETS ((YEAR(OrderDate), MONTH(OrderDate)), (YEAR(OrderDate)), (MONTH(OrderDate)), ())
ORDER BY YearOrderDate, MonthOrderDate;

----------------------------------

SELECT YEAR(OrderDate) AS YearOrderDate, MONTH(OrderDate) AS MonthOrderDate, SUM(TotalDue) AS SumTotalDue
FROM Sales.SalesOrderHeader 
GROUP BY ROLLUP (YEAR(OrderDate), MONTH(OrderDate))
ORDER BY YearOrderDate, MonthOrderDate;

SELECT YEAR(OrderDate) AS YearOrderDate, MONTH(OrderDate) AS MonthOrderDate, SUM(TotalDue) AS SumTotalDue
FROM Sales.SalesOrderHeader 
GROUP BY CUBE (YEAR(OrderDate), MONTH(OrderDate))
ORDER BY YearOrderDate, MonthOrderDate;

----------------------------------

SELECT SalesOrderID, YEAR(OrderDate) AS YearOrderDate, SalesPersonID, TotalDue
FROM Sales.SalesOrderHeader
ORDER BY SalesOrderID,YEAR(OrderDate);

----------------------------------

SELECT YEAR(OrderDate) AS YearOrderDate, SalesPersonID, SUM(TotalDue) AS SumTotalDue
FROM Sales.SalesOrderHeader
GROUP BY GROUPING SETS ((YEAR(OrderDate), SalesPersonID), (YEAR(OrderDate)), ())
ORDER BY YEAR(OrderDate), SalesPersonID;

----------------------------------

SELECT YEAR(OrderDate) AS YearOrderDate, SalesPersonID,GROUPING_ID(SalesPersonID) , SUM(TotalDue) AS SumTotalDue
FROM Sales.SalesOrderHeader
GROUP BY GROUPING SETS ((YEAR(OrderDate), SalesPersonID), (YEAR(OrderDate)), ())
ORDER BY YEAR(OrderDate), SalesPersonID;

----------------------------------

