--1. Utwórz now¹ bazê danych nazywaj¹c j¹ firma.

CREATE DATABASE firma;
USE firma;

--2. Dodaj nowy schemat o nazwie rozliczenia.

CREATE SCHEMA rozliczenia;

--3. Dodaj schematu rozliczenia dodaj cztery tabele:

CREATE TABLE rozliczenia.pracownicy(
	id_pracownika INTEGER PRIMARY KEY, 
	imie VARCHAR(50) NOT NULL, 
	nazwisko VARCHAR(50) NOT NULL, 
	adres VARCHAR(50), 
	telefon INTEGER);

CREATE TABLE rozliczenia.godziny(
	id_godziny INTEGER PRIMARY KEY, 
	data DATE, 
	liczba_godzin INTEGER, 
	id_pracownika INTEGER NOT NULL);

CREATE TABLE rozliczenia.pensje(
	id_pensji INTEGER PRIMARY KEY, 
	stanowisko VARCHAR(50), 
	kwota FLOAT NOT NULL, 
	id_premii INTEGER NOT NULL);

CREATE TABLE rozliczenia.premie(
	id_premii INTEGER PRIMARY KEY, 
	rodzaj VARCHAR(50), 
	kwota FLOAT);

ALTER TABLE rozliczenia.godziny ADD FOREIGN KEY (id_pracownika) REFERENCES rozliczenia.pracownicy (id_pracownika);
ALTER TABLE rozliczenia.pensje ADD FOREIGN KEY (id_premii) REFERENCES rozliczenia.premie (id_premii);

--4. Wype³nij ka¿d¹ tabelê 10. rekordami.

INSERT INTO rozliczenia.pracownicy VALUES (1, 'Anna', 'Kowalik', 'Ul.Stokrotna 3/5, 30-031 Kraków', 733904568);
INSERT INTO rozliczenia.pracownicy VALUES (2, 'Kamil', 'S³owacki', 'Ul.Laurowa 10/2, 30-033 Kraków', 745902564);
INSERT INTO rozliczenia.pracownicy VALUES (3, 'Joanna', 'S³oneczna', 'Ul.Ró¿ana 4/12, 32-020 Wieliczka', 983256031);
INSERT INTO rozliczenia.pracownicy VALUES (4, 'Marzena', 'Cicha', 'Ul.GoŸdzikowa 34/67, 32-031 Kraków', 678234155);
INSERT INTO rozliczenia.pracownicy VALUES (5, 'Henryk', 'Ogórek', 'Ul.Sezamowa 3a, 32-020 Wieliczka', 834902456);
INSERT INTO rozliczenia.pracownicy VALUES (6, 'Józef', 'Rzodkiewka', 'Ul.S³oneczna 2b, 34-400 Myœlenice', 683902345);
INSERT INTO rozliczenia.pracownicy VALUES (7, 'Kornelia', 'Gruszka', 'Ul.Paprykowa 6/7, 32-700 Bochnia', 745904764);
INSERT INTO rozliczenia.pracownicy VALUES (8, 'Jan', 'Drogi', 'Ul.Szampañska 9/12, 32-050 Skawina', 688908567);
INSERT INTO rozliczenia.pracownicy VALUES (9, 'Stanis³aw', 'Jaœmin', 'Ul.Fio³kowa 3f/15, 32-200 Miechów', 583964562);
INSERT INTO rozliczenia.pracownicy VALUES (10, 'Aniela', 'Sosnowska', 'Ul.Kminkowa 10, 43-100 Tychy', 694432568);

INSERT INTO rozliczenia.godziny VALUES (21, '2021-03-31', 164, 1);
INSERT INTO rozliczenia.godziny VALUES (22, '2021-03-31', 170, 2);
INSERT INTO rozliczenia.godziny VALUES (23, '2021-04-02', 167, 3);
INSERT INTO rozliczenia.godziny VALUES (24, '2021-03-31', 170, 4);
INSERT INTO rozliczenia.godziny VALUES (25, '2021-04-03', 170, 5);
INSERT INTO rozliczenia.godziny VALUES (26, '2021-03-31', 164, 6);
INSERT INTO rozliczenia.godziny VALUES (27, '2021-04-01', 150, 7);
INSERT INTO rozliczenia.godziny VALUES (28, '2021-04-02', 170, 8);
INSERT INTO rozliczenia.godziny VALUES (29, '2021-03-31', 170, 9);
INSERT INTO rozliczenia.godziny VALUES (30, '2021-04-01', 167, 10);

INSERT INTO rozliczenia.pensje VALUES (31, 'Administrator systemów IT', 6750, 41);
INSERT INTO rozliczenia.pensje VALUES (32, 'Analityk bankowy', 6080, 42);
INSERT INTO rozliczenia.pensje VALUES (33, 'Analityk bankowy', 6080, 43);
INSERT INTO rozliczenia.pensje VALUES (34, 'Analityk baz danych', 6100, 44);
INSERT INTO rozliczenia.pensje VALUES (35, 'Analityk do spraw IT', 7700, 45);
INSERT INTO rozliczenia.pensje VALUES (36, 'Analityk bankowy', 6080, 46);
INSERT INTO rozliczenia.pensje VALUES (37, 'Administrator systemów IT', 6750, 47);
INSERT INTO rozliczenia.pensje VALUES (38, 'Analityk do spraw IT', 7700, 48)
INSERT INTO rozliczenia.pensje VALUES (39, 'Analityk bankowy', 6080, 49);
INSERT INTO rozliczenia.pensje VALUES (40, 'Administrator systemów IT', 6750, 50);

INSERT INTO rozliczenia.premie VALUES (41, 'regulaminowa', 700);
INSERT INTO rozliczenia.premie VALUES (42, 'uznaniowa', 500);
INSERT INTO rozliczenia.premie VALUES (43, 'motywacyjna', 500);
INSERT INTO rozliczenia.premie VALUES (44, 'zadaniowa', 500);
INSERT INTO rozliczenia.premie VALUES (45, 'indywidualna', 1000);
INSERT INTO rozliczenia.premie VALUES (46, 'regulaminowa', 500);
INSERT INTO rozliczenia.premie VALUES (47, 'motywacyjna', 700);
INSERT INTO rozliczenia.premie VALUES (48, 'regulaminowa', 1000);
INSERT INTO rozliczenia.premie VALUES (49, 'uznaniowa', 500);
INSERT INTO rozliczenia.premie VALUES (50, 'uznaniowa', 700);

-- 5. Za pomoc¹ zapytania SQL wyœwietl nazwiska pracowników i ich adresy.

SELECT nazwisko, adres
FROM rozliczenia.pracownicy;

-- 6. Napisz zapytanie, które przekonwertuje datê w tabeli godziny tak, aby wyœwietlana by³a 
--informacja jaki to dzieñ tygodnia i jaki miesi¹c

SELECT DATEPART(day, data) AS dzieñ, DATEPART(month, data) AS miesi¹c
FROM rozliczenia.godziny;

-- 7.W tabeli pensje zmieñ nazwê atrybutu kwota na kwota_brutto oraz dodaj nowy o nazwie 
--kwota_netto. Oblicz kwotê netto i zaktualizuj wartoœci w tabeli

EXEC sp_rename 'rozliczenia.pensje.kwota' ,'kwota_brutto', 'COLUMN';

ALTER TABLE rozliczenia.pensje ADD kwota_netto FLOAT;

UPDATE rozliczenia.pensje SET kwota_netto = kwota_brutto - (0.19 * kwota_brutto);

--SELECT * FROM rozliczenia.pensje;

