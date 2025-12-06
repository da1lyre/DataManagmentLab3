
-- Задание 7
SELECT 
    purchase.register_number AS "Номер ведомости",
    gardener.last_name AS "Фамилия садовода",
    purchase.purchase_date AS "Дата покупки"
FROM purchase
JOIN gardener ON purchase.gardener_id = gardener.id
WHERE purchase.total_cost >= 60000
ORDER BY purchase.register_number;

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
ORDER BY purchase.purchase_date, gardener.last_name;

SELECT DISTINCT
    nursery.name AS "Название питомника",
    nursery.association AS "Товарищество",
    nursery.commission AS "Комиссия"
FROM nursery
JOIN purchase ON nursery.id = purchase.nursery_id
JOIN gardener ON purchase.gardener_id = gardener.id
WHERE nursery.association != 'Дальнее'
    AND gardener.discount BETWEEN 1 AND 2
ORDER BY nursery.association, nursery.name;

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
ORDER BY purchase.total_cost ASC;

