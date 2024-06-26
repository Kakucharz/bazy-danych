/*tabela stratygraficzna*/

CREATE SCHEMA strati;

CREATE TABLE strati.GeoEon (
	id_eon INTEGER NOT NULL PRIMARY KEY,
	nazwa_eon VARCHAR(50) NOT NULL);
	
CREATE TABLE strati.GeoEra (
	id_era INTEGER NOT NULL PRIMARY KEY,
	nazwa_era VARCHAR(50) NOT NULL,
	id_eon INTEGER NOT NULL);
	
CREATE TABLE strati.GeoOkres (
	id_okres INTEGER NOT NULL PRIMARY KEY,
	nazwa_okres VARCHAR(50) NOT NULL,
	id_era INTEGER NOT NULL);
	
CREATE TABLE strati.GeoEpoka (
	id_epoka INTEGER NOT NULL PRIMARY KEY,
	nazwa_epoka VARCHAR(50) NOT NULL,
	id_okres INTEGER NOT NULL
);
CREATE TABLE strati.GeoPietro (
	id_pietro INTEGER NOT NULL PRIMARY KEY,
	nazwa_pietro VARCHAR(50) NOT NULL,
	id_epoka INTEGER NOT NULL
);


INSERT INTO strati.GeoEon (id_eon, nazwa_eon) VALUES
(1, 'Fanerozoik');

INSERT INTO strati.GeoEra (id_era, nazwa_era, id_eon) VALUES
(1, 'Kenozoik', 1),
(2, 'Mezozoik', 1),
(3, 'Paleozoik', 1);

INSERT INTO strati.GeoOkres (id_okres, nazwa_okres, id_era) VALUES
(1, 'Czwartorzęd', 1),
(2, 'Neogen', 1),
(3, 'Paleogen', 1),
(4, 'Kreda', 2),
(5, 'Jura', 2),
(6, 'Trias', 2),
(7, 'Perm', 3),
(8, 'Karbon', 3),
(9, 'Dewon', 3),
(10, 'Sylur', 3),
(11, 'Ordowik', 3),
(12, 'Kambr', 3);

INSERT INTO strati.GeoEpoka (id_epoka, nazwa_epoka, id_okres) VALUES
(1, 'Holocen', 1),
(2, 'Plejstocen', 1),
(3, 'Pliocen', 2),
(4, 'Miocen', 2),
(5, 'Oligocen', 3),
(6, 'Eocen', 3),
(7, 'Paleocen', 3),
(8, 'Górna Kreda', 4),
(9, 'Dolna Kreda', 4),
(10, 'Górna Jura', 5),
(11, 'Środkowa Jura', 5),
(12, 'Dolna Jura', 5),
(13, 'Górny Trias', 6),
(14, 'Środkowy Trias', 6),
(15, 'Dolny Trias', 6),
(16, 'Górny Perm', 7),
(17, 'Dolny Perm', 7),
(18, 'Górny Karbon', 8),
(19, 'Dolny Karbon', 8),
(20, 'Górny Dewon', 9),
(21, 'Środkowy Dewon', 9),
(22, 'Dolny Dewon', 9),
(23, 'Przydol', 10),
(24, 'Ludlow', 10),
(25, 'Wenlok', 10),
(26, 'Landower', 10),
(27, 'Górny Ordowik', 11),
(28, 'Środkowy Ordowik', 11),
(29, 'Dolny Ordowik', 11),
(30, 'Furong', 12),
(31, 'Epoka 3', 12),
(32, 'Epoka 2', 12),
(33, 'Terrenew', 12);

INSERT INTO strati.GeoPietro (id_pietro, nazwa_pietro, id_epoka) VALUES
(1, 'Tarant', 1),
(2, 'Ion', 2),
(3, 'Kalabr', 2),
(4, 'Gelas', 2),
(5, 'Piacent', 3),
(6, 'Zankl', 3),
(7, 'Messyn', 4),
(8, 'Torton', 4),
(9, 'Serrawal', 4),
(10, 'Lang', 4),
(11, 'Burdyga', 4),
(12, 'Akwitan', 4),
(13, 'Szat', 5),
(14, 'Rupel', 5),
(15, 'Priabon', 6),
(16, 'Barton', 6),
(17, 'Lutet', 6),
(18, 'Ipres', 6),
(19, 'Tanet', 7),
(20, 'Zeland', 7),
(21, 'Dan', 7),
(22, 'Mastrycht', 8),
(23, 'Kampan', 8),
(24, 'Santon', 8),
(25, 'Koniak', 8),
(26, 'Turon', 8),
(27, 'Cenoman', 8),
(28, 'Alb', 9),
(29, 'Apt', 9),
(30, 'Barrem', 9),
(31, 'Hoteryw', 9),
(32, 'Walanzyn', 9),
(33, 'Berrias', 9),
(34, 'Tyton', 10),
(35, 'Kimeryd', 10),
(36, 'oksford', 10),
(37, 'Kelowej', 11),
(38, 'Baton', 11),
(39, 'Bajos', 11),
(40, 'Aalen', 11),
(41, 'Toark', 12),
(42, 'Pliensbach', 12),
(43, 'Synemur', 12),
(44, 'Hetang', 12),
(45, 'Retyk', 13),
(46, 'Noryk', 13),
(47, 'Karnik', 13),
(48, 'Ladyn', 14),
(49, 'Anizyk', 14),
(50, 'Olenek', 15),
(51, 'Ind', 15),
(52, 'Czangsing', 16),
(53, 'Wucziaping', 16),
(54, 'Kapitan', 16),
(55, 'Word', 16),
(56, 'Road', 16),
(57, 'Kungur', 17),
(58, 'Artinsk', 17),
(59, 'Sakmar', 17),
(60, 'Assel', 17),
(61, 'Gzel', 18),
(62, 'Kasimow', 18),
(63, 'Moskow', 18),
(64, 'Baszkir', 18),
(65, 'Serpuchow', 19),
(66, 'Wizen', 19),
(67, 'Turnej', 19),
(68, 'Famen', 20),
(69, 'Fran', 20),
(70, 'Zywet', 21),
(71, 'Eifel', 21),
(72, 'Ems', 22),
(73, 'Prag', 22),
(74, 'Lochkow', 22),
(75, 'Przydol', 23),
(76, 'Ludfort', 24),
(77, 'Gorst', 24),
(78, 'Homer', 25),
(79, 'Sheinwood', 25),
(80, 'Telych', 26),
(81, 'Aeron', 26),
(82, 'Rhuddan', 26),
(83, 'Hirnant', 27),
(84, 'Kat', 27),
(85, 'Snadb', 27),
(86, 'Darriwil', 28),
(87, 'Daping', 28),
(88, 'Floian', 29),
(89, 'Tremadok', 29),
(90, 'Wiek 10', 30),
(91, 'Jiangshan', 30),
(92, 'Paib', 30),
(93, 'Guzhang', 31),
(94, 'Drum', 31),
(95, 'Wiek 5', 31),
(96, 'Wiek 4', 32),
(97, 'Wiek 3', 32),
(98, 'Wiek 2', 33),
(99, 'Fortun', 33);
	
	
SELECT * FROM strati.GeoPietro

/*tabela zdenormalizowana*/
	CREATE TABLE GeoTabela AS
    (SELECT * FROM strati.GeoPietro
	NATURAL JOIN strati.GeoEpoka 
	NATURAL JOIN strati.GeoOkres 
	NATURAL JOIN strati.GeoEra 
	NATURAL JOIN strati.GeoEon);

SELECT * FROM GeoTabela;


/*milion*/	
CREATE TABLE Dziesiec (
	cyfra int,
	bit int
	);

INSERT INTO Dziesiec (cyfra, bit)
VALUES
    (0, 0),
    (1, 1),
    (2, 1),
    (3, 0),
    (4, 1),
    (5, 0),
    (6, 1),
    (7, 0),
    (8, 1),
    (9, 0);

CREATE TABLE Milion (
    liczba int,
    cyfra int,
    bit int
);

INSERT INTO Milion (liczba, cyfra, bit)
SELECT 
    a1.cyfra + 10 * a2.cyfra + 100 * a3.cyfra + 1000 * a4.cyfra + 10000 * a5.cyfra + 100000 * a6.cyfra AS liczba,
    a1.cyfra AS cyfra,
    a1.bit AS bit
FROM 
    Dziesiec a1, 
    Dziesiec a2, 
    Dziesiec a3, 
    Dziesiec a4, 
    Dziesiec a5, 
    Dziesiec a6;


/*Z1*/
SELECT COUNT(*) FROM Milion
    INNER JOIN GeoTabela ON (mod(Milion.liczba,99)=(GeoTabela.id_pietro));


/*Z2*/
SELECT COUNT(*) FROM Milion 
	INNER JOIN strati.GeoPietro ON (mod(Milion.liczba,99)=GeoPietro.id_pietro) 
	NATURAL JOIN strati.GeoEpoka 
	NATURAL JOIN strati.GeoOkres 
	NATURAL JOIN strati.GeoEra 
	NATURAL JOIN strati.GeoEon;


/*Z3*/
SELECT COUNT(*) FROM Milion
	WHERE mod(Milion.liczba,99) = 
	(SELECT id_pietro FROM GeoTabela
	WHERE mod(Milion.liczba,99)=(id_pietro));

/*Z4*/
SELECT COUNT(*)
	FROM Milion 
	WHERE mod(Milion.liczba,99)=
(SELECT strati.GeoPietro.id_pietro 
	FROM strati.GeoPietro 
	NATURAL JOIN strati.GeoEpoka 
	NATURAL JOIN strati.GeoOkres 
	NATURAL JOIN strati.GeoEra 
	NATURAL JOIN strati.GeoEon);

/*indeksowanie*/
CREATE INDEX indxEon ON strati.GeoEon(id_eon);
CREATE INDEX indxEra ON strati.GeoEra(id_era, id_eon);
CREATE INDEX indxOkres ON strati.GeoOkres(id_okres, id_era);
CREATE INDEX indxEpoka ON strati.GeoEpoka(id_epoka, id_okres);
CREATE INDEX indxPietro ON strati.GeoPietro(id_pietro, id_epoka);
CREATE INDEX indxMilion ON Milion(liczba);
CREATE INDEX indxGeoTabela ON GeoTabela(id_pietro, id_epoka, id_era, id_okres,id_eon);

DROP INDEX strati.indxEon;
DROP INDEX strati.indxEra;
DROP INDEX strati.indxOkres;
DROP INDEX strati.indxEpoka;
DROP INDEX strati.indxPietro;
DROP INDEX indxMilion;
DROP INDEX indxGeoTabela;
