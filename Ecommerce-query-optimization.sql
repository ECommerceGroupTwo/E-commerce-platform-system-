EXPLAIN SELECT product_id, title, price 
FROM products 
WHERE category_id = 1 
  AND price BETWEEN 1000 AND 20000
  AND MATCH(title, description) AGAINST('Laptop' IN NATURAL LANGUAGE MODE);

SELECT p.product_id, p.title, SUM(oi.quantity) AS total_units_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_id, p.title
ORDER BY total_units_sold DESC
LIMIT 10;  

EXPLAIN SELECT order_id, total_amount, status, created_at 
FROM orders 
WHERE customer_id = 201 
ORDER BY created_at DESC;

SELECT 
    DATE_FORMAT(created_at, '%Y-%m') AS revenue_month,
    SUM(total_amount) AS total_revenue,
    COUNT(order_id) AS total_orders
FROM orders
WHERE status IN ('paid', 'shipped', 'delivered')
GROUP BY DATE_FORMAT(created_at, '%Y-%m');

SELECT p.product_id, p.title, i.stock_level
FROM inventory i
JOIN products p ON i.product_id = p.product_id
WHERE i.stock_level <= 10;