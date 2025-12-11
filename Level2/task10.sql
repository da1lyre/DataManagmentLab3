-- Задание 10
SELECT DISTINCT
    gardener.last_name AS "Фамилия",
    gardener.association AS "Товарищество",
    purchase.purchase_date AS "Дата"
FROM gardener, purchase, nursery
WHERE gardener.id = purchase.gardener_id
  AND purchase.nursery_id = nursery.id
  AND gardener.association = nursery.association
  AND purchase.purchase_date >= '2024-03-01'
ORDER BY gardener.last_name, purchase.purchase_date;

SELECT 
    plants.variety AS "Название",
    nursery.name AS "Питомник",
    purchase.quantity AS "Количество"
FROM plants, purchase, nursery
WHERE plants.id = purchase.plant_id
  AND purchase.nursery_id = nursery.id
  AND purchase.gardener_id IN (
      SELECT id 
      FROM gardener 
      WHERE association = plants.where_from
  )
ORDER BY purchase.quantity;

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
    last_name AS "Фамилия"
FROM gardener
WHERE id NOT IN (
    SELECT DISTINCT purchase.gardener_id
    FROM purchase
    WHERE purchase.nursery_id IN (
        SELECT id 
        FROM nursery 
        WHERE association = 'Мичуринское'
    )
)
ORDER BY last_name;

SELECT 
    last_name AS "Фамилия"
FROM gardener
WHERE id IN (
    SELECT DISTINCT purchase.gardener_id
    FROM purchase
    WHERE purchase.plant_id IN (
        SELECT id 
        FROM plants 
        WHERE variety = 'Вишня'
    )
)
ORDER BY last_name;
