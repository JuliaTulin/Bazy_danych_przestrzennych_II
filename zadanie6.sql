USE AdventureWorksDW2019;
GO

-- 2
IF OBJECT_ID('dbo.stg_dimemp', 'U') IS NOT NULL
    DROP TABLE dbo.stg_dimemp;
GO

-- Tworzenie stg_dimemp na podstawie DimEmployee dla wierszy 270–275
SELECT
    EmployeeKey,
    FirstName,
    LastName,
    Title
INTO dbo.stg_dimemp
FROM dbo.DimEmployee
WHERE EmployeeKey BETWEEN 270 AND 275;
GO

-- Tabela docelowa scd_dimemp
CREATE TABLE dbo.scd_dimemp (
    EmployeeKey int ,
    FirstName nvarchar(50) not null,
    LastName nvarchar(50) not null,
    Title nvarchar(50),
    StartDate datetime,
    EndDate datetime
);

-- za³adowanie scd_dimemp danymi z DimEmployee
INSERT INTO dbo.scd_dimemp (EmployeeKey, FirstName, LastName, Title, StartDate, EndDate)
SELECT EmployeeKey, FirstName, LastName, Title, StartDate, EndDate
FROM dbo.DimEmployee
WHERE EmployeeKey >= 270 AND EmployeeKey <= 275;


-- 5
SELECT * FROM dbo.stg_dimemp;
SELECT * FROM dbo.scd_dimemp;

-- Zmiana nazwiska i tytu³u
UPDATE dbo.STG_DimEmp
SET LastName = 'Nowak'
WHERE EmployeeKey = 270;

UPDATE dbo.STG_DimEmp
SET Title = 'Senior Design Engineer'
WHERE EmployeeKey = 274;


SELECT * FROM dbo.scd_dimemp
ORDER BY EmployeeKey, StartDate;

-- Próba zmiany atrybutu sta³ego 
UPDATE dbo.STG_DimEmp
SET FirstName = 'Ryszard'
WHERE EmployeeKey = 275;


