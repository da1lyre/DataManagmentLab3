-- Задание 11
SELECT 
    plants.variety AS "Название растения",
    plants.price_rub AS "Стоимость"
FROM plants
WHERE id IN (
    SELECT plant_id 
    FROM purchase 
    WHERE nursery_id IN (
        SELECT id FROM nursery WHERE association = 'Дальнее'
    )
)
AND price_rub >= ALL (
    SELECT price_rub 
    FROM plants 
    WHERE id IN (
        SELECT plant_id 
        FROM purchase 
        WHERE nursery_id IN (
            SELECT id FROM nursery WHERE association = 'Дальнее'
        )
    )
);

SELECT 
    name AS "Название питомника",
    association AS "Товарищество",
    commission AS "Комиссионные"
FROM nursery 
WHERE nursery.association != 'Урожай'
  AND NOT (nursery.commission <> ALL (
      SELECT commission 
      FROM nursery 
      WHERE association = 'Урожай'
  ))
ORDER BY name;

SELECT 
    last_name AS "Фамилия садовода",
    discount AS "Льгота"
FROM gardener
WHERE discount > (SELECT MIN(discount) FROM gardener);

SELECT 
    register_number AS "Номер ведомости",
    (SELECT last_name FROM gardener WHERE id = purchase.gardener_id) AS "Фамилия садовода",
    purchase_date AS "Дата покупки",
    total_cost AS "Сумма"
FROM purchase
WHERE total_cost >= ALL (
    SELECT 60000
)
    
