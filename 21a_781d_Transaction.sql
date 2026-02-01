CREATE TABLE uay.Requisition(
    ID INT NOT NULL PRIMARY KEY,
    ResourceID INT NOT NULL,
    Quality INT NOT NULL,
    ModifiedDate DATETIME NOT NULL
)
GO

CREATE TABLE uay.ResourceWarehouse(
    ResourceID INT NOT NULL PRIMARY KEY,
    Name NVARCHAR(50) NOT NULL,
    QualityBalance INT NOT NULL,
    ModifiedDate DATETIME NOT NULL
)
GO

INSERT INTO uay.ResourceWarehouse 
VALUES(1, N'Resource1', 50, GETDATE()),
      (2, N'Resource2', 50, GETDATE()),
      (3, N'Resource3', 50, GETDATE()),
      (4, N'Resource4', 50, GETDATE());