SELECT * FROM uay.Customers;
SELECT * FROM uay.Orders;

-------------

SELECT 
    uay.Orders.OrderID,
    uay.Orders.CustomerID,
    uay.Customers.CustomerID,
    uay.Customers.CustomerName,
    uay.Customers.ContactEmail,
    uay.Orders.OrderDate,
    uay.Orders.Amount
FROM uay.Orders
INNER JOIN uay.Customers
ON uay.Orders.CustomerID = uay.Customers.CustomerID;

-------------

SELECT 
    o.OrderID,
    o.CustomerID AS Order_CustomerID,
    c.CustomerID AS Customer_CustomerID,
    c.CustomerName,
    c.ContactEmail,
    o.OrderDate,
    o.Amount
FROM uay.Orders AS o
INNER JOIN uay.Customers AS c
ON o.CustomerID = c.CustomerID;

-------------

SELECT 
    o.OrderID,
    o.CustomerID AS Order_CustomerID,
    c.CustomerID AS Customer_CustomerID,
    c.CustomerName,
    c.ContactEmail,
    o.OrderDate,
    o.Amount
FROM uay.Orders AS o
JOIN uay.Customers AS c
ON o.CustomerID = c.CustomerID;

-------------

SELECT 
    o.OrderID,
    o.CustomerID AS Order_CustomerID,
    c.CustomerID AS Customer_CustomerID,
    c.CustomerName,
    c.ContactEmail,
    o.OrderDate,
    o.Amount
FROM uay.Orders AS o
LEFT OUTER JOIN uay.Customers AS c
ON o.CustomerID = c.CustomerID;

-------------

SELECT 
    o.OrderID,
    o.CustomerID AS Order_CustomerID,
    c.CustomerID AS Customer_CustomerID,
    c.CustomerName,
    c.ContactEmail,
    o.OrderDate,
    o.Amount
FROM uay.Orders AS o
LEFT JOIN uay.Customers AS c
ON o.CustomerID = c.CustomerID;

-------------

SELECT 
    o.OrderID,
    o.CustomerID AS Order_CustomerID,
    c.CustomerID AS Customer_CustomerID,
    c.CustomerName,
    c.ContactEmail,
    o.OrderDate,
    o.Amount
FROM uay.Orders AS o
RIGHT OUTER JOIN uay.Customers AS c
ON o.CustomerID = c.CustomerID;

-------------

SELECT 
    o.OrderID,
    o.CustomerID AS Order_CustomerID,
    c.CustomerID AS Customer_CustomerID,
    c.CustomerName,
    c.ContactEmail,
    o.OrderDate,
    o.Amount
FROM uay.Orders AS o
RIGHT JOIN uay.Customers AS c
ON o.CustomerID = c.CustomerID;

-------------

SELECT 
    o.OrderID,
    o.CustomerID AS Order_CustomerID,
    c.CustomerID AS Customer_CustomerID,
    c.CustomerName,
    c.ContactEmail,
    o.OrderDate,
    o.Amount
FROM uay.Orders AS o
FULL OUTER JOIN uay.Customers AS c
ON o.CustomerID = c.CustomerID;

-------------

SELECT 
    o.OrderID,
    o.CustomerID AS Order_CustomerID,
    c.CustomerID AS Customer_CustomerID,
    c.CustomerName,
    c.ContactEmail,
    o.OrderDate,
    o.Amount
FROM uay.Orders AS o
FULL JOIN uay.Customers AS c
ON o.CustomerID = c.CustomerID;

-------------

SELECT CustomerID FROM uay.Customers;
SELECT CustomerID FROM uay.Orders;

SELECT c.CustomerID, o.CustomerID 
FROM uay.Customers AS c CROSS JOIN uay.Orders AS o;

-------------

SELECT * FROM uay.Employees;

SELECT emp.EmployeeID, emp.Name AS EmployeeName, emp.ManagerID, mgr.Name AS ManagerName
FROM uay.Employees AS emp LEFT JOIN uay.Employees AS mgr ON emp.ManagerID = mgr.EmployeeID;

-------------

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
ON sod.ProductID = p.ProductID;

-------------

SELECT * FROM Sales.Store;
SELECT * FROM Purchasing.Vendor;

-------------

SELECT BusinessEntityID, Name, 'Store' AS Type FROM Sales.Store
UNION
SELECT BusinessEntityID, Name, 'Vendor' FROM Purchasing.Vendor;

-------------

SELECT BusinessEntityID, Name, 'Store' AS Type FROM Sales.Store
WHERE BusinessEntityID < 300
UNION
SELECT BusinessEntityID, Name, 'Vendor' FROM Purchasing.Vendor
WHERE BusinessEntityID < 1500
ORDER BY BusinessEntityID

-------------

SELECT BusinessEntityID, Name, 'Store' AS Type FROM Sales.Store
UNION ALL
SELECT BusinessEntityID, Name, 'Vendor' FROM Purchasing.Vendor
ORDER BY BusinessEntityID

-------------

SELECT ProductID FROM Production.Product;
SELECT ProductID  FROM Sales.SalesOrderDetail;

-------------

SELECT ProductID FROM Production.Product
INTERSECT 
SELECT ProductID  FROM Sales.SalesOrderDetail;

-------------

SELECT ProductID FROM Production.Product
EXCEPT
SELECT ProductID  FROM Sales.SalesOrderDetail;

-------------