-- Napisz procedur� wypisuj�c� do konsoli ci�g Fibonacciego. Procedura musi przyjmowa� jako 
-- argument wej�ciowy liczb� n. Generowanie ci�gu Fibonacciego musi zosta� 
-- zaimplementowane jako osobna funkcja, wywo�ywana przez procedur�.

--CREATE DATABASE Fibbonacci
USE Fibbonacci

CREATE FUNCTION Fibbonacci(@n INT)
RETURNS @Fibonacci_Tab TABLE
(ciag_fib INT)
AS

BEGIN
	DECLARE @F0 INT 
	DECLARE @F1 INT 
	DECLARE @numer_ciagu INT

	SET @F0 = 0
	SET @F1 = 1
	SET @numer_ciagu = 0

	INSERT INTO @Fibonacci_Tab 
	SELECT 0

	WHILE @numer_ciagu <= @n - 2
	BEGIN
      --stosuj�c logik� szeregu Fibbonaciego F= A+B 
      SET @Numer_ciagu = @F0 + @F1
     
      --wstawianie wynikowej liczby
      INSERT INTO @Fibonacci_Tab
      SELECT @Numer_ciagu
     
      --przypisywanie warto�ci A <= B 
      SET @F0 = @F1
      SET @F1 = @Numer_ciagu
	  SET @numer_ciagu += 1

	END;

	RETURN

END;


CREATE OR ALTER PROCEDURE Fibbo(@n INT)
AS
BEGIN
	SELECT * FROM dbo.Fibbonacci(@n)
END;

DECLARE @l INT
SET @l = 20

EXECUTE Fibbo @l 
	


