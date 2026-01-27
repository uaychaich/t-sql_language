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

