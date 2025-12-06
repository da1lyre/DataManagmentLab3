-- Задание 1
DROP TABLE IF EXISTS gardener;
CREATE TABLE gardener (
    id INT PRIMARY KEY,
    last_name VARCHAR(75) NOT NULL,
    association VARCHAR(100),
    discount DECIMAL(5,2) CHECK (discount BETWEEN 0 AND 100)
);

DROP TABLE IF EXISTS nursery;
CREATE TABLE nursery (
    id INT PRIMARY KEY,
    name VARCHAR(75) NOT NULL,
    association VARCHAR(75),
    commission DECIMAL(5,2) CHECK (commission BETWEEN 0 AND 100)
);

DROP TABLE IF EXISTS plants;
CREATE TABLE plants (
    id INT PRIMARY KEY,
    variety VARCHAR(75) NOT NULL,
    where_from VARCHAR(75),
    price_rub DECIMAL(10,2) CHECK (price_rub >= 0),
    seedling_count INT CHECK (seedling_count >= 0)
);

DROP TABLE IF EXISTS purchase;
CREATE TABLE purchase (
    register_number INT PRIMARY KEY,
    purchase_date DATE NOT NULL,
    gardener_id INT NOT NULL,
    nursery_id INT NOT NULL,
    plant_id INT NOT NULL,
    quantity INT CHECK (quantity > 0),
    total_cost DECIMAL(12,2) CHECK (total_cost >= 0),
    FOREIGN KEY (gardener_id) REFERENCES gardener(id),
    FOREIGN KEY (nursery_id) REFERENCES nursery(id),
    FOREIGN KEY (plant_id) REFERENCES plants(id)
);
