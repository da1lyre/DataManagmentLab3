
-- Задание 14
SELECT 
    COUNT(DISTINCT purchase.plant_id) AS "Количество различных растений"
FROM purchase
JOIN gardener ON purchase.gardener_id = gardener.id
WHERE gardener.association = 'Дальнее'
    AND EXTRACT(MONTH FROM purchase.purchase_date) IN (5, 6);

SELECT 
    SUM(purchase.total_cost) AS "Суммарная стоимость продаж вишни",
    SUM(purchase.quantity) AS "Количество проданных саженцев вишни"
FROM purchase
JOIN plants ON purchase.plant_id = plants.id
WHERE plants.variety = 'Вишня';

SELECT 
    gardener.id,
    gardener.last_name AS "Фамилия садовода",
    gardener.association AS "Товарищество",
    SUM(purchase.total_cost) AS "Общая сумма покупок"
FROM purchase
JOIN gardener ON purchase.gardener_id = gardener.id
GROUP BY gardener.id, gardener.last_name, gardener.association
HAVING SUM(purchase.total_cost) > (
    SELECT AVG(total_sum)
    FROM (
        SELECT SUM(total_cost) as total_sum
        FROM purchase
        GROUP BY gardener_id
    ) as gardener_totals
);

SELECT 
    nursery.id,
    nursery.name AS "Название питомника",
    nursery.association AS "Товарищество",
    COUNT(DISTINCT purchase.gardener_id) AS "Количество уникальных садоводов"
FROM purchase
JOIN nursery ON purchase.nursery_id = nursery.id
JOIN gardener ON purchase.gardener_id = gardener.id
WHERE gardener.discount < (
    SELECT AVG(discount) FROM gardener
)
GROUP BY nursery.id, nursery.name, nursery.association
HAVING COUNT(DISTINCT purchase.gardener_id) = (
    SELECT COUNT(*)
    FROM gardener
    WHERE discount < (
        SELECT AVG(discount) FROM gardener
    )
);

