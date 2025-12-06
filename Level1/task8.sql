-- Задание 8
UPDATE purchase
SET total_cost = purchase.total_cost * (1 - gardener.discount / 100)
FROM gardener
WHERE purchase.gardener_id = gardener.id;

SELECT 
    purchase.register_number AS "Номер ведомости",
    gardener.last_name AS "Фамилия садовода",
    gardener.discount AS "Льгота (%)",
    purchase.purchase_date AS "Дата покупки",
    purchase.total_cost AS "Сумма с учетом льготы"
FROM purchase
JOIN gardener ON purchase.gardener_id = gardener.id
ORDER BY purchase.register_number;

