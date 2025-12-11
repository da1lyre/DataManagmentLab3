-- Задание 6
SELECT 
    purchase.register_number AS "Номер ведомости",
    gardener.last_name AS "Фамилия садовода",
    nursery.name AS "Название питомника"
FROM purchase
JOIN gardener ON purchase.gardener_id = gardener.id
JOIN nursery ON purchase.nursery_id = nursery.id
ORDER BY purchase.register_number;

SELECT 
    purchase.register_number AS "Номер ведомости",
    purchase.purchase_date AS "Дата",
    gardener.last_name AS "Фамилия садовода",
    gardener.discount AS "Льгота",
    plants.variety AS "Название растения",
    purchase.quantity AS "Количество"
FROM purchase
JOIN gardener ON purchase.gardener_id = gardener.id
JOIN plants ON purchase.plant_id = plants.id
ORDER BY purchase.register_number;
