--1. Utw�rz now� baz� danych nazywaj�c j� firma.

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

--4. Wype�nij ka�d� tabel� 10. rekordami.

INSERT INTO rozliczenia.pracownicy VALUES (1, 'Anna', 'Kowalik', 'Ul.Stokrotna 3/5, 30-031 Krak�w', 733904568);
INSERT INTO rozliczenia.pracownicy VALUES (2, 'Kamil', 'S�owacki', 'Ul.Laurowa 10/2, 30-033 Krak�w', 745902564);
INSERT INTO rozliczenia.pracownicy VALUES (3, 'Joanna', 'S�oneczna', 'Ul.R�ana 4/12, 32-020 Wieliczka', 983256031);
INSERT INTO rozliczenia.pracownicy VALUES (4, 'Marzena', 'Cicha', 'Ul.Go�dzikowa 34/67, 32-031 Krak�w', 678234155);
INSERT INTO rozliczenia.pracownicy VALUES (5, 'Henryk', 'Og�rek', 'Ul.Sezamowa 3a, 32-020 Wieliczka', 834902456);
INSERT INTO rozliczenia.pracownicy VALUES (6, 'J�zef', 'Rzodkiewka', 'Ul.S�oneczna 2b, 34-400 My�lenice', 683902345);
INSERT INTO rozliczenia.pracownicy VALUES (7, 'Kornelia', 'Gruszka', 'Ul.Paprykowa 6/7, 32-700 Bochnia', 745904764);
INSERT INTO rozliczenia.pracownicy VALUES (8, 'Jan', 'Drogi', 'Ul.Szampa�ska 9/12, 32-050 Skawina', 688908567);
INSERT INTO rozliczenia.pracownicy VALUES (9, 'Stanis�aw', 'Ja�min', 'Ul.Fio�kowa 3f/15, 32-200 Miech�w', 583964562);
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

INSERT INTO rozliczenia.pensje VALUES (31, 'Administrator system�w IT', 6750, 41);
INSERT INTO rozliczenia.pensje VALUES (32, 'Analityk bankowy', 6080, 42);
INSERT INTO rozliczenia.pensje VALUES (33, 'Analityk bankowy', 6080, 43);
INSERT INTO rozliczenia.pensje VALUES (34, 'Analityk baz danych', 6100, 44);
INSERT INTO rozliczenia.pensje VALUES (35, 'Analityk do spraw IT', 7700, 45);
INSERT INTO rozliczenia.pensje VALUES (36, 'Analityk bankowy', 6080, 46);
INSERT INTO rozliczenia.pensje VALUES (37, 'Administrator system�w IT', 6750, 47);
INSERT INTO rozliczenia.pensje VALUES (38, 'Analityk do spraw IT', 7700, 48)
INSERT INTO rozliczenia.pensje VALUES (39, 'Analityk bankowy', 6080, 49);
INSERT INTO rozliczenia.pensje VALUES (40, 'Administrator system�w IT', 6750, 50);

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

-- 5. Za pomoc� zapytania SQL wy�wietl nazwiska pracownik�w i ich adresy.

SELECT nazwisko, adres
FROM rozliczenia.pracownicy;

-- 6. Napisz zapytanie, kt�re przekonwertuje dat� w tabeli godziny tak, aby wy�wietlana by�a 
--informacja jaki to dzie� tygodnia i jaki miesi�c

SELECT DATEPART(day, data) AS dzie�, DATEPART(month, data) AS miesi�c
FROM rozliczenia.godziny;

-- 7.W tabeli pensje zmie� nazw� atrybutu kwota na kwota_brutto oraz dodaj nowy o nazwie 
--kwota_netto. Oblicz kwot� netto i zaktualizuj warto�ci w tabeli

EXEC sp_rename 'rozliczenia.pensje.kwota' ,'kwota_brutto', 'COLUMN';

ALTER TABLE rozliczenia.pensje ADD kwota_netto FLOAT;

UPDATE rozliczenia.pensje SET kwota_netto = kwota_brutto - (0.19 * kwota_brutto);

--SELECT * FROM rozliczenia.pensje;

