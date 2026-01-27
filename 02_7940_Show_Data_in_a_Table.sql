SELECT 5;

--------------

SELECT 'Hello, World!';

--------------

SELECT 5+3;

--------------

SELECT 'Hello' + ' World!';

--------------

SELECT 5, 5+3, 'Hello World!';

--------------

SELECT 5 AS result1, 5+3 result2, result3='Hello World!';

--------------

USE AdventureWorks2025;

--------------

SELECT * FROM Person.Person;

--------------

SELECT PersonType, FirstName, LastName FROM Person.Person;

--------------

SELECT FirstName, LastName, 
       FirstName + ' ' + LastName AS FullName,
       UPPER(FirstName)
FROM Person.Person;

--------------

SELECT PersonType FROM Person.Person;

--------------

SELECT PersonType, CASE WHEN PersonType = 'EM' THEN 'Employee'
                        WHEN PersonType = 'IN' THEN 'Individual'
                        ELSE 'Other' 
                   END AS PersonCategory,
                   CASE PersonType WHEN 'EM' THEN 'Employee'
                                   WHEN 'IN' THEN 'Individual'
                        ELSE 'Other' 
                   END AS PersonCategory2
FROM Person.Person;

--------------

