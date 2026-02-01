DECLARE @temptable TABLE(MonthOrderDate INT, SumTotalDue MONEY, AccSumTotalDue MONEY)

DECLARE @MonthOrderDate INT, @SumTotalDue MONEY, @AccSumTotalDue MONEY=0

DECLARE SumTotalDuebyMonth2024_cursor CURSOR FOR
SELECT MONTH(OrderDate) AS MonthOrderDate, SUM(TotalDue) AS SumTotalDue
FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate) = 2024
GROUP BY MONTH(OrderDate)
ORDER BY MONTH(OrderDate)

OPEN SumTotalDuebyMonth2024_cursor

FETCH NEXT FROM SumTotalDuebyMonth2024_cursor
INTO @MonthOrderDate, @SumTotalDue

WHILE @@FETCH_STATUS = 0
BEGIN

    SET @AccSumTotalDue = @AccSumTotalDue + @SumTotalDue

    INSERT @temptable VALUES(@MonthOrderDate, @SumTotalDue,@AccSumTotalDue)

    FETCH NEXT FROM SumTotalDuebyMonth2024_cursor
    INTO @MonthOrderDate, @SumTotalDue
END
CLOSE SumTotalDuebyMonth2024_cursor;
DEALLOCATE SumTotalDuebyMonth2024_cursor;
SELECT * FROM @temptable;

--------------------------------------------

SELECT sourcetable.*, SUM(SumTotalDue) OVER(ORDER BY MonthOrderDate ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
FROM (
    SELECT MONTH(OrderDate) AS MonthOrderDate, SUM(TotalDue) AS SumTotalDue
    FROM Sales.SalesOrderHeader
    WHERE YEAR(OrderDate) = 2024
    GROUP BY MONTH(OrderDate)
) AS sourcetable
ORDER BY MonthOrderDate;

--------------------------------------------