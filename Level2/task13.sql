-- Задание 13
SELECT gardener.last_name
FROM gardener
WHERE NOT EXISTS (
    SELECT plants.id
    FROM plants
    WHERE plants.where_from = 'Солнечное'
      AND NOT EXISTS (
          SELECT 1
          FROM purchase
          WHERE purchase.gardener_id = gardener.id
            AND purchase.plant_id = plants.id
            AND EXTRACT(MONTH FROM purchase.purchase_date) <= 6
      )
);

SELECT plants.variety
FROM plants
WHERE NOT EXISTS (
    SELECT gardener.id
    FROM gardener
    WHERE gardener.discount < 3
      AND EXISTS (
          SELECT 1
          FROM purchase
          JOIN nursery ON purchase.nursery_id = nursery.id
          WHERE purchase.gardener_id = gardener.id
            AND nursery.association = 'Урожай'
      )
      AND NOT EXISTS (
          SELECT 1
          FROM purchase
          JOIN nursery ON purchase.nursery_id = nursery.id
          WHERE purchase.gardener_id = gardener.id
            AND purchase.plant_id = plants.id
            AND nursery.association = 'Урожай'
      )
);
SELECT nursery.name
FROM nursery
WHERE NOT EXISTS (
    SELECT gardener.id
    FROM gardener
    WHERE gardener.discount > 0
      AND NOT EXISTS (
          SELECT 1
          FROM purchase
          WHERE purchase.nursery_id = nursery.id
            AND purchase.gardener_id = gardener.id
      )
);

SELECT gardener.last_name, gardener.discount
FROM gardener
WHERE gardener.discount > (SELECT MIN(discount) FROM gardener)
  AND NOT EXISTS (
      SELECT nursery.id
      FROM nursery
      WHERE NOT EXISTS (
          SELECT 1
          FROM purchase
          WHERE purchase.gardener_id = gardener.id
            AND purchase.nursery_id = nursery.id
      )
  );
