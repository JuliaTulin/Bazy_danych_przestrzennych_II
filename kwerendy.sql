
-- SQL Server
SELECT 
    COLUMN_NAME,
    DATA_TYPE,
    CHARACTER_MAXIMUM_LENGTH,
    IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'dbo'
  AND TABLE_NAME = 'FactInternetSales';


-- wyœwietlenie Foreign keys w SQL Server
SELECT 
    f.name AS ForeignKey,
    OBJECT_NAME(f.parent_object_id) AS ForeignTable,
    COL_NAME(fc.parent_object_id, fc.parent_column_id) AS ForeignColumn,
    OBJECT_NAME(f.referenced_object_id) AS ReferencedTable,
    COL_NAME(fc.referenced_object_id, fc.referenced_column_id) AS ReferencedColumn
FROM sys.foreign_keys AS f
JOIN sys.foreign_key_columns AS fc 
    ON f.object_id = fc.constraint_object_id
WHERE f.parent_object_id = OBJECT_ID('dbo.FactInternetSales');




-- Oracle – kolumny tabeli FACTINTERNETSALES
SELECT 
    column_name,
    data_type,
    data_length,
    nullable
FROM user_tab_columns
WHERE table_name = 'FACTINTERNETSALES';


-- Oracle – foreign keys tabeli FACTINTERNETSALES
SELECT
    a.constraint_name,
    a.table_name,
    b.column_name,
    c_pk.table_name AS referenced_table,
    b_pk.column_name AS referenced_column
FROM user_constraints a
JOIN user_cons_columns b 
    ON a.constraint_name = b.constraint_name
JOIN user_constraints c_pk 
    ON a.r_constraint_name = c_pk.constraint_name
JOIN user_cons_columns b_pk
    ON c_pk.constraint_name = b_pk.constraint_name
WHERE a.table_name = 'FACTINTERNETSALES'
  AND a.constraint_type = 'R';



-- PostgreSQL – kolumny tabeli factinternetsales
SELECT 
    column_name,
    data_type,
    is_nullable,
    character_maximum_length
FROM information_schema.columns
WHERE table_schema = 'public'
  AND table_name   = 'factinternetsales';


-- PostgreSQL – foreign keys tabeli factinternetsales
SELECT
    tc.constraint_name,
    tc.table_name,
    kcu.column_name,
    ccu.table_name AS foreign_table_name,
    ccu.column_name AS foreign_column_name
FROM information_schema.table_constraints AS tc
JOIN information_schema.key_column_usage AS kcu
    ON tc.constraint_name = kcu.constraint_name
JOIN information_schema.constraint_column_usage AS ccu
    ON ccu.constraint_name = tc.constraint_name
WHERE tc.table_name = 'factinternetsales'
  AND tc.constraint_type = 'FOREIGN KEY';





-- MySQL – kolumny tabeli FactInternetSales
SELECT 
    COLUMN_NAME,
    DATA_TYPE,
    CHARACTER_MAXIMUM_LENGTH,
    IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'dbo'
  AND TABLE_NAME = 'FactInternetSales';


-- MySQL – foreign keys tabeli FactInternetSales
SELECT 
    CONSTRAINT_NAME,
    TABLE_NAME,
    COLUMN_NAME,
    REFERENCED_TABLE_NAME,
    REFERENCED_COLUMN_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = 'dbo'
  AND TABLE_NAME = 'FactInternetSales'
  AND REFERENCED_TABLE_NAME IS NOT NULL;
