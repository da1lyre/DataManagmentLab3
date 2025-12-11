-- Задание 11
SELECT 
    register_number AS "Номер ведомости",
    (SELECT last_name FROM gardener WHERE id = purchase.gardener_id) AS "Фамилия садовода",
    purchase_date AS "Дата покупки",
    total_cost AS "Сумма"
FROM purchase
WHERE total_cost >= ALL (
    SELECT 60000
)
    
