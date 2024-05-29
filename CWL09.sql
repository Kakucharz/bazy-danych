USE AdventureWorks2019

-- 9.1
BEGIN TRANSACTION
UPDATE Production.Product
SET ListPrice = 1.1 * ListPrice
WHERE ProductID = 680;
COMMIT; --zatwierdzenie transakcji

SELECT ProductID, ListPrice FROM Production.Product



--9.2
BEGIN TRANSACTION
DELETE FROM Production.Product
WHERE ProductID = 707
ROLLBACK; --wycofanie transakcji

SELECT * FROM Production.Product
 


 --9.3
BEGIN TRANSACTION
INSERT INTO Production.Product (Name, ProductNumber, MakeFlag, FinishedGoodsFlag, Color, SafetyStockLevel, ReorderPoint, StandardCost, ListPrice, Size, SizeUnitMeasureCode, WeightUnitMeasureCode, Weight, DaysToManufacture, ProductLine, Class, Style, ProductSubcategoryID, ProductModelID, SellStartDate, SellEndDate, DiscontinuedDate, rowguid, ModifiedDate)
VALUES ('New Product', 'NP-001', 1, 1, 'Red', 100, 50, 10.00, 20.00, 'M', NULL, NULL, NULL, 5, 'T', 'H', 'U', NULL, NULL, GETDATE(), NULL, NULL, NEWID(), GETDATE());
COMMIT;



--9.4
BEGIN TRANSACTION
--deklaracja pomocniczej zmiennej do wyznaczenia sumy StandardCost
DECLARE @StandardCost2 DECIMAL(10, 2);
SELECT @StandardCost2 = SUM(StandardCost * 1.1) FROM Production.Product;

IF @StandardCost2 <= 50000
BEGIN
	UPDATE Production.Product
	SET StandardCost = 1.1 * StandardCost
	COMMIT;
	PRINT 'Transakcja przebieg³a pomyœlnie'
END
ELSE
BEGIN
	ROLLBACK;
	PRINT 'Transakcja zosta³a odrzucona'
END;



--9.5
BEGIN TRANSACTION
DECLARE @NewProduct NVARCHAR(25) = 'NP-001';
DECLARE @NewProductExists INT;

SELECT @NewProductExists = COUNT(*)
FROM Production.Product
WHERE ProductNumber = @NewProduct

IF @NewProductExists = 0
BEGIN
	INSERT INTO Production.Product (Name, ProductNumber, MakeFlag, FinishedGoodsFlag, Color, SafetyStockLevel, ReorderPoint, StandardCost, ListPrice, Size, SizeUnitMeasureCode, WeightUnitMeasureCode, Weight, DaysToManufacture, ProductLine, Class, Style, ProductSubcategoryID, ProductModelID, SellStartDate, SellEndDate, DiscontinuedDate, rowguid, ModifiedDate)
    VALUES ('New Product', @NewProduct, 1, 1, 'Red', 100, 50, 10.00, 20.00, 'M', NULL, NULL, NULL, 5, 'T', 'H', 'U', NULL, NULL, GETDATE(), NULL, NULL, NEWID(), GETDATE());
	COMMIT
	PRINT 'Transakcja przebieg³a pomyœlnie. Dodano nowy produkt o numerze ' + CAST(@NewProduct AS NVARCHAR(25));
END
ELSE
BEGIN
	ROLLBACK;
	PRINT 'Transakcja zosta³a odrzucona. Produkt o tym numerze ju¿ istnieje.';
END



--9.6
SELECT * FROM Sales.SalesOrderDetail

BEGIN TRANSACTION;
--sprawdzenie czy istnieje OrderQty o wartoœci 0
IF EXISTS(SELECT 1 FROM Sales.SalesOrderDetail WHERE OrderQty = 0)
BEGIN 
	ROLLBACK;
	PRINT 'Transakcja zosta³a odrzucona. Znaleziono OrderQty o wartoœci 0';
END
ELSE
BEGIN
	UPDATE Sales.SalesOrderDetail
	SET OrderQty = OrderQty + 1
	COMMIT;
	PRINT 'Transakcja przebieg³a pomyœlnie.';
END



--9.7
BEGIN TRANSACTION
DECLARE @AvgCost DECIMAL(10,2);
DECLARE @DoZaorania INT;

SELECT @AvgCost = AVG(StandardCost) FROM Production.Product;

SELECT @DoZaorania = COUNT(*)
FROM Production.Product
WHERE StandardCost > @AvgCost;

IF @DoZaorania <= 10
BEGIN
	DELETE FROM Production.Product
	WHERE @AvgCost < StandardCost;
	COMMIT;
	PRINT 'Transakcja przebieg³a pomyœlnie. Usuniêto ' + CAST(@DoZaorania AS NVARCHAR(10)) + ' produktów.';
END
ELSE
BEGIN
	ROLLBACK;
	PRINT 'Transakcja zosta³a przerwana. Liczba produktów do usuniêcia (' + CAST(@DoZaorania AS NVARCHAR(10)) + ') przekracza 10.';
END