-- Задание 12
SELECT association AS "Название товарищества"
FROM gardener
WHERE association IS NOT NULL
UNION
SELECT association
FROM nursery
WHERE association IS NOT NULL
ORDER BY "Название товарищества";

