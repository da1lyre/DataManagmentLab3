-- Задание 6
SELECT 
    purchase.register_number,
    gardener.last_name AS gardener_name,
    nursery.name AS nursery_name
FROM purchase
JOIN gardener ON purchase.gardener_id = gardener.id
JOIN nursery ON purchase.nursery_id = nursery.id
ORDER BY purchase.register_number;

SELECT 
    purchase.register_number,
    purchase.purchase_date,
    gardener.last_name AS gardener_name,
    gardener.discount,
    plants.variety AS plant_name,
    purchase.quantity
FROM purchase
JOIN gardener ON purchase.gardener_id = gardener.id
JOIN plants ON purchase.plant_id = plants.id
ORDER BY purchase.register_number;
