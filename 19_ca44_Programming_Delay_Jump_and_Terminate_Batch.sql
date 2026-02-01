DECLARE @Counter int;  
SET @Counter = 1;  
WHILE @Counter < 10  
BEGIN   
    PRINT @Counter  
    SET @Counter = @Counter + 1  
    IF @Counter = 4 GOTO Branch_One 
    IF @Counter = 5 GOTO Branch_Two  
END  
Branch_One:  
    PRINT 'Jumping To Branch One.';
    WAITFOR DELAY '00:00:10';
    GOTO Branch_Three; 
Branch_Two:  
    PRINT 'Jumping To Branch Two.';  
Branch_Three:  
    RETURN;
    PRINT 'Jumping To Branch Three.';
GO

------------------------------------------

PRINT 1
RETURN
PRINT 2
GO
PRINT 3
GO