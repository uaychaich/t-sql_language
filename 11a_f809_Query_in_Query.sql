CREATE TABLE uay.Employees
(
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100),
    ManagerID INT NULL
);

INSERT INTO uay.Employees (EmployeeID, Name, ManagerID) VALUES
(1, 'Alice', NULL),   -- CEO, no manager
(2, 'Bob', 1),        -- Reports to Alice
(3, 'Charlie', 1),    -- Reports to Alice
(4, 'David', 2),      -- Reports to Bob
(5, 'Eve', 2),        -- Reports to Bob
(6, 'Frank', 4);      -- Reports to David
