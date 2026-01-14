/*
  Change Log:
    - Author: Julia Tulin
    - Created: 2025-01-14
    - Modified: 2025-01-14 – initial version
*/

CREATE OR ALTER PROCEDURE dbo.usp_GetCurrencyRateYearsAgo
    @YearsAgo INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        fcr.CurrencyKey,
        dc.CurrencyAlternateKey,
        fcr.Date, 
        fcr.AverageRate,
        fcr.EndOfDayRate
    FROM dbo.FactCurrencyRate AS fcr
    JOIN dbo.DimCurrency     AS dc
        ON fcr.CurrencyKey = dc.CurrencyKey
    WHERE
        dc.CurrencyAlternateKey IN ('GBP', 'EUR')
        AND DATEDIFF(YEAR, fcr.[Date], GETDATE()) = @YearsAgo;
END;
GO

-- Przyk³¹d u¿ycia
-- EXEC dbo.usp_GetCurrencyRateYearsAgo @YearsAgo = 12;

/*
-- Zapytania pomocnicze
-- Czy w ogóle s¹ kursy GBP/EUR?
SELECT TOP 10
       fcr.CurrencyKey,
       dc.CurrencyAlternateKey,
       fcr.[Date],
       fcr.AverageRate,
       fcr.EndOfDayRate
FROM dbo.FactCurrencyRate AS fcr
JOIN dbo.DimCurrency     AS dc
    ON fcr.CurrencyKey = dc.CurrencyKey
WHERE dc.CurrencyAlternateKey IN ('GBP', 'EUR');

-- Jakie wartoœci ma DATEDIFF(YEAR, Date, GETDATE())?
SELECT DISTINCT
       DATEDIFF(YEAR, fcr.[Date], GETDATE()) AS DiffYears
FROM dbo.FactCurrencyRate AS fcr
JOIN dbo.DimCurrency     AS dc
    ON fcr.CurrencyKey = dc.CurrencyKey
WHERE dc.CurrencyAlternateKey IN ('GBP', 'EUR')
ORDER BY DiffYears;
*/


/* Jaka jest ró¿nica miêdzy kwerend¹, a procesem ETL? Wska¿ wady i zalety.

Kwerenda to jednorazowe lub cykliczne zapytanie do bazy, a proces ETL to przep³yw miêdzy systemami
obejmuj¹cy pobieranie, przekszta³canie i ³adowanie danych.

Zalety kwerendy:
 - ³atwa modyfikacja
 - nie potrzeba innych œrodowisk, wystarczy SQL Server
 - Szybkoœæ tworzenia

Wady kwerendy:
 - Nie wykona bardziej skomplikowanych przep³ywów
 - brak rozbudowanego logowania

Zalety ETL:
 - graficzna prezentacja procesu
 - mo¿liwoœæ automatyzacji
 - mo¿liwoœæ pod³¹czenia ró¿nych Ÿróde³ danych

Wady ETL:
 - bardziej skomplikowane w utrzymaniu i modyfikacji
*/