CREATE ROLE IF NOT EXISTS 'admin_role';
CREATE ROLE IF NOT EXISTS 'seller_role';
CREATE ROLE IF NOT EXISTS 'customer_role';

GRANT ALL PRIVILEGES ON ecommerce_db.* TO 'admin_role';

GRANT SELECT, INSERT, UPDATE, DELETE ON ecommerce_db.products TO 'seller_role';
GRANT SELECT, UPDATE ON ecommerce_db.inventory TO 'seller_role';
GRANT SELECT ON ecommerce_db.orders TO 'seller_role';

GRANT SELECT ON ecommerce_db.products TO 'customer_role';
GRANT SELECT ON ecommerce_db.categories TO 'customer_role';
GRANT INSERT, SELECT ON ecommerce_db.orders TO 'customer_role';
GRANT INSERT, SELECT ON ecommerce_db.order_items TO 'customer_role';

CREATE USER IF NOT EXISTS 'ethio_admin'@'localhost' IDENTIFIED BY 'Admin@Secure2018';
CREATE USER IF NOT EXISTS 'ethio_seller'@'localhost' IDENTIFIED BY 'Seller@Secure2018';

GRANT 'admin_role' TO 'ethio_admin'@'localhost';
GRANT 'seller_role' TO 'ethio_seller'@'localhost';

SET DEFAULT ROLE ALL TO 'ethio_admin'@'localhost', 'ethio_seller'@'localhost';