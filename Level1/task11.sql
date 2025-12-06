-- Задание 11
SELECT DISTINCT
    plants.variety AS "Название растения",
    plants.price_rub AS "Стоимость"
FROM plants
JOIN purchase ON plants.id = purchase.plant_id
JOIN nursery ON purchase.nursery_id = nursery.id
WHERE nursery.association = 'Дальнее'
    AND plants.price_rub >= ALL (
        SELECT plants.price_rub
        FROM plants
        JOIN purchase ON plants.id = purchase.plant_id
        JOIN nursery ON purchase.nursery_id = nursery.id
        WHERE nursery.association = 'Дальнее'
    );

SELECT 
    last_name AS "Фамилия садовода",
    discount AS "Льгота (%)"
FROM gardener
WHERE discount > ANY (
    SELECT discount
    FROM gardener
    WHERE discount > 0
)
ORDER BY discount DESC;

SELECT 
    name AS "Название питомника",
    association AS "Товарищество",
    commission AS "Комиссия (%)"
FROM nursery
WHERE association != 'Урожай'
    AND commission = ANY (
        SELECT commission
        FROM nursery
        WHERE association = 'Урожай'
    )
ORDER BY commission, name;

SELECT 
    purchase.register_number AS "Номер ведомости",
    gardener.last_name AS "Фамилия садовода",
    purchase.purchase_date AS "Дата покупки",
    purchase.total_cost AS "Сумма покупки"
FROM purchase
JOIN gardener ON purchase.gardener_id = gardener.id
WHERE purchase.total_cost >= ALL (
    SELECT 60000
)
ORDER BY purchase.register_number;

