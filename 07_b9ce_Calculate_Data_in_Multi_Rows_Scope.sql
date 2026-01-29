SELECT SalesOrderID, ProductID, LineTotal
FROM Sales.SalesOrderDetail;

------------------------------------------

SELECT SalesOrderID, ProductID, LineTotal,
       SUM(LineTotal) OVER (PARTITION BY SalesOrderID ORDER BY ProductID ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS CuumulativeLineTotal,
       SUM(LineTotal) OVER (PARTITION BY SalesOrderID ORDER BY ProductID ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS TotalLineTotal,
       SUM(LineTotal) OVER (PARTITION BY SalesOrderID ORDER BY ProductID ROWS BETWEEN 2 PRECEDING AND 2 FOLLOWING) AS MovingSumLineTotal
FROM Sales.SalesOrderDetail;

------------------------------------------

SELECT SalesOrderID, ProductID, LineTotal,
       SUM(LineTotal) OVER (PARTITION BY SalesOrderID ORDER BY ProductID ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS CuumulativeLineTotal,
       AVG(LineTotal) OVER (PARTITION BY SalesOrderID ORDER BY ProductID ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS MovingAvgLineTotal,
       MAX(LineTotal) OVER (PARTITION BY SalesOrderID ORDER BY ProductID ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS MovingMaxLineTotal,
       MIN(LineTotal) OVER (PARTITION BY SalesOrderID ORDER BY ProductID ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS MovingMinLineTotal,
       COUNT(LineTotal) OVER (PARTITION BY SalesOrderID ORDER BY ProductID ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS MovingCountLineTotal
FROM Sales.SalesOrderDetail;

------------------------------------------

SELECT SalesOrderID, ProductID, LineTotal,
       RANK() OVER (PARTITION BY SalesOrderID ORDER BY LineTotal ) AS RankbyLineTotal,
       DENSE_RANK() OVER (PARTITION BY SalesOrderID ORDER BY LineTotal ) AS DenseRankbyLineTotal,
       ROW_NUMBER() OVER (PARTITION BY SalesOrderID ORDER BY LineTotal ) AS RowNumberbyLineTotal,
       NTILE(4) OVER (PARTITION BY SalesOrderID ORDER BY LineTotal ) AS QuartilebyLineTotal
FROM Sales.SalesOrderDetail;

------------------------------------------

SELECT SalesOrderID, ProductID, LineTotal,
       FIRST_VALUE(LineTotal) OVER (PARTITION BY SalesOrderID ORDER BY ProductID ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS FirstLineTotal,
       LAST_VALUE(LineTotal) OVER (PARTITION BY SalesOrderID ORDER BY ProductID ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS LastLineTotal,
       LAG(LineTotal, 1) OVER (PARTITION BY SalesOrderID ORDER BY ProductID ) AS PreviousLineTotal,
       LEAD(LineTotal, 1) OVER (PARTITION BY SalesOrderID ORDER BY ProductID ) AS NextLineTotal
FROM Sales.SalesOrderDetail;

------------------------------------------

SELECT SalesOrderID, ProductID, LineTotal,
       SUM(LineTotal) OVER (PARTITION BY SalesOrderID ORDER BY ProductID ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS CuumulativeLineTotal
FROM Sales.SalesOrderDetail
WHERE SUM(LineTotal) OVER (PARTITION BY SalesOrderID ORDER BY ProductID ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) > 500;

------------------------------------------