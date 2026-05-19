CREATE INDEX idx_products_cat_price ON products(category_id, price); 
CREATE INDEX idx_orders_customer_date ON orders(customer_id, created_at DESC); 
CREATE INDEX idx_inventory_stock ON inventory(stock_level); 
CREATE FULLTEXT INDEX idx_products_title_search ON products(title, description);