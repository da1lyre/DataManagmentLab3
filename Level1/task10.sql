-- Задание 10
SELECT 
    gardener.last_name AS "Фамилия садовода",
    gardener.association AS "Товарищество",
    purchase.purchase_date AS "Дата покупки",
    purchase.register_number AS "Номер ведомости"
FROM purchase
JOIN gardener ON purchase.gardener_id = gardener.id
JOIN nursery ON purchase.nursery_id = nursery.id
WHERE gardener.association = nursery.association
    AND purchase.purchase_date >= DATE '2024-03-01'
    AND gardener.id IN (
        SELECT DISTINCT gardener_id 
        FROM purchase 
        WHERE total_cost >= 60000
    )
ORDER BY purchase.purchase_date, gardener.last_name;

SELECT 
    plants.variety AS "Название растения",
    nursery.name AS "Питомник",
    purchase.quantity AS "Купленное количество",
    purchase.total_cost AS "Итоговая стоимость",
    gardener.association AS "Товарищество садовода",
    plants.where_from AS "Поставщик растений"
FROM purchase
JOIN plants ON purchase.plant_id = plants.id
JOIN gardener ON purchase.gardener_id = gardener.id
JOIN nursery ON purchase.nursery_id = nursery.id
WHERE gardener.association = plants.where_from
    AND purchase.quantity IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
ORDER BY purchase.total_cost ASC;

SELECT 
    gardener.id,
    gardener.last_name AS "Фамилия садовода",
    gardener.association AS "Товарищество садовода"
FROM gardener
WHERE gardener.id NOT IN (
    SELECT DISTINCT purchase.gardener_id
    FROM purchase
    JOIN nursery ON purchase.nursery_id = nursery.id
    WHERE nursery.association = 'Урожай'
)
ORDER BY gardener.last_name;

SELECT DISTINCT
    gardener.id,
    gardener.last_name AS "Фамилия садовода",
    gardener.association AS "Товарищество",
    plants.variety AS "Название растения"
FROM gardener
JOIN purchase ON gardener.id = purchase.gardener_id
JOIN plants ON purchase.plant_id = plants.id
WHERE plants.variety = 'Вишня'
ORDER BY gardener.last_name;

