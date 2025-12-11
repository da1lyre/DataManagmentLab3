-- Задание 5
SELECT 
    last_name AS "Фамилия", 
    discount AS "Льгота"
FROM gardener
WHERE association = 'Урожай';

SELECT 
    last_name AS "Фамилия"
FROM gardener
WHERE association IN ('Радостное', 'Дальнее');

SELECT 
    variety AS "Сорт", 
    price_rub AS "Цена, руб"
FROM plants
WHERE price_rub > 30000 OR id IN (
   SELECT DISTINCT plant_id
   FROM purchase
   JOIN nursery ON purchase.nursery_id = nursery.id
   WHERE nursery.association = 'Мичуринское'
);
