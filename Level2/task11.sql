-- Задание 11
SELECT 
    plants.variety AS "Название растения",
    plants.price_rub AS "Стоимость"
FROM plants
WHERE id IN (
    SELECT plant_id FROM purchase WHERE nursery_id IN (
        SELECT id FROM nursery WHERE association = 'Дальнее'
    )
)
AND price_rub >= ALL (
    SELECT price_rub FROM plants WHERE id IN (
        SELECT plant_id FROM purchase WHERE nursery_id IN (
            SELECT id FROM nursery WHERE association = 'Дальнее'
        )
    )
);

SELECT 
    last_name AS "Фамилия садовода",
    discount AS "Льгота"
FROM gardener
WHERE discount > ALL (
    SELECT MIN(discount) FROM gardener
);

SELECT 
    name AS "Название питомника",
    association AS "Товарищество",
    commission AS "Комиссионные"
FROM nursery
WHERE association != 'Урожай'
  AND commission = ANY (
      SELECT commission 
      FROM nursery 
      WHERE association = 'Урожай'
  )
ORDER BY name;

SELECT 
    register_number AS "Номер ведомости",
    (SELECT last_name FROM gardener WHERE id = purchase.gardener_id) AS "Фамилия садовода",
    purchase_date AS "Дата покупки"
FROM purchase
WHERE total_cost >= ALL (
    SELECT 60000
)
ORDER BY total_cost DESC;
