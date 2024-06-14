--7B.1
USE AdventureWorks2019;

-- FUNKCJA TWORZ�CA CI�G FIBONACCIEGO
CREATE FUNCTION dbo.Fibonacci (@n INT) --parametr n to liczba element�w
RETURNS @FibonacciTable TABLE ( --funkcja zwraca tabel� o dw�ch kolumnach
    Numer INT PRIMARY KEY,
    Wartosc INT
)
AS
BEGIN
    DECLARE @a BIGINT = 0, @b BIGINT = 1, @i INT = 1, @next BIGINT

    INSERT INTO @FibonacciTable (Numer, Wartosc) VALUES (1, @a) --pierwsza wartosc ciagu
    IF @n > 1
    BEGIN
        INSERT INTO @FibonacciTable (Numer, Wartosc) VALUES (2, @b) --druga wartosc ciagu
    END

    WHILE @i <= @n - 2
    BEGIN --reszta wartosci
        SET @next = @a + @b
        SET @a = @b
        SET @b = @next
        SET @i = @i + 1

        INSERT INTO @FibonacciTable (Numer, Wartosc) VALUES (@i + 1, @next)
    END

    RETURN
END;
GO

-- PROCEDURA WYPISUJ�CA CI�G FIBONACCIEGO
CREATE PROCEDURE dbo.PrintFibonacci
    @n INT
AS
BEGIN
    DECLARE @Numer INT, @Wartosc BIGINT --deklaracja zmiennych

    DECLARE FibonacciCursor CURSOR FOR --stworzenie kursora do iteracji wiersz po wierszu
    SELECT Numer, Wartosc
    FROM dbo.Fibonacci(@n)

    OPEN FibonacciCursor 
    FETCH NEXT FROM FibonacciCursor INTO @Numer, @Wartosc --pobranie danych

    WHILE @@FETCH_STATUS = 0 --0 oznacza zako�czenia dzia�ania z powodzeniem
    BEGIN
        PRINT CONCAT('Pozycja: ', @Numer, ' Warto��: ', @Wartosc)
        FETCH NEXT FROM FibonacciCursor INTO @Numer, @Wartosc
    END

    CLOSE FibonacciCursor
    DEALLOCATE FibonacciCursor --zwalnia zasoby
END;
GO

EXEC dbo.PrintFibonacci @n = 10;


--7B.2

CREATE TRIGGER WielkieNazwisko
ON Person.Person
AFTER INSERT --po jakiej akcji ma si� uruchamia�
AS
BEGIN
        --aktualizacja nazwiska na wielkie litery dla nowo wstawionych wierszy
        UPDATE Person.Person
        SET LastName = UPPER(LastName)
    END
GO

--7B.3

CREATE TRIGGER taxRateMonitoring
ON Sales.SalesTaxRate
AFTER UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM INSERTED i --"tabela" dost�pna w ramach triggera zawieraj�ca nowe warto�ci
        JOIN DELETED d ON i.SalesTaxRateID = d.SalesTaxRateID
        WHERE ABS((i.TaxRate - d.TaxRate) / d.TaxRate) > 0.30
    )
    BEGIN
        RAISERROR ('TaxRate change exceeds 30%% threshold.', 16, 1); --generowanie komunikatu b��du
    END
END;
