DECLARE @data01 TINYINT;
SET @data01=255;
SELECT @data01 AS TINYINT_Value;
GO
---------------------------------------
DECLARE @data01 TINYINT;      SET @data01 = 5.123456789;
DECLARE @data02 SMALLINT;     SET @data02 = 5.123456789;
DECLARE @data03 INT;          SET @data03 = 5.123456789;
DECLARE @data04 BIGINT;       SET @data04 = 5.123456789;
DECLARE @data05 BIT;          SET @data05 = 5.123456789;
DECLARE @data06 DECIMAL(20,7);SET @data06 = 5.123456789;
DECLARE @data07 NUMERIC(20,7);SET @data07 = 5.123456789;
DECLARE @data08 MONEY;        SET @data08 = 5.123456789;
DECLARE @data09 SMALLMONEY;   SET @data09 = 5.123456789;

SELECT 
    @data01 AS TINYINT_Value,
    @data02 AS SMALLINT_Value,
    @data03 AS INT_Value,
    @data04 AS BIGINT_Value,
    @data05 AS BIT_Value,
    @data06 AS DECIMAL_Value,
    @data07 AS NUMERIC_Value,
    @data08 AS MONEY_Value,
    @data09 AS SMALLMONEY_Value;
GO
---------------------------------------

DECLARE @data01 FLOAT;SET @data01 = 5.123456789;
DECLARE @data02 REAL; SET @data02 = 5.123456789;

SELECT 
    @data01 AS FLOAT_Value,
    @data02 AS REAL_Value;
GO
---------------------------------------

DECLARE @data01 DATE;          SET @data01 = SYSDATETIMEOFFSET();
DECLARE @data02 TIME;          SET @data02 = SYSDATETIMEOFFSET();
DECLARE @data03 DATETIME2;     SET @data03 = SYSDATETIMEOFFSET();
DECLARE @data04 DATETIMEOFFSET;SET @data04 = SYSDATETIMEOFFSET();
DECLARE @data05 DATETIME;      SET @data05 = SYSDATETIMEOFFSET();
DECLARE @data06 SMALLDATETIME; SET @data06 = SYSDATETIMEOFFSET();

SELECT 
    @data01 AS DATE_Value,
    @data02 AS TIME_Value,
    @data03 AS DATETIME2_Value,
    @data04 AS DATETIMEOFFSET_Value,
    @data05 AS DATETIME_Value,
    @data06 AS SMALLDATETIME_Value;
GO

---------------------------------------

DECLARE @data01 CHAR(50);    SET @data01 = N'Uaychai นะจ๊ะ';
DECLARE @data02 VARCHAR(50); SET @data02 = N'Uaychai นะจ๊ะ';
DECLARE @data03 VARCHAR(MAX);SET @data03 = N'Uaychai นะจ๊ะ';

SELECT 
    @data01 AS CHAR_Value,
    @data02 AS VARCHAR_Value,
    @data03 AS VARCHAR_MAX_Value;
GO

---------------------------------------

DECLARE @data01 NCHAR(50);    SET @data01 = N'Uaychai นะจ๊ะ';
DECLARE @data02 NVARCHAR(50); SET @data02 = N'Uaychai นะจ๊ะ';
DECLARE @data03 NVARCHAR(MAX);SET @data03 = N'Uaychai นะจ๊ะ';

SELECT 
    @data01 AS NCHAR_Value,
    @data02 AS NVARCHAR_Value,
    @data03 AS NVARCHAR_MAX_Value;
GO

---------------------------------------

DECLARE @data01 TABLE (Col1 INT, Col2 NVARCHAR(50));
INSERT INTO @data01 (Col1, Col2) VALUES (1, N'Uaychai นะจ๊ะ');
SELECT * FROM @data01;
GO

---------------------------------------

CREATE TABLE #TempTable (Col1 INT, Col2 NVARCHAR(50));
INSERT INTO #TempTable (Col1, Col2) VALUES (1, N'Uaychai นะจ๊ะ');
SELECT * FROM #TempTable;

---------------------------------------

DECLARE @data01 NUMERIC(20,7);
DECLARE @data02 NUMERIC(20,7);
SELECT @data01=AVG(TotalDue), @data02=SUM(TotalDue) FROM Sales.SalesOrderHeader
SELECT @data01 AS Average_TotalDue, @data02 AS Sum_TotalDue;
GO
---------------------------------------

DECLARE @data01 INT = 10;
DECLARE @data02 NVARCHAR(10) = N'20';

SELECT @data01 + CAST(@data02 AS INT) AS Sum_Value, 
       CONVERT(NVARCHAR(10), @data01) + @data02 AS Concat_Value,
       @data01 + PARSE(@data02 AS INT USING 'th-TH') AS Parsed_Value;
GO
---------------------------------------

DECLARE @data01 NVARCHAR(10) = N'Uaychai';
SELECT CAST(@data01 AS INT) AS Converted_Value;
GO

---------------------------------------

DECLARE @data01 NVARCHAR(10) = N'Uaychai';
SELECT TRY_CAST(@data01 AS INT) AS Converted_Value,
       TRY_CONVERT(INT, @data01) AS Converted_Value2,
       TRY_PARSE(@data01 AS INT) AS Converted_Value3;
GO

---------------------------------------

