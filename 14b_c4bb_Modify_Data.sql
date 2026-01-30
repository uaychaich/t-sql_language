INSERT INTO uay.NewLogin VALUES(10, 'User1', '2025-01-01'),(20, 'User2', '2025-01-02'),(30, 'User3', GETDATE());
INSERT INTO uay.NewLogin(LoginID, LoginName) VALUES(40, 'User4'),(50, 'User5');
INSERT uay.NewLogin(LoginID, LoginName) VALUES(60, 'User6');

SELECT * FROM uay.NewLogin;

-------------------------

INSERT INTO uay.NewLogin (LoginID, LoginName) SELECT LoginID, LoginName FROM uay.OldLogin;

SELECT * FROM uay.NewLogin;

-------------------------

UPDATE uay.NewLogin SET LoginName = 'UpdatedUser1' WHERE LoginID = 10;

SELECT * FROM uay.NewLogin;

-------------------------

SELECT * FROM uay.NewLogin;
SELECT * FROM uay.Register;

UPDATE uay.NewLogin SET LoginName = LoginName + FORMAT(GETDATE(), 'yyyyMMddhhmmss') 
FROM uay.NewLogin nl
JOIN uay.Register r ON nl.LoginID = r.LoginID
WHERE r.ExibitionName = 'Exhibition1';

SELECT * FROM uay.NewLogin;

-------------------------

DELETE FROM uay.NewLogin WHERE LoginID = 20;

SELECT * FROM uay.NewLogin;

-------------------------

SELECT * FROM uay.NewLogin;
SELECT * FROM uay.Register;

DELETE FROM uay.NewLogin
FROM uay.NewLogin nl
JOIN uay.Register r ON nl.LoginID = r.LoginID
WHERE r.ExibitionName = 'Exhibition1';

-------------------------