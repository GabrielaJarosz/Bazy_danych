CREATE TABLE GeoEon(
	id_eon INTEGER PRIMARY KEY,
	nazwa_eon VARCHAR(30));

CREATE TABLE GeoEra(
	id_era INTEGER PRIMARY KEY,
	id_eon INTEGER,
	nazwa_era VARCHAR(30));

CREATE TABLE GeoOkres(
	id_okres INTEGER PRIMARY KEY,
	id_era INTEGER,
	nazwa_okres VARCHAR(30)); 

CREATE TABLE GeoEpoka(
	id_epoka INTEGER PRIMARY KEY,
	id_okres INTEGER,
	nazwa_epoka VARCHAR(30)); 

CREATE TABLE GeoPietro(
	id_pietro INTEGER PRIMARY KEY,
	id_epoka INTEGER,
	nazwa_pietro VARCHAR(30)); 

ALTER TABLE GeoEra ADD FOREIGN KEY (id_eon) REFERENCES GeoEon (id_eon);
ALTER TABLE GeoOkres ADD FOREIGN KEY (id_era) REFERENCES GeoEra (id_era);
ALTER TABLE GeoEpoka ADD FOREIGN KEY (id_okres) REFERENCES GeoOkres (id_okres);
ALTER TABLE GeoPietro ADD FOREIGN KEY (id_epoka) REFERENCES GeoEpoka (id_epoka);

INSERT INTO GeoEon VALUES (1, 'FANEROZOIK');

INSERT INTO GeoEra VALUES (1, 1, 'Kenozoik');
INSERT INTO GeoEra VALUES (2, 1, 'Mezozoik');
INSERT INTO GeoEra VALUES (3, 1, 'Paleozoik');

INSERT INTO GeoOkres VALUES (1, 1, 'Czwartorzed');
INSERT INTO GeoOkres VALUES (2, 1, 'Trzeciorzed(Neogen)');
INSERT INTO GeoOkres VALUES (3, 1, 'Trzeciorzed(Paleogen)');
INSERT INTO GeoOkres VALUES (4, 2, 'Kreda');
INSERT INTO GeoOkres VALUES (5, 2, 'Jura');
INSERT INTO GeoOkres VALUES (6, 2, 'Trias');
INSERT INTO GeoOkres VALUES (7, 3, 'Perm');
INSERT INTO GeoOkres VALUES (8, 3, 'Karbon');
INSERT INTO GeoOkres VALUES (9, 3, 'Dewon');

INSERT INTO GeoEpoka VALUES (1, 1, 'Holocen');
INSERT INTO GeoEpoka VALUES (2, 1, 'Plejstocen');
INSERT INTO GeoEpoka VALUES (3, 2, 'Pliocen');
INSERT INTO GeoEpoka VALUES (4, 2, 'Miocen');
INSERT INTO GeoEpoka Values (5, 3, 'Oligocen');
INSERT INTO GeoEpoka Values (6, 3, 'Eocen');
INSERT INTO GeoEpoka Values (7, 3, 'Paleocen');
INSERT INTO GeoEpoka Values (8, 4, 'Górna');
INSERT INTO GeoEpoka Values (9, 4, 'Dolna');
INSERT INTO GeoEpoka Values (10, 5, 'Górna');
INSERT INTO GeoEpoka Values (11, 5, 'Srodkowa');
INSERT INTO GeoEpoka Values (12, 5, 'Dolna');
INSERT INTO GeoEpoka Values (13, 6, 'Górna');
INSERT INTO GeoEpoka Values (14, 6, 'Srodkowa');
INSERT INTO GeoEpoka Values (15, 6, 'Dolna');
INSERT INTO GeoEpoka Values (16, 7, 'Górny');
INSERT INTO GeoEpoka Values (17, 7, 'Dolny');
INSERT INTO GeoEpoka Values (18, 8, 'Górny');
INSERT INTO GeoEpoka Values (19, 8, 'Dolny');
INSERT INTO GeoEpoka Values (20, 9, 'Górny');
INSERT INTO GeoEpoka Values (21, 9, 'Srodkowy');
INSERT INTO GeoEpoka Values (22, 9, 'Dolny');

INSERT INTO GeoPietro Values (1,1,'megalaj'),
(2,1,'northgrip'),
(3,1,'grenland'),
(4,2,'pozny[b]'),
(5,2,'chiban'),
(6,2,'kalabr'),
(7,2,'gelas'),
(8,3,'piacent'),
(9,3,'zankl'),
(10,4,'messyn'),
(11,4,'torton'),
(12,4,'serrawal'),
(13,4,'lang'),
(14,4,'burdyga³'),
(15,4,'akwitan'),
(16,5,'szat'),
(17,5,'rupel'),
(18,6,'priabon'),
(19,6,'barton'),
(20,6,'lutet'),
(21,6,'iprez'),
(22,7,'tanet'),
(23,7,'zeland'),
(24,7,'dan'),
(25,8,'mastrycht'),
(26,8,'kampan'),
(27,8,'santon'),
(28,8,'koniak'),
(29,8,'turon'),
(30,8,'cenoman'),
(31,9,'alb'),
(32,9,'apt'),
(33,9,'barrem'),
(34,9,'hoteryw'),
(35,9,'walanzyn'),
(36,9,'berrias'),
(37,10,'tyton'),
(38,10,'kimeryd'),
(39,10,'oksford'),
(40,11,'kelowej'),
(41,11,'baton'),
(42,11,'bajos'),
(43,11,'aalen'),
(44,12,'toark'),
(45,12,'pliensbach'),
(46,12,'synemur'),
(47,12,'hettang'),
(48,13,'retyk'),
(49,13,'noryk'),
(50,13,'karnik'),
(51,14,'ladyn'),
(52,14,'anizyk'),
(53,15,'olenek'),
(54,15,'ind'),
(55,16,'czangsing'),
(56,16,'wucziaping'),
(57,16,'kapitan'),
(58,16,'word'),
(59,16,'road'),
(60,17,'kungur'),
(61,17,'artinsk'),
(62,17,'sakmar'),
(63,17,'assel'),
(64,18,'gzel'),
(65,18,'kasimow'),
(66,18,'moskow'),
(67,18,'baszkir'),
(68,19,'serpuchow'),
(69,19,'wizen'),
(70,19,'turnej'),
(71,20,'famen'),
(72,20,'fran'),
(73,21,'zywet'),
(74,21,'eifel'),
(75,22,'ems'),
(76,22,'prag'),
(77,22,'lochkow');

CREATE TABLE Dziesiec(cyfra int, bit int);
INSERT INTO Dziesiec VALUES (0, 1), (1, 1), (2, 1), (3, 1), (4, 1), (5, 1), (6, 1), (7, 1), (8, 1), (9, 1);

CREATE TABLE Milion(liczba int,cyfra int, bit int);
INSERT INTO Milion SELECT a1.cyfra +10* a2.cyfra +100*a3.cyfra + 1000*a4.cyfra
+ 10000*a5.cyfra + 10000*a6.cyfra AS liczba , a1.cyfra AS cyfra, a1.bit AS bit
FROM Dziesiec a1, Dziesiec a2, Dziesiec a3, Dziesiec a4, Dziesiec a5, Dziesiec a6;

CREATE TABLE GeoTabela AS (SELECT * FROM GeoPietro NATURAL JOIN GeoEpoka 
NATURAL JOIN GeoOkres NATURAL JOIN GeoEra NATURAL JOIN GeoEon);

--1
SELECT COUNT(*) FROM Milion 
INNER JOIN GeoTabela 
ON (mod(Milion.liczba,77)=(GeoTabela.id_pietro));

--2
SELECT COUNT(*) FROM Milion 
INNER JOIN GeoPietro 
ON (mod(Milion.liczba,77)=GeoPietro.id_pietro) 
NATURAL JOIN GeoEpoka 
NATURAL JOIN GeoOkres 
NATURAL JOIN GeoEra
NATURAL JOIN GeoEon;

--3
SELECT COUNT(*) FROM Milion 
WHERE mod(Milion.liczba,77)=
(SELECT id_pietro FROM GeoTabela 
 WHERE mod(Milion.liczba,77)=(id_pietro));

--4
SELECT COUNT(*) FROM Milion 
WHERE mod(Milion.liczba,77) IN
(SELECT GeoPietro.id_pietro FROM GeoPietro
 NATURAL JOIN GeoEpoka 
 NATURAL JOIN GeoOkres 
 NATURAL JOIN GeoEra 
 NATURAL JOIN GeoEon);

--tworzenie indeksów

CREATE INDEX indxEon ON GeoEon(id_eon);
CREATE INDEX indxEra ON GeoEra(id_era, id_eon);
CREATE INDEX indxOkres ON GeoOkres(id_okres, id_era);
CREATE INDEX indxEpoka ON GeoEpoka(id_epoka, id_okres);
CREATE INDEX indxPietro ON GeoPietro(id_pietro, id_epoka);
CREATE INDEX indxLiczba ON Milion(liczba);
CREATE INDEX indxGeoTabela ON GeoTabela(id_pietro, id_epoka, id_era, id_okres,id_eon);
