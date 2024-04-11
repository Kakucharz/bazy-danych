--WYPE£NIANIE TABEL REKORDAMI

INSERT INTO rozliczenia.pracownicy (id_pracownika, imie, nazwisko, adres, telefon)
VALUES
(1, 'Jan', 'Kowalski', 'ul. Kwiatowa 1, Warszawa', '+48 123 456 789'),
(2, 'Anna', 'Nowak', 'ul. S³oneczna 5, Kraków', '+48 987 654 321'),
(3, 'Piotr', 'Wiœniewski', 'ul. Polna 10, Wroc³aw', '+48 111 222 333'),
(4, 'Maria', 'Lis', 'ul. Leœna 3, Poznañ', '+48 555 666 777'),
(5, 'Andrzej', 'Kowalczyk', 'ul. Morska 7, Gdañsk', '+48 999 888 777'),
(6, 'Katarzyna', 'Zaj¹c', 'ul. Lipowa 12, Szczecin', '+48 777 888 999'),
(7, 'Tomasz', 'D¹browski', 'ul. Rycerska 8, £ódŸ', '+48 333 444 555'),
(8, 'Ewa', 'Kaczmarek', 'ul. Zielona 4, Lublin', '+48 666 555 444'),
(9, 'Marek', 'Wojciechowski', 'ul. D³uga 15, Katowice', '+48 222 111 000'),
(10, 'Karolina', 'Szymañska', 'ul. Ogrodowa 9, Bia³ystok', '+48 999 888 777')

INSERT INTO rozliczenia.godziny (id_godziny, data, liczba_godzin, id_pracownika)
VALUES
(1, '2024-04-01', 8, 1),
(2, '2024-04-02', 7, 2),
(3, '2024-04-03', 9, 3),
(4, '2024-04-04', 8, 4),
(5, '2024-04-05', 8, 5),
(6, '2024-04-06', 7, 6),
(7, '2024-04-07', 9, 7),
(8, '2024-04-08', 8, 8),
(9, '2024-04-09', 7, 9),
(10, '2024-04-10', 9, 10)

INSERT INTO rozliczenia.premie (id_premii, rodzaj, kwota)
VALUES
(1, 'Premia za wyniki', 500.00),
(2, 'Premia roczna', 1000.00),
(3, 'Premia kwartalna', 750.00),
(4, 'Premia motywacyjna', 600.00),
(5, 'Premia specjalna', 1200.00),
(6, 'Premia za nadgodziny', 300.00),
(7, 'Premia za osi¹gniêcia', 800.00),
(8, 'Premia za sta¿', 400.00),
(9, 'Premia za rekordy sprzeda¿y', 900.00),
(10, 'Premia za innowacje', 700.00)

INSERT INTO rozliczenia.pensje (id_pensji, stanowisko, kwota, id_premii)
VALUES
(1, 'Manager', 5000.00, 1),
(2, 'Specjalista ds. IT', 4000.00, 2),
(3, 'Ksiêgowy', 3500.00, 3),
(4, 'Pracownik produkcji', 3000.00, 1),
(5, 'Administrator', 3800.00, 2),
(6, 'Analityk finansowy', 4500.00, 3),
(7, 'Sprzedawca', 2800.00, 1),
(8, 'In¿ynier', 4200.00, 4),
(9, 'Recepcjonista', 3200.00, 3),
(10, 'Specjalista ds. HR', 3900.00, 5);