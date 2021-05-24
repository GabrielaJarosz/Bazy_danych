USE AdventureWorks2012

--1. Przygotuj blok anonimowy, który:
-- znajdzie średnią stawkę wynagrodzenia pracowników, 
-- wyświetli szczegóły pracowników, których stawka wynagrodzenia jest niższa niż średnia. 

BEGIN
SELECT CONCAT('Średnia stawka wynagrodzenia pracowników to: ', AVG(EmployeePayHistory.Rate)) AS srednia_stawka 
FROM HumanResources.EmployeePayHistory;

SELECT Person.FirstName, Person.LastName, EmployeePayHistory.Rate, Employee.JobTitle
FROM HumanResources.Employee
JOIN Person.Person 
ON Employee.BusinessEntityID = Person.BusinessEntityID
JOIN HumanResources.EmployeePayHistory
ON Employee.BusinessEntityID = EmployeePayHistory.BusinessEntityID
AND Rate < (SELECT AVG(EmployeePayHistory.Rate) 
			FROM HumanResources.EmployeePayHistory)
ORDER BY EmployeePayHistory.Rate
END;



--2. Utwórz funkcję, która zwróci datę wysyłki określonego zamówienia.

DROP FUNCTION dbo.data_wysylki;  
GO  

CREATE FUNCTION data_wysylki(@zamowienie INT)
RETURNS DATETIME
AS

BEGIN
	DECLARE @wynik DATETIME;

	SET @wynik = (SELECT p.OrderDate 
					FROM Purchasing.PurchaseOrderHeader p
					GROUP BY p.OrderDate, p.PurchaseOrderID 
					HAVING p.PurchaseOrderID = @zamowienie);	

	RETURN @wynik;
END
GO

SELECT dbo.data_wysylki(3) AS data_wysylki
GO	



--3. Utwórz procedurę składowaną, która jako parametr przyjmuję nazwę produktu, a jako 
--rezultat wyświetla jego identyfikator, numer i dostępność.

CREATE OR ALTER PROCEDURE p_produkt
(@nazwa_produktu VARCHAR(35))
AS
BEGIN
SELECT p.ProductID, p.ProductNumber, SUM(Quantity) AS Dostępność
FROM Production.Product p
JOIN Production.ProductInventory pn
ON p.ProductID = pn.ProductID
WHERE Name LIKE @nazwa_produktu
GROUP BY p.ProductID, p.ProductNumber
END;

EXEC p_produkt 'Blade'



--4. Utwórz funkcję, która zwraca numer karty kredytowej dla konkretnego zamówienia.

DROP FUNCTION dbo.nr_karty;  
GO  

CREATE FUNCTION nr_karty(@zamowienie INT)
RETURNS NVARCHAR(25)
AS

BEGIN
	DECLARE @wynik NVARCHAR(25);

	SET @wynik = (SELECT s.CardNumber
					FROM Sales.CreditCard s
					JOIN Sales.SalesOrderHeader h
					ON s.CreditCardID = h.CreditCardID
					GROUP BY h.SalesOrderID, s.CardNumber
					HAVING h.SalesOrderID = @zamowienie);	
	RETURN @wynik;
END
GO

SELECT dbo.nr_karty(43660) AS numer_karty
GO



--5. Utwórz procedurę składowaną, która jako parametry wejściowe przyjmuje dwie liczby, num1
--i num2, a zwraca wynik ich dzielenia. Ponadto wartość num1 powinna zawsze być większa niż 
--wartość num2. Jeżeli wartość num1 jest mniejsza niż num2, wygeneruj komunikat o błędzie 
--„Niewłaściwie zdefiniowałeś dane wejściowe”.                                   

CREATE OR ALTER PROCEDURE p_dzielenie
(@num1 FLOAT, @num2 FLOAT)
AS
BEGIN
	DECLARE @wynik FLOAT

	IF (@num1 < @num2)
		SELECT 'Niewłaściwie zdefiniowałeś dane wejściowe.' AS Komunikat
		ELSE 
		SET @wynik = @num1 / @num2
		SELECT ROUND(@wynik,2) AS wynik_dzielenia
		RETURN	
END;

EXEC p_dzielenie 5.3,2.4
--EXEC p_dzielenie 1.3,2.4



--6. Napisz procedurę, która jako parametr przyjmie NationalIDNumber danej osoby, a zwróci 
--stanowisko oraz liczbę dni urlopowych i chorobowych.

CREATE OR ALTER PROCEDURE p_pracownikID
(@ID NVARCHAR(15))
AS
SELECT NationalIDNumber, JobTitle AS stanowisko, SickLeaveHours/24 AS dni_chorobowe, VacationHours/24 AS dni_urlopowe
FROM HumanResources.Employee
WHERE NationalIDNumber LIKE @ID

EXEC p_pracownikID '294148271'



--7. Napisz procedurę będącą kalkulatorem walutowym. Wykorzystaj dwie tabele: Sales.Currency 
--oraz Sales.CurrencyRate. Parametrami wejściowymi mają być: kwota, waluty oraz data 
--(CurrencyRateDate). Przyjmij, iż zawsze jedną ze stron jest dolar amerykański (USD).
--Zaimplementuj kalkulację obustronną, tj:
--1400 USD → PLN lub PLN → USD                                       

CREATE OR ALTER PROCEDURE p_kalkulatorw
(@kwota MONEY, @waluta1 nchar(3), @waluta2 nchar(3), @data DATETIME)
AS
BEGIN

IF(@waluta1 = 'USD')
SELECT @kwota/AverageRate AS kwota_końcowa
FROM Sales.Currency c
JOIN Sales.CurrencyRate r
ON 	r.ToCurrencyCode = c.CurrencyCode
WHERE @waluta2 = c.CurrencyCode 
AND @data = r.CurrencyRateDate

ELSE IF(@waluta2 = 'USD')
SELECT @kwota*AverageRate AS kwota_końcowa
FROM Sales.Currency c
JOIN Sales.CurrencyRate r
ON 	r.ToCurrencyCode = c.CurrencyCode
WHERE @waluta1 = c.CurrencyCode 
AND @data = r.CurrencyRateDate

END;

EXEC p_kalkulatorw 1300, EUR, USD, '2011-06-26 00:00:00.000' 
--NA EUR*


