SET SESSION TRANSACTION ISOLATION LEVEL SERIALIZABLE;
START TRANSACTION;
SELECT stock_level FROM inventory WHERE product_id = 1 FOR UPDATE; 
UPDATE inventory 
SET stock_level = stock_level - 1 
WHERE product_id = 1 AND stock_level >= 1;

INSERT INTO orders (customer_id, total_amount, status, shipping_address) 
VALUES (203, 35000.00, 'placed', 'Hawassa, Tabor Subcity');
COMMIT;