CREATE SCHEMA uay;
GO
CREATE TABLE uay.Customers
(
    CustomerID INT PRIMARY KEY,
    CustomerName NVARCHAR(100),
    ContactEmail NVARCHAR(100)
);
GO
CREATE TABLE uay.Orders
(
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATETIME,
    Amount DECIMAL(10, 2)
);
GO
CREATE TABLE uay.Employees
(
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100),
    ManagerID INT NULL
);
GO

INSERT INTO uay.Customers (CustomerID, CustomerName, ContactEmail) VALUES
(1, 'Alice Johnson', 'alice.johnson@example.com'),
(2, 'Bob Smith', 'bob.smith@example.com'),
(3, 'Charlie Brown', 'charlie.brown@example.com'),
(99, 'Diana Prince', 'diana.prince@example.com');

INSERT INTO uay.Orders (OrderID, CustomerID, OrderDate, Amount) VALUES
(101, 1, '2024-01-15', 250.00),
(102, 2, '2024-02-20', 150.50),
(103, 1, '2024-03-05', 300.75),
(104, 3, '2024-04-10', 450.00),
(105, 2, '2024-05-25', 120.00),
(106, 4, '2024-06-30', 500.00);

INSERT INTO uay.Employees (EmployeeID, Name, ManagerID) VALUES
(1, 'Alice', NULL),   -- CEO, no manager
(2, 'Bob', 1),        -- Reports to Alice
(3, 'Charlie', 1),    -- Reports to Alice
(4, 'David', 2),      -- Reports to Bob
(5, 'Eve', 2),        -- Reports to Bob
(6, 'Frank', 4);      -- Reports to David