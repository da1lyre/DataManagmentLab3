-- Задание 9
ALTER TABLE purchase 
ADD COLUMN commission_amount DECIMAL(12,2);

UPDATE purchase
SET commission_amount = purchase.total_cost * (nursery.commission / 100)
FROM nursery
WHERE purchase.nursery_id = nursery.id;

SELECT 
    purchase.register_number AS "Номер ведомости",
    purchase.purchase_date AS "Дата",
    gardener.last_name AS "Садовод",
    nursery.name AS "Питомник",
    nursery.commission AS "Комиссия (%)",
    purchase.total_cost AS "Сумма покупки",
    purchase.commission_amount AS "Комиссионные питомника"
FROM purchase
JOIN gardener ON purchase.gardener_id = gardener.id
JOIN nursery ON purchase.nursery_id = nursery.id
ORDER BY purchase.register_number;

