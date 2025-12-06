-- Задание 5
SELECT last_name, discount
FROM gardener
WHERE association = 'Урожай';

SELECT last_name
FROM gardener
WHERE association IN ('Радостное', 'Дальнее');

SELECT variety, price_rub
FROM plants
WHERE price_rub > 30000.00 OR id IN (
   SELECT DISTINCT plant_id
   FROM purchase
   JOIN nursery ON purchase.nursery_id = nursery.id
   WHERE nursery.association = 'Мичуринское'
);


