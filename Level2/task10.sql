-- Задание 10
SELECT DISTINCT
    gardener.last_name,
    gardener.association,
    purchase.purchase_date
FROM purchase
JOIN gardener ON purchase.gardener_id = gardener.id
JOIN nursery ON purchase.nursery_id = nursery.id
WHERE gardener.association = nursery.association
  AND purchase.purchase_date >= '2024-03-01'
ORDER BY gardener.last_name, purchase.purchase_date;

SELECT 
    plants.variety,
    nursery.name,
    purchase.quantity
FROM purchase
JOIN plants ON purchase.plant_id = plants.id
JOIN nursery ON purchase.nursery_id = nursery.id
WHERE purchase.gardener_id IN (
    SELECT id 
    FROM gardener 
    WHERE association = plants.where_from
)
ORDER BY purchase.quantity;

SELECT 
    gardener.last_name
FROM gardener
WHERE id NOT IN (
    SELECT DISTINCT purchase.gardener_id
    FROM purchase
    JOIN nursery ON purchase.nursery_id = nursery.id
    WHERE nursery.association = 'Мичуринское'
)
ORDER BY gardener.last_name;

SELECT 
    gardener.last_name
FROM gardener
WHERE id IN (
    SELECT DISTINCT purchase.gardener_id
    FROM purchase
    JOIN plants ON purchase.plant_id = plants.id
    WHERE plants.variety = 'Вишня'
)
ORDER BY gardener.last_name;
