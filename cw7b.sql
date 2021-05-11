-- Napisz procedurê wypisuj¹c¹ do konsoli ci¹g Fibonacciego. Procedura musi przyjmowaæ jako 
-- argument wejœciowy liczbê n. Generowanie ci¹gu Fibonacciego musi zostaæ 
-- zaimplementowane jako osobna funkcja, wywo³ywana przez procedurê.

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
      --stosuj¹c logikê szeregu Fibbonaciego F= A+B 
      SET @Numer_ciagu = @F0 + @F1
     
      --wstawianie wynikowej liczby
      INSERT INTO @Fibonacci_Tab
      SELECT @Numer_ciagu
     
      --przypisywanie wartoœci A <= B 
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
	


