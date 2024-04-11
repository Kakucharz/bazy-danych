USE firma
CREATE TABLE rozliczenia.pracownicy(
	id_pracownika INT NOT NULL PRIMARY KEY,
	imie VARCHAR(50) NOT NULL,
	nazwisko VARCHAR(50) NOT NULL,
	adres VARCHAR(120) NOT NULL,
	telefon VARCHAR(15) NOT NULL
)

CREATE TABLE rozliczenia.godziny(
	id_godziny INT NOT NULL PRIMARY KEY,
	data DATE NOT NULL,
	liczba_godzin INT NOT NULL,
	id_pracownika INT NOT NULL,
		FOREIGN KEY (id_pracownika)
		REFERENCES rozliczenia.pracownicy (id_pracownika)
		ON DELETE CASCADE ON UPDATE CASCADE
)

CREATE TABLE rozliczenia.premie(
	id_premii INT NOT NULL PRIMARY KEY,
	rodzaj VARCHAR(50) NOT NULL,
	kwota DECIMAL(10,2) NOT NULL
)

CREATE TABLE rozliczenia.pensje(
	id_pensji INT NOT NULL PRIMARY KEY,
	stanowisko VARCHAR(75) NOT NULL,
	kwota DECIMAL(10,2) NOT NULL,
	id_premii INT 
		FOREIGN KEY (id_premii) 
		REFERENCES rozliczenia.premie(id_premii)
);
