-- Задание 4
SELECT DISTINCT association AS "Товарищество" 
FROM gardener 
WHERE association IS NOT NULL
UNION
SELECT DISTINCT association AS "Товарищество" 
FROM nursery 
WHERE association IS NOT NULL
UNION
SELECT DISTINCT where_from AS "Товарищество" 
FROM plants 
WHERE where_from IS NOT NULL;

SELECT DISTINCT where_from AS "Откуда" 
FROM plants 
WHERE where_from IS NOT NULL 
ORDER BY where_from;

SELECT DISTINCT TO_CHAR(purchase_date, 'Month') AS "Месяц"
FROM purchase;
