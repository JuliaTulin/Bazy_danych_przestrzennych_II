-- dni, w których by³o mniej niz 100 zamówieñ
SELECT 
    OrderDate,
    COUNT(*) AS Orders_cnt
FROM AdventureWorksDW2019.dbo.FactInternetSales
GROUP BY OrderDate
HAVING COUNT(*) < 100
ORDER BY Orders_cnt DESC;



-- dla ka¿dego dnia wyœwietl 3 produkty, których cena jednostkowa by³a najwiêksza
WITH Ranked AS (
    SELECT
        OrderDate,
        ProductKey,
        MAX(UnitPrice) AS UnitPrice,
        ROW_NUMBER() OVER (
            PARTITION BY OrderDate
            ORDER BY MAX(UnitPrice) DESC
        ) AS rn
    FROM AdventureWorksDW2019.dbo.FactInternetSales
    GROUP BY OrderDate, ProductKey
)
SELECT OrderDate, ProductKey, UnitPrice
FROM Ranked
WHERE rn <= 3
ORDER BY OrderDate, UnitPrice DESC;
