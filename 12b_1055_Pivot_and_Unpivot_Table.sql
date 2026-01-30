SELECT SOH.SalesOrderID, YEAR(SOH.OrderDate) AS OrderYear, MONTH(SOH.OrderDate) AS OrderMonth, TerritoryID, SOH.TotalDue
FROM Sales.SalesOrderHeader AS SOH;

-----------------------------------

SELECT YEAR(SOH.OrderDate) AS OrderYear, MONTH(SOH.OrderDate) AS OrderMonth, TerritoryID, SUM(SOH.TotalDue) AS SumTotalDue
FROM Sales.SalesOrderHeader AS SOH
GROUP BY YEAR(SOH.OrderDate), MONTH(SOH.OrderDate), TerritoryID
ORDER BY OrderYear, OrderMonth, TerritoryID;

-----------------------------------

SELECT *
FROM (
       SELECT YEAR(SOH.OrderDate) AS OrderYear, MONTH(SOH.OrderDate) AS OrderMonth, TerritoryID, TotalDue
       FROM Sales.SalesOrderHeader AS SOH 
     ) AS SourceTable
PIVOT (
       SUM(TotalDue)
       FOR TerritoryID IN ([1], [2], [3], [4], [5], [6], [7], [8], [9], [10])
     ) AS PivotTable
ORDER BY OrderYear, OrderMonth;

-----------------------------------

SELECT * FROM uay.salesdata_crosstab

-----------------------------------

SELECT *
FROM 
(
  SELECT SaleName, JAN, FEB, MAR FROM uay.salesdata_crosstab
) AS CrosstabData
UNPIVOT ( 
        [Amount] FOR [Month] IN ([JAN], [FEB], [MAR])
) AS UnpivotedData;

-----------------------------------