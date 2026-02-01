SELECT * FROM uay.Requisition;
SELECT * FROM uay.ResourceWarehouse;

----------------------------------

INSERT INTO uay.ResourceWarehouse VALUES(5, 'Resource5', 50, GETDATE()),(1, 'Resource6', 50, GETDATE());

----------------------------------

INSERT INTO uay.Requisition VALUES(1,3,2, GETDATE());
UPDATE uay.ResourceWarehouse  SET QualityBalance = QualityBalance - 2 WHERE ResourceID =3

----------------------------------

BEGIN TRANSACTION

INSERT INTO uay.Requisition VALUES(1,3,2, GETDATE());

UPDATE uay.ResourceWarehouse  SET QualityBalance = QualityBalance - 2 WHERE ResourceID =3

COMMIT TRANSACTION

ROLLBACK TRANSACTION

----------------------------------

SELECT @@TRANCOUNT

BEGIN TRANSACTION 
SELECT @@TRANCOUNT

    BEGIN TRANSACTION 
    SELECT @@TRANCOUNT
    COMMIT TRANSACTION 
    ROLLBACK TRANSACTION 
    SELECT @@TRANCOUNT

COMMIT TRANSACTION
ROLLBACK TRANSACTION
SELECT @@TRANCOUNT

----------------------------------

BEGIN TRANSACTION

INSERT INTO uay.ResourceWarehouse VALUES (90,'Resource90',50,GETDATE());
SAVE TRANSACTION abc 
INSERT INTO uay.ResourceWarehouse VALUES (99,'Resource90',50,GETDATE())

COMMIT TRANSACTION
ROLLBACK TRANSACTION abc
SELECT @@TRANCOUNT

----------------------------------

BEGIN TRY
    BEGIN TRANSACTION
    INSERT INTO uay.Requisition VALUES(2,3,2, GETDATE());
    UPDATE uay.ResourceWarehouse  SET QualityBalance = QualityBalance - 2 WHERE ResourceID =3
    COMMIT TRANSACTION
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION
END CATCH

----------------------------------