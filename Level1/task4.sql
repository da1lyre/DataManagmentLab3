-- Задание 4
SELECT DISTINCT association FROM gardener WHERE association IS NOT NULL
UNION
SELECT DISTINCT association FROM nursery WHERE association IS NOT NULL
UNION
SELECT DISTINCT where_from FROM plants WHERE where_from IS NOT NULL;

SELECT DISTINCT where_from AS association_source 
FROM plants 
WHERE where_from IS NOT NULL 
ORDER BY where_from;

SELECT DISTINCT TO_CHAR(purchase_date, 'Month') AS month
FROM purchase;

