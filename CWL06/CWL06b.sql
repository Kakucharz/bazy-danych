--ZAD 1
CREATE DATABASE firma2

--ZAD 2
CREATE SCHEMA ksiegowosc2

--ZAD 4
--Stworzenie tabeli ksiegowosc.pracownicy 
CREATE TABLE ksiegowosc2.pracownicy(
	id_pracownika INT NOT NULL PRIMARY KEY,
	imie VARCHAR(50) NOT NULL,
	nazwisko VARCHAR(50) NOT NULL,
	adres VARCHAR(120) NOT NULL,
	telefon VARCHAR(15) NOT NULL
);

--Stworzenie tabeli ksiegowosc.godziny
CREATE TABLE ksiegowosc2.godziny2(
	id_godziny INT NOT NULL PRIMARY KEY,
	data DATE NOT NULL,
	liczba_godzin INT NOT NULL,
	id_pracownika INT NOT NULL,
	FOREIGN KEY (id_pracownika) REFERENCES KSIEGOWOSC2.pracownicy (id_pracownika)
);

--Stworzenie tabeli ksiegowosc.pensja
CREATE TABLE ksiegowosc2.pensja(
	id_pensji INT NOT NULL PRIMARY KEY,
	stanowisko VARCHAR(50) NOT NULL,
	kwota DECIMAL(10,2) NOT NULL
);

--Stworzenie tabeli ksiegowosc.premia
CREATE TABLE ksiegowosc2.premia(
	id_premii INT NOT NULL PRIMARY KEY,
	rodzaj VARCHAR(50) NOT NULL,
	kwota DECIMAL(10,2) NOT NULL
);

--Stworzenie tabeli ksiegowosc.wynagrodzenia
CREATE TABLE ksiegowosc2.wynagrodzenia2(
	id_wynagrodzenia INT NOT NULL PRIMARY KEY,
	data DATE NOT NULL,
	id_pracownika INT NOT NULL,
    id_godziny INT NOT NULL,
    id_pensji INT NOT NULL,
    id_premii INT,
    FOREIGN KEY (id_pracownika) REFERENCES ksiegowosc2.pracownicy (id_pracownika),
    FOREIGN KEY (id_godziny) REFERENCES ksiegowosc2.godziny2 (id_godziny),
    FOREIGN KEY (id_pensji) REFERENCES ksiegowosc2.pensja (id_pensji),
    FOREIGN KEY (id_premii) REFERENCES ksiegowosc2.premia (id_premii)
);

--ZAD 5
--Wype³nienie tabeli ksiegowosc.pracownicy
INSERT INTO ksiegowosc2.pracownicy (id_pracownika, imie, nazwisko, adres, telefon)
VALUES
(1, 'Jan', 'Kowalski', 'ul. Wiejska 1, 00-001 Warszawa', '123456789'),
(2, 'Anna', 'Nowak', 'ul. Kwiatowa 5, 00-002 Warszawa', '987654321'),
(3, 'Piotr', 'Zawadzki', 'ul. S³oneczna 10, 00-003 Warszawa', '111222333'),
(4, 'Alicja', 'Wiœniewska', 'ul. Ogrodowa 3, 00-004 Warszawa', '444555666'),
(5, 'Marek', 'Duda', 'ul. Polna 7, 00-005 Warszawa', '777888999'),
(6, 'Karolina', 'Lewandowska', 'ul. Leœna 9, 00-006 Warszawa', '222333444'),
(7, 'Kamil', 'Wójcik', 'ul. Parkowa 2, 00-007 Warszawa', '555666777'),
(8, 'Ewa', 'Kowalczyk', 'ul. Zielona 4, 00-008 Warszawa', '888999000'),
(9, 'Marcin', 'Kamiñski', 'ul. Morska 6, 00-009 Warszawa', '333444555'),
(10, 'Natalia', 'Zieliñska', 'ul. Polna 8, 00-010 Warszawa', '666777888');

--Wype³nienie tabeli ksiegowosc.godziny
INSERT INTO ksiegowosc2.godziny2 (id_godziny, data, liczba_godzin, id_pracownika)
VALUES
(1, '2024-04-01', 8, 1),
(2, '2024-04-02', 7, 2),
(3, '2024-04-03', 6, 3),
(4, '2024-04-04', 8, 4),
(5, '2024-04-05', 7, 5),
(6, '2024-04-06', 6, 6),
(7, '2024-04-07', 8, 7),
(8, '2024-04-08', 7, 8),
(9, '2024-04-09', 6, 9),
(10, '2024-04-10', 8, 10);

--Wype³nienie tabeli ksiegowosc.pensja
INSERT INTO ksiegowosc2.pensja (id_pensji, stanowisko, kwota)
VALUES
(1, 'Ksiêgowy', 5000.00),
(2, 'Specjalista ds. Finansowych', 6000.00),
(3, 'Analityk Finansowy', 6500.00),
(4, 'Kierownik Dzia³u Finansowego', 7500.00),
(5, 'Dyrektor Finansowy', 10000.00),
(6, 'Asystent Ksiêgowego', 4000.00),
(7, 'Praktykant', 2000.00),
(8, 'Specjalista ds. Podatkowych', 7000.00),
(9, 'Auditor', 8000.00),
(10, 'Koordynator Finansowy', 7000.00);

--Wype³nienie tabeli ksiegowosc.premia
INSERT INTO ksiegowosc2.premia (id_premii, rodzaj, kwota)
VALUES
(1, 'Premia roczna', 1000.00),
(2, 'Premia kwartalna', 500.00),
(3, 'Premia za wydajnoœæ', 800.00),
(4, 'Premia za specjalne osi¹gniêcia', 1200.00),
(5, 'Premia za dobry wynik sprzeda¿y', 1500.00),
(6, 'Premia za osi¹gniêcie celów', 900.00),
(7, 'Premia za zdobycie nowego klienta', 700.00),
(8, 'Premia za sta¿ pracy', 300.00),
(9, 'Premia motywacyjna', 600.00),
(10, 'Premia za udzia³ w projekcie', 1000.00);

--Wype³nienie tabeli ksiegowosc.wynagrodzenia
INSERT INTO ksiegowosc2.wynagrodzenia2 (id_wynagrodzenia, data, id_pracownika, id_godziny, id_pensji, id_premii)
VALUES
(1, '2024-04-01', 1, 1, 1, 1),
(2, '2024-04-02', 2, 2, 2, 2),
(3, '2024-04-03', 3, 3, 3, NULL),
(4, '2024-04-04', 4, 4, 4, 4),
(5, '2024-04-05', 5, 5, 5, 5),
(6, '2024-04-06', 6, 6, 6, 6),
(7, '2024-04-07', 7, 7, 7, NULL),
(8, '2024-04-08', 8, 8, 8, 8),
(9, '2024-04-09', 9, 9, 9, NULL),
(10, '2024-04-10', 10, 10, 10, 10);


--a
UPDATE ksiegowosc2.pracownicy
SET telefon = CONCAT('(+48) ', telefon);
--funkcja CONCAT ³¹czy wiele ci¹gów znaków w jeden; tu: prefiks z istniej¹cym numerem

SELECT *
FROM ksiegowosc2.pracownicy

--b
ALTER TABLE ksiegowosc2.pracownicy
ALTER COLUMN telefon VARCHAR(20)
/*nale¿y zaktualizowaæ iloœæ znaków w kolumnie telefon poniewa¿ po dodaniu wszystkich edycji
ci¹g znaków jest d³u¿szy ni¿ 15 znaków ustawionych pierwotnie*/
UPDATE ksiegowosc2.pracownicy
SET telefon = CONCAT(
SUBSTRING(telefon, 1, 9), '-', 
SUBSTRING(telefon, 10, 3), '-',
SUBSTRING(telefon, 13, 3));

--c
SELECT TOP 1 *, UPPER(nazwisko) AS NAZWISKO
FROM ksiegowosc2.pracownicy
ORDER BY LEN(nazwisko) DESC;

--d
SELECT pra.imie, pra.nazwisko, HASHBYTES('MD5', CONVERT(VARCHAR, pen.kwota)) AS pensja_md5
--w algorytmie MD5 konieczna jest konwersja kwoty na varchar w celu poprawnego wyœwietlenia wyniku
FROM ksiegowosc2.pracownicy pra
JOIN ksiegowosc2.wynagrodzenia2 w ON w.id_pracownika=pra.id_pracownika
JOIN ksiegowosc2.pensja pen ON pen.id_pensji = w.id_pensji

--e 
SELECT pra.imie, pra.nazwisko, pen.kwota AS pensja, pre.kwota AS premia
FROM ksiegowosc2.pracownicy pra
LEFT JOIN ksiegowosc2.wynagrodzenia2 w ON pra.id_pracownika = w.id_pracownika
LEFT JOIN ksiegowosc2.pensja pen ON w.id_pensji = pen.id_pensji
LEFT JOIN ksiegowosc2.premia pre ON w.id_premii = pre.id_premii


--f
SELECT 
CONCAT('Pracownik ', pra.imie,' ',pra.nazwisko,', w dniu ', g.data, ' otrzyma³ pensjê ca³kowit¹ na kwotê ', 
(pen.kwota+pre.kwota),' z³, gdzie wynagrodzenie zasadnicze wynosi³o: ',pen.kwota, ' z³, premia: ',pre.kwota,
' z³, nadgodziny: ',((g.liczba_godzin * 20) - 150), 'godz.')
AS raport
FROM ksiegowosc2.pracownicy pra
JOIN ksiegowosc2.wynagrodzenia2 w ON pra.id_pracownika = w.id_pracownika
JOIN ksiegowosc2.godziny2 g ON g.id_godziny=w.id_godziny
JOIN ksiegowosc2.pensja pen ON pen.id_pensji=w.id_pensji
JOIN ksiegowosc2.premia pre ON pre.id_premii=w.id_premii

