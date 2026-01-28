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

