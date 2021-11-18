CREATE TABLE truck(
      truck_id INT PRIMARY KEY,
      truck_name VARCHAR(8),
      model VARCHAR(8),
      lifting_capacity DECIMAL(3,2),
      truck_mass DECIMAL(3,2),
      country VARCHAR(15),
      supply_id INT);

CREATE TABLE supplier(
      supply_id INT PRIMARY KEY,
      supply_type VARCHAR(15),
      truck_departure TIMESTAMP,
      truck_arrival TIMESTAMP
);

ALTER TABLE truck ADD FOREIGN KEY (supply_id) REFERENCES supplier(supply_id);

INSERT INTO truck VALUES(100, 'Scania','R', 9.691, 8.309, 'Estonia', NULL);
INSERT INTO supplier VALUES(2, 'Furniture','2021-11-07 18:50:00','2021-11-09 09:15:15');
INSERT INTO truck VALUES(101, 'MAN','TGS', 5.25, 8.75, 'The Netherlands', 2);
INSERT INTO supplier VALUES(3, 'Home appliences', '2021-11-10 20:30:10','2021-11-14 08:01:10');
UPDATE truck
SET supply_id = 2
WHERE truck_id = 101;

INSERT INTO truck VALUES(102, 'Mercedes','Actros', 9.847, 8.153, 'Germany', 2);
INSERT INTO supplier VALUES(4, 'Log','2021-12-23 02:20:15','2021-12-25 10:10:05');

UPDATE truck
SET supply_id = 1
WHERE truck_id = 100;

INSERT INTO truck VALUES(103, 'DAF','XF', 1.728, 8.597, 'Denmark', 1);
INSERT INTO supplier VALUES(4, 'Log','2021-12-23 02:20:15','2021-12-25 10:10:05');
INSERT INTO truck VALUES(104, 'IVECO','Stralis', 1.404, 7.597, 'Slovenia', 2);
INSERT INTO truck VALUES(105, 'RENAULT','Magnum', 9.92, 8.56, 'France', 3);
INSERT INTO truck VALUES(106, 'Foton','Auman H', 7.500, 3.000, 'China', 3);
INSERT INTO truck VALUES(107, 'VOLVO','FH', 9.19, 6.09, 'Belgium', 1);
UPDATE truck
SET supply_id = 4
WHERE truck_id = 107;

UPDATE truck
SET supply_id = 4
WHERE truck_id = 102;

CREATE TABLE truck_store AS
SELECT truck_id, model, truck_mass, supply_type, lifting_capacity
FROM truck,supplier;

SELECT model, SUM(truck_mass)
FROM truck_store
GROUP BY model AND truck_mass
ORDER BY SUM(truck_mass) DESC;

DELETE t1 FROM truck_store t1
INNER JOIN truck_store t2
WHERE 
    t1.truck_id < t2.truck_id AND t1.model = t2.model;

DELETE t1 FROM truck_store t1
INNER JOIN truck_store t2
WHERE 
    t1.truck_id < t2.truck_id AND 
    t1.model = t2.model AND
    t1.truck_mass = t1.truck_mass AND
    t1.lifting_capacity = t2.lifting_capacity;
    
DROP TABLE IF EXISTS truck_store;

CREATE TABLE truck_part AS SELECT truck_id, truck_name, supply_type, truck_mass
FROM truck, supplier
WHERE lifting_capacity <> 3.00 AND truck_name LIKE 'a%';

INSERT INTO truck_part(truck_id, supply_type)
SELECT a.truck_id, b.supply_type
FROM truck a 
INNER JOIN supplier b ON a.truck_id = b.supply_type;

INSERT INTO truck_part
  (truck_id, truck_name, supply_type, truck_mass)
  VALUES (100, 'Scania', 'Furniture', 8.31);

INSERT INTO truck_part
  (truck_id, truck_name, supply_type, truck_mass)
  VALUES (107, 'Mercedes', 'Log', 8.15);

INSERT INTO truck_part
  (truck_id, truck_name, supply_type, truck_mass)
  VALUES (104, 'IVECO', 'Interior items', 1.40);

INSERT INTO truck_part
  (truck_id, truck_name, supply_type, truck_mass)
  VALUES (106, 'Foton', 'Home appliences', 7.50);

SELECT truck_name, SUM(truck_mass)
FROM truck_part
GROUP BY supply_type AND truck_mass
ORDER BY SUM(truck_mass) DESC;

UPDATE truck_part SET truck_mass = CASE
     WHEN truck_id = 100 THEN 9.6 
     WHEN truck_id = 104 THEN 7.5
     WHEN truck_id = 106 THEN 8.8
     WHEN truck_id = 107 THEN 5.6
     ELSE truck_mass OR NULL
END;

SELECT CASE 
       WHEN truck_mass = 7.5 THEN 'N/A'
       ELSE truck_mass
END AS truck_mass
FROM truck_part;


