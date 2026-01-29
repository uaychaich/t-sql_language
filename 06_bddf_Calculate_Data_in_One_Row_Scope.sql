SELECT BusinessEntityID, Title, FirstName, LastName,
       LEN(LastName) AS LastName_Length,
       UPPER(LastName) AS LastName_Uppercase,
       LOWER(LastName) AS LastName_Lowercase,
       REVERSE(LastName) AS LastName_Reversed,
       LEFT(LastName, 3) AS LastName_First3Chars,
       RIGHT(LastName, 3) AS LastName_Last3Chars,
       SUBSTRING(LastName, 2, 4) AS LastName_MidChars,
       PATINDEX('%son%', LastName) AS LastName_PatIndex,
       REPLACE(LastName, 'son', 'uay') AS LastName_Replaced,
       STUFF(LastName, 2, 3, 'XXXX') AS LastName_Stuffed,
       Title + ' ' + FirstName + ' ' + LastName AS FullName1,
       CONCAT(Title, ' ', FirstName, ' ', LastName) AS FullName2,
       CONCAT(REPLICATE(' ', 2), Title, ' ', FirstName, ' ', LastName, REPLICATE(' ', 2)) AS FullName3,
       CONCAT(SPACE(2),Title, ' ', FirstName, ' ', LastName, SPACE(2)) AS FullName4,
       TRIM(CONCAT(SPACE(2),Title, ' ', FirstName, ' ', LastName, SPACE(2))) AS FullName5,
       LTRIM(CONCAT(SPACE(2),Title, ' ', FirstName, ' ', LastName, SPACE(2))) AS FullName6,
       RTRIM(CONCAT(SPACE(2),Title, ' ', FirstName, ' ', LastName, SPACE(2))) AS FullName7
FROM Person.Person;

----------------------------

SELECT SalesOrderID, OrderDate,
       YEAR(OrderDate) AS Order_Year,
       MONTH(OrderDate) AS Order_Month,
       DAY(OrderDate) AS Order_Day,
       DATEPART(WEEKDAY, OrderDate) AS Order_Weekday,
       DATENAME(WEEKDAY, OrderDate) AS Order_WeekdayName,
       DATETRUNC(MONTH, OrderDate) AS Order_MonthStart,
       DATE_BUCKET(QUARTER, 2, OrderDate) AS Order_DateBucket,
       FORMAT(OrderDate, 'dddd-dd-MMMM-yyyy') AS Order_FormattedDate
FROM Sales.SalesOrderHeader;

SELECT SYSDATETIME (), SYSDATETIMEOFFSET (), SYSUTCDATETIME (), 
       GETDATE(), GETUTCDATE (), CURRENT_DATE, CURRENT_TIMESTAMP;

--2027-11-23 14:30:45.1234567 +02:00
SELECT SMALLDATETIMEFROMPARTS(2027, 11, 23, 14, 30), 
       DATETIMEFROMPARTS ( 2027, 11, 23, 14, 30, 45, 123 ),
       DATETIME2FROMPARTS ( 2027, 11, 23, 14, 30, 45, 1234567, 7 ),
       DATETIMEOFFSETFROMPARTS ( 2027, 11, 23, 14, 30, 45, 1234567, 2, 0, 7 ),
       DATEFROMPARTS ( 2027, 11, 23 ),
       TIMEFROMPARTS ( 14, 30, 45, 1234567, 7 );

SELECT SalesOrderID, OrderDate,
       DATEDIFF( DAY, '2023-01-01', OrderDate) AS Days_Since_2023_01_01,
       DATEDIFF_BIG( DAY, '2023-01-01', OrderDate) AS Days_Since_2023_01_01_Big,
       DATEADD( DAY, 15, OrderDate) AS OrderDate_Plus_15Days,
       EOMONTH( OrderDate, 0) AS EndOfMonth_Current
FROM Sales.SalesOrderHeader;

SELECT SYSDATETIMEOFFSET() AS CurrentDateTimeOffset,
       SWITCHOFFSET( SYSDATETIMEOFFSET(), '+05:30') AS DateTimeOffset1,
       GETDATE() AS CurrentDateTime,
       TODATETIMEOFFSET( GETDATE(), '+05:30') AS DateTimeOffset2;

SELECT ISDATE('2023-12-31') AS IsDate1,
       ISDATE('31-12-2023') AS IsDate2,
       ISDATE('2023/12/31') AS IsDate3,
       ISDATE('12/31/2023') AS IsDate4,
       ISDATE('2023-13-01') AS IsDate5,
       ISDATE('NotADate') AS IsDate6;

----------------------------

SELECT SalesOrderID, TotalDue,
       FORMAT(TotalDue, 'C', 'en-US') AS TotalDue_Formatted_USD,
       FORMAT(TotalDue, 'C', 'th-TH') AS TotalDue_Formatted_THB,
       FORMAT(TotalDue, 'N3') AS TotalDue_Formatted_Number,
       FORMAT(TotalDue, '#,##0.000') AS TotalDue_Formatted_Custom,
       ABS(TotalDue) AS TotalDue_Absolute,
       SIGN(TotalDue) AS TotalDue_Sign,
       CEILING(TotalDue) AS TotalDue_Ceiling,
       FLOOR(TotalDue) AS TotalDue_Floor,
       ROUND(TotalDue, 2) AS TotalDue_Rounded
FROM Sales.SalesOrderHeader;

SELECT ISNUMERIC('12345') AS IsNumeric1,
       ISNUMERIC('123.45') AS IsNumeric2,
       ISNUMERIC('-123.45') AS IsNumeric3,
       ISNUMERIC('1e10') AS IsNumeric4,
       ISNUMERIC('NotANumber') AS IsNumeric5;

----------------------------

SELECT BusinessEntityID, PersonType, Title, FirstName, LastName, EmailPromotion
FROM Person.Person;

SELECT BusinessEntityID, 
       IIF(PersonType = 'EM', 'Employee', 'Non-Employee') AS PersonType_Description,
       CASE WHEN PersonType = 'EM' THEN 'Employee'
            WHEN PersonType = 'IN' THEN 'Individual'
            WHEN PersonType = 'SP' THEN 'Store Person'
            ELSE 'Other' END AS PersonType_Description2,
       ISNULL(Title, 'No Title') AS Title_NonNull, 
       COALESCE(Title, 'No Title', 'N/A') AS Title_NonNull2,
       FirstName, LastName, 
       CHOOSE(EmailPromotion + 1, 'No Promotion', 'Promoted', 'Highly Promoted') AS EmailPromotion_Description,
       NULLIF(EmailPromotion, 0) AS EmailPromotion_NullIfZero
FROM Person.Person;

SELECT SalesOrderID, TaxAmt, Freight, 
       GREATEST(TaxAmt, Freight) AS Max_Charge,
       LEAST(TaxAmt, Freight) AS Min_Charge
FROM Sales.SalesOrderHeader;

----------------------------