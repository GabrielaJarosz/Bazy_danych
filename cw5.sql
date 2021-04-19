--1. Utwórz now¹ bazê danych nazywaj¹c j¹ firma. 

CREATE DATABASE firma;
USE firma;

--2. Dodaj nowy schemat o nazwie ksiegowosc.

CREATE SCHEMA ksiegowosc;

--3. Dodaj tabele:

CREATE TABLE ksiegowosc.pracownicy(
	id_pracownika INTEGER PRIMARY KEY, 
	imie VARCHAR(50) NOT NULL, 
	nazwisko VARCHAR(50) NOT NULL, 
	adres VARCHAR(50), 
	telefon VARCHAR(12) CHECK(LEN(telefon) >= 9 ));
    
CREATE TABLE ksiegowosc.godziny(
	id_godziny INTEGER PRIMARY KEY, 
	data DATE, 
	liczba_godzin INTEGER, 
	id_pracownika INTEGER NOT NULL);

CREATE TABLE ksiegowosc.pensje(
	id_pensji INTEGER PRIMARY KEY, 
	stanowisko VARCHAR(30), 
	kwota FLOAT NOT NULL, 
	id_premii INTEGER NOT NULL);

CREATE TABLE ksiegowosc.premie(
	id_premii INTEGER PRIMARY KEY, 
	rodzaj VARCHAR(30), 
	kwota FLOAT);

CREATE TABLE ksiegowosc.wynagrodzenie(
	id_wynagrodzenia INTEGER PRIMARY KEY,
	data DATE,
	id_pracownika INTEGER NOT NULL,
	id_godziny INTEGER NOT NULL,
	id_pensji INTEGER NOT NULL,
	id_premii INTEGER NOT NULL);

ALTER TABLE ksiegowosc.godziny ADD FOREIGN KEY (id_pracownika) REFERENCES ksiegowosc.pracownicy (id_pracownika);
ALTER TABLE ksiegowosc.pensje ADD FOREIGN KEY (id_premii) REFERENCES ksiegowosc.premie (id_premii);
ALTER TABLE ksiegowosc.wynagrodzenie ADD FOREIGN KEY (id_pracownika ) REFERENCES ksiegowosc.pracownicy (id_pracownika);
ALTER TABLE ksiegowosc.wynagrodzenie ADD FOREIGN KEY (id_premii ) REFERENCES ksiegowosc.premie (id_premii);
ALTER TABLE ksiegowosc.wynagrodzenie ADD FOREIGN KEY (id_godziny ) REFERENCES ksiegowosc.godziny (id_godziny);
ALTER TABLE ksiegowosc.wynagrodzenie ADD FOREIGN KEY (id_pensji ) REFERENCES ksiegowosc.pensje (id_pensji);


--4. Wype³nij ka¿d¹ tabelê 10. rekordami.

INSERT INTO ksiegowosc.pracownicy VALUES (1, 'Anna', 'Kowalik', 'Ul.Stokrotna 3/5, 30-031 Kraków', 733904568);
INSERT INTO ksiegowosc.pracownicy VALUES (2, 'Kamil', 'S³owacki', 'Ul.Laurowa 10/2, 30-033 Kraków', 745902564);
INSERT INTO ksiegowosc.pracownicy VALUES (3, 'Joanna', 'S³oneczna', 'Ul.Ró¿ana 4/12, 32-020 Wieliczka', 983256031);
INSERT INTO ksiegowosc.pracownicy VALUES (4, 'Marzena', 'Cicha', 'Ul.GoŸdzikowa 34/67, 32-031 Kraków', 678234155);
INSERT INTO ksiegowosc.pracownicy VALUES (5, 'Henryk', 'Ogórek', 'Ul.Sezamowa 3a, 32-020 Wieliczka', 834902456);
INSERT INTO ksiegowosc.pracownicy VALUES (6, 'Józef', 'Rzodkiewka', 'Ul.S³oneczna 2b, 34-400 Myœlenice', 683902345);
INSERT INTO ksiegowosc.pracownicy VALUES (7, 'Kornelia', 'Gruszka', 'Ul.Paprykowa 6/7, 32-700 Bochnia', 745904764);
INSERT INTO ksiegowosc.pracownicy VALUES (8, 'Jan', 'Drogi', 'Ul.Szampañska 9/12, 32-050 Skawina', 688908567);
INSERT INTO ksiegowosc.pracownicy VALUES (9, 'Stanis³aw', 'Jaœmin', 'Ul.Fio³kowa 3f/15, 32-200 Miechów', 583964562);
INSERT INTO ksiegowosc.pracownicy VALUES (10, 'Aniela', 'Sosnowska', 'Ul.Kminkowa 10, 43-100 Tychy', 694432568);


--OPIS TABELI / KOMENTARZ

	EXEC sys.sp_addextendedproperty 
	@name=N'Komentarz_1',
	@value=N'Tabela zawiera informacje o pracownikach.',
	@level0type=N'SCHEMA',  @level0name = 'ksiegowosc', 
    @level1type=N'TABLE', @level1name = 'pracownicy';
	GO

--SELECT * FROM ksiegowosc.pracownicy


INSERT INTO ksiegowosc.godziny VALUES (21, '2021-03-31', 164, 1);
INSERT INTO ksiegowosc.godziny VALUES (22, '2021-03-31', 170, 2);
INSERT INTO ksiegowosc.godziny VALUES (23, '2021-04-02', 167, 3);
INSERT INTO ksiegowosc.godziny VALUES (24, '2021-03-31', 170, 4);
INSERT INTO ksiegowosc.godziny VALUES (25, '2021-04-03', 170, 5);
INSERT INTO ksiegowosc.godziny VALUES (26, '2021-03-31', 164, 6);
INSERT INTO ksiegowosc.godziny VALUES (27, '2021-04-01', 150, 7);
INSERT INTO ksiegowosc.godziny VALUES (28, '2021-04-02', 170, 8);
INSERT INTO ksiegowosc.godziny VALUES (29, '2021-03-31', 170, 9);
INSERT INTO ksiegowosc.godziny VALUES (30, '2021-04-01', 167, 10);

--OPIS TABELI / KOMENTARZ

	EXEC sys.sp_addextendedproperty 
	@name=N'Komentarz_1',
	@value=N'Tabela zawiera informacje o iloœci przepracowanych godzin.',
	@level0type=N'SCHEMA',  @level0name = 'ksiegowosc', 
    @level1type=N'TABLE', @level1name = 'godziny';
	GO

--SELECT * FROM ksiegowosc.godziny

INSERT INTO ksiegowosc.pensje VALUES (31, 'Administrator systemów IT', 6750, 41);
INSERT INTO ksiegowosc.pensje VALUES (32, 'Analityk bankowy', 6080, 42);
INSERT INTO ksiegowosc.pensje VALUES (33, 'Analityk bankowy', 6080, 43);
INSERT INTO ksiegowosc.pensje VALUES (34, 'Analityk baz danych', 6100, 44);
INSERT INTO ksiegowosc.pensje VALUES (35, 'Analityk do spraw IT', 7700, 45);
INSERT INTO ksiegowosc.pensje VALUES (36, 'Analityk bankowy', 6080, 46);
INSERT INTO ksiegowosc.pensje VALUES (37, 'Administrator systemów IT', 6750, 47);
INSERT INTO ksiegowosc.pensje VALUES (38, 'Analityk do spraw IT', 7700, 48)
INSERT INTO ksiegowosc.pensje VALUES (39, 'Analityk bankowy', 6080, 49);
INSERT INTO ksiegowosc.pensje VALUES (40, 'Administrator systemów IT', 6750, 50);

--OPIS TABELI / KOMENTARZ

	EXEC sys.sp_addextendedproperty 
	@name=N'Komentarz_1',
	@value=N'Tabela zawiera informacje o pensji pracowników.',
	@level0type=N'SCHEMA',  @level0name = 'ksiegowosc', 
    @level1type=N'TABLE', @level1name = 'pensje';
	GO

--SELECT * FROM ksiegowosc.pensje

INSERT INTO ksiegowosc.premie VALUES (41, 'regulaminowa', 700);
INSERT INTO ksiegowosc.premie VALUES (42, 'uznaniowa', 500);
INSERT INTO ksiegowosc.premie VALUES (43, 'motywacyjna', 500);
INSERT INTO ksiegowosc.premie VALUES (44, NULL, NULL);
INSERT INTO ksiegowosc.premie VALUES (45, 'indywidualna', 1000);
INSERT INTO ksiegowosc.premie VALUES (46, 'regulaminowa', 500);
INSERT INTO ksiegowosc.premie VALUES (47, 'motywacyjna', 700);
INSERT INTO ksiegowosc.premie VALUES (48, 'regulaminowa', 1000);
INSERT INTO ksiegowosc.premie VALUES (49, 'uznaniowa', 500);
INSERT INTO ksiegowosc.premie VALUES (50, NULL, NULL);

--OPIS TABELI / KOMENTARZ

	EXEC sys.sp_addextendedproperty 
	@name=N'Komentarz_1',
	@value=N'Tabela zawiera informacje o premii pracowników.',
	@level0type=N'SCHEMA',  @level0name = 'ksiegowosc', 
    @level1type=N'TABLE', @level1name = 'premie';
	GO

--SELECT * FROM ksiegowosc.premie

INSERT INTO ksiegowosc.wynagrodzenie VALUES (51, '2021-04-29', 1, 21, 31, 41);
INSERT INTO ksiegowosc.wynagrodzenie VALUES (52, '2021-04-28', 2, 22, 32, 42);
INSERT INTO ksiegowosc.wynagrodzenie VALUES (53, '2021-04-28', 3, 23, 33, 43);
INSERT INTO ksiegowosc.wynagrodzenie VALUES (54, '2021-04-29', 4, 24, 34, 44);
INSERT INTO ksiegowosc.wynagrodzenie VALUES (55, '2021-04-27', 5, 25, 35, 45);
INSERT INTO ksiegowosc.wynagrodzenie VALUES (56, '2021-04-29', 6, 26, 36, 46);
INSERT INTO ksiegowosc.wynagrodzenie VALUES (57, '2021-04-29', 7, 27, 37, 47);
INSERT INTO ksiegowosc.wynagrodzenie VALUES (58, '2021-04-29', 8, 28, 38, 48);
INSERT INTO ksiegowosc.wynagrodzenie VALUES (59, '2021-04-29', 9, 29, 39, 49);
INSERT INTO ksiegowosc.wynagrodzenie VALUES (60, '2021-04-27', 10, 30, 40, 50);

--OPIS TABELI / KOMENTARZ

	EXEC sys.sp_addextendedproperty 
	@name=N'Komentarz_1',
	@value=N'Tabela ³¹cz¹ca informacje o wynagrodzeniach pracowników.',
	@level0type=N'SCHEMA',  @level0name = 'ksiegowosc', 
    @level1type=N'TABLE', @level1name = 'wynagrodzenie';
	GO

--SELECT * FROM ksiegowosc.wynagrodzenie

-- 5. Wykonaj zapytania:

--a) Wyœwietl tylko id pracownika oraz jego nazwisko.

SELECT id_pracownika, nazwisko
FROM ksiegowosc.pracownicy;

--b) Wyœwietl id pracowników, których p³aca jest wiêksza ni¿ 1000.   

SELECT pracownicy.id_pracownika, pensje.kwota
FROM ksiegowosc.pracownicy JOIN (ksiegowosc.pensje JOIN ksiegowosc.wynagrodzenie ON pensje.id_pensji = wynagrodzenie.id_pensji) 
ON pracownicy.id_pracownika = wynagrodzenie.id_pracownika
WHERE pensje.kwota > 1000;

--c) Wyœwietl id pracowników nieposiadaj¹cych premii, których p³aca jest wiêksza ni¿ 2000.    

SELECT wynagrodzenie.id_pracownika, premie.kwota AS "kwota premii", pensje.kwota AS "kwota pensji"
FROM ksiegowosc.pensje JOIN (ksiegowosc.premie JOIN ksiegowosc.wynagrodzenie ON premie.id_premii = wynagrodzenie.id_premii)
ON pensje.id_pensji = wynagrodzenie.id_pensji
WHERE (premie.kwota IS NULL) AND pensje.kwota > 2000;

--d) Wyœwietl pracowników, których pierwsza litera imienia zaczyna siê na literê ‘J’.

SELECT * 
FROM ksiegowosc.pracownicy
WHERE pracownicy.imie LIKE 'J%';

--e) Wyœwietl pracowników, których nazwisko zawiera literê ‘n’ oraz imiê koñczy siê na literê ‘a’.

SELECT * 
FROM ksiegowosc.pracownicy
WHERE pracownicy.nazwisko LIKE '%n%' AND pracownicy.imie LIKE '%a';


--f) Wyœwietl imiê i nazwisko pracowników oraz liczbê ich nadgodzin, przyjmuj¹c, i¿ standardowy czas  
--pracy to 160 h miesiêcznie. 

SELECT pracownicy.imie, pracownicy.nazwisko, godziny.liczba_godzin-160 AS Nadgodziny
FROM ksiegowosc.pracownicy JOIN (ksiegowosc.godziny JOIN ksiegowosc.wynagrodzenie ON godziny.id_godziny = wynagrodzenie.id_godziny)
ON pracownicy.id_pracownika = wynagrodzenie.id_pracownika

--g) Wyœwietl imiê i nazwisko pracowników, których pensja zawiera siê w przedziale 1500 – 3000 PLN. 

SELECT pracownicy.imie, pracownicy.nazwisko, pensje.kwota AS pensja
FROM ksiegowosc.pracownicy JOIN (ksiegowosc.pensje JOIN ksiegowosc.wynagrodzenie ON pensje.id_pensji = wynagrodzenie.id_pensji)
ON pracownicy.id_pracownika = wynagrodzenie.id_pracownika
WHERE pensje.kwota BETWEEN 1500 AND 3000; --6080
--WHERE pensje.kwota > 1500 AND pensje.kwota < 3000;

--h) Wyœwietl imiê i nazwisko pracowników, którzy pracowali w nadgodzinach i nie otrzymali premii. 

SELECT pracownicy.imie, pracownicy.nazwisko, godziny.liczba_godzin-160 AS nadgodziny, premie.kwota AS premia
FROM ksiegowosc.premie JOIN (ksiegowosc.pracownicy JOIN (ksiegowosc.godziny join ksiegowosc.wynagrodzenie ON godziny.id_godziny = wynagrodzenie.id_godziny) 
ON pracownicy.id_pracownika = wynagrodzenie.id_pracownika) ON premie.id_premii = wynagrodzenie.id_premii
WHERE premie.kwota IS NULL;

--i) Uszereguj pracowników wed³ug pensji. 

SELECT pracownicy.id_pracownika, pracownicy.imie, pracownicy.nazwisko, pensje.kwota AS pensja
FROM ksiegowosc.pracownicy JOIN (ksiegowosc.pensje JOIN ksiegowosc.wynagrodzenie ON pensje.id_pensji = wynagrodzenie.id_pensji)
ON pracownicy.id_pracownika = wynagrodzenie.id_pracownika
ORDER BY pensje.kwota;

--j) Uszereguj pracowników wed³ug pensji i premii malej¹co.

SELECT pracownicy.id_pracownika, pracownicy.imie, pracownicy.nazwisko, pensje.kwota AS pensja, premie.kwota AS premia
FROM ksiegowosc.premie JOIN (ksiegowosc.pracownicy JOIN (ksiegowosc.pensje JOIN ksiegowosc.wynagrodzenie ON pensje.id_pensji = wynagrodzenie.id_pensji)
ON pracownicy.id_pracownika = wynagrodzenie.id_pracownika) 
ON premie.id_premii = wynagrodzenie.id_premii
ORDER BY pensje.kwota, premie.kwota DESC; 

--k) Zlicz i pogrupuj pracowników wed³ug pola ‘stanowisko’.

SELECT COUNT(pracownicy.imie) AS liczba_pracownikow, pensje.stanowisko
FROM ksiegowosc.pracownicy, ksiegowosc.pensje
GROUP BY pensje.stanowisko;

--l) Policz œredni¹, minimaln¹ i maksymaln¹ p³acê dla stanowiska ‘kierownik’ (je¿eli takiego nie masz, to  
--przyjmij dowolne inne).

SELECT MIN(pensje.kwota) AS min_placa, MAX(pensje.kwota) AS max_placa, AVG(pensje.kwota) AS srednia_placa, pensje.stanowisko
FROM ksiegowosc.pensje
GROUP BY pensje.stanowisko HAVING stanowisko = 'Analityk bankowy';

--m) Policz sumê wszystkich wynagrodzeñ.

SELECT SUM(pensje.id_pensji) AS suma_wynagrodzen
FROM ksiegowosc.pensje

--n) Policz sumê wynagrodzeñ w ramach danego stanowiska.                                

SELECT SUM(pensje.kwota) AS suma_wynagrodzen, pensje.stanowisko
FROM ksiegowosc.pensje 
GROUP BY pensje.stanowisko;

--o) Wyznacz liczbê premii przyznanych dla pracowników danego stanowiska.

SELECT COUNT(premie.id_premii) AS liczba_premii, pensje.stanowisko
FROM ksiegowosc.premie JOIN (ksiegowosc.pensje JOIN ksiegowosc.wynagrodzenie ON pensje.id_pensji = wynagrodzenie.id_pensji)
ON premie.id_premii = wynagrodzenie.id_premii
GROUP BY pensje.stanowisko

--p) Usuñ wszystkich pracowników maj¹cych pensjê mniejsz¹ ni¿ 1200 z³

SELECT *
FROM ksiegowosc.pensje, ksiegowosc.pracownicy
WHERE pensje.kwota < 1200
DELETE FROM ksiegowosc.pracownicy; -- delete mo¿e mieæ warunek usuwania



