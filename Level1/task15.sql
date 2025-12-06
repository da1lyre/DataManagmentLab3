-- Задание 15
SELECT 
    plants.id,
    plants.variety AS "Название растения",
    COUNT(DISTINCT purchase.gardener_id) AS "Количество различных покупателей"
FROM purchase
JOIN plants ON purchase.plant_id = plants.id
GROUP BY plants.id, plants.variety
ORDER BY "Количество различных покупателей" DESC;

SELECT 
    EXTRACT(MONTH FROM purchase.purchase_date) AS "Месяц",
    SUM(purchase.total_cost) AS "Общая сумма покупок"
FROM purchase
JOIN nursery ON purchase.nursery_id = nursery.id
WHERE nursery.association = 'Дальнее'
GROUP BY EXTRACT(MONTH FROM purchase.purchase_date)
HAVING SUM(purchase.total_cost) > 700000
ORDER BY "Месяц";

SELECT 
    gardener.id AS "ID садовода",
    gardener.last_name AS "Фамилия садовода",
    plants.id AS "ID растения",
    plants.variety AS "Название растения",
    SUM(purchase.quantity) AS "Общее количество саженцев",
    SUM(purchase.total_cost) AS "Общая стоимость"
FROM purchase
JOIN gardener ON purchase.gardener_id = gardener.id
JOIN plants ON purchase.plant_id = plants.id
GROUP BY gardener.id, gardener.last_name, plants.id, plants.variety
ORDER BY gardener.last_name, plants.variety;

SELECT 
    gardener.id,
    gardener.last_name AS "Фамилия садовода",
    gardener.association AS "Товарищество",
    SUM(purchase.quantity) AS "Количество саженцев крыжовника",
    SUM(purchase.total_cost) AS "Общая сумма"
FROM purchase
JOIN gardener ON purchase.gardener_id = gardener.id
JOIN plants ON purchase.plant_id = plants.id
WHERE plants.variety = 'Крыжовник'
GROUP BY gardener.id, gardener.last_name, gardener.association
HAVING SUM(purchase.total_cost) > 300000
ORDER BY "Общая сумма" DESC;

