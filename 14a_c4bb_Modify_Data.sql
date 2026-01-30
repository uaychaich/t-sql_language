CREATE TABLE uay.NewLogin(
    LoginID INT PRIMARY KEY,
    LoginName VARCHAR(255),
    ModifiedDate DATETIME DEFAULT GETDATE()
)
GO
CREATE TABLE uay.OldLogin(
    LoginID INT PRIMARY KEY,
    LoginName VARCHAR(255)
)
GO
CREATE TABLE uay.Register(
    LoginID INT,
    ExibitionName VARCHAR(255),
    ModifiedDate DATETIME DEFAULT GETDATE()
)
GO 

INSERT INTO uay.OldLogin (LoginID, LoginName)
VALUES (1, 'UserA'), (2, 'UserB'), (3, 'UserC'), (4, 'UserD')
GO

INSERT INTO uay.Register (LoginID, ExibitionName)
VALUES (1, 'Exhibition1'), (2, 'Exhibition1'), (1, 'Exhibition2'), (4, 'Exhibition2'), (3, 'Exhibition3')
GO