-- 8.1
USE AdventureWorks2019

WITH EmployeeInfo AS ( --definicja wyrazenia CTE
    SELECT 
        e.BusinessEntityID AS ID,
        p.FirstName,
        p.LastName,
		e.Rate
    FROM 
        HumanResources.EmployeePayHistory e
    INNER JOIN --z³¹czenie tabel HR.EmployeePayHistory i Person.Person
        Person.Person p ON e.BusinessEntityID = p.BusinessEntityID
)

SELECT *
INTO TempEmployeeInfo2
FROM EmployeeInfo;

SELECT * FROM TempEmployeeInfo2;

-- 8.2
USE AdventureWorksLT2019

SELECT * 
FROM SalesLT.SalesOrderHeader;
SELECT *
FROM SalesLT.Customer;


WITH przychody (CompanyContact, Revenue) --CTE o dwóch kolumnach
AS 
(
	SELECT CONCAT( CompanyName, ' (', FirstName, ' ', LastName, ')' ), s.TotalDue
	FROM SalesLT.Customer c
	INNER JOIN SalesLT.SalesOrderHeader s
	ON c.CustomerID=s.CustomerID
)
SELECT * 
FROM przychody

-- 8.3
USE AdventureWorksLT2019


WITH sprzedaz (Category, SalesValue) --CTE o dwóch kolumnach
AS
(
	SELECT c.Name, o.UnitPrice
	FROM SalesLT.Product p --tabela do z³¹czenia dwóch innych
	INNER JOIN SalesLT.ProductCategory c
		ON p.ProductCategoryID=c.ProductCategoryID
	INNER JOIN SalesLT.SalesOrderDetail o
		ON p.ProductID=o.ProductID
)
SELECT Category, SUM(SalesValue) AS SalesValue
FROM sprzedaz
GROUP BY Category


SELECT * FROM SalesLT.Product
SELECT * FROM SalesLT.ProductCategory
SELECT * FROM SalesLT.SalesOrderDetail