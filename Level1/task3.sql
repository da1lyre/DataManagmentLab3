-- Задание 3
SELECT 
    id AS "Идентификатор", 
    last_name AS "Фамилия", 
    association AS "Товарищество", 
    discount AS "Льгота,%"
FROM gardener;

SELECT 
    id AS "Идентификатор", 
    name AS "Название", 
    association AS "Товарищество", 
    commission AS "Комиссионные,%"
FROM nursery;

SELECT 
    id AS "Идентификатор", 
    variety AS "Сорт", 
    where_from AS "Откуда", 
    price_rub AS "Цена, руб", 
    seedling_count AS "Кол-во саженцев"
FROM plants;

SELECT 
    register_number AS "Номер ведомости", 
    purchase_date AS "Дата", 
    gardener_id AS "Садовод", 
    nursery_id AS "Питомник", 
    plant_id AS "Растение", 
    quantity AS "Кол-во", 
    total_cost AS "Итоговая стоимость, руб"
FROM purchase;
