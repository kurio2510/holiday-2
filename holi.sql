USE HOLIDAY;
-- 1."Nước giải khát" category price 10k–50k in stock
SELECT *
FROM products
WHERE category = 'Nước giải khát'
AND price BETWEEN 10000 AND 50000
AND stock > 0;

-- 2. last name "Nguyen" OR living in Hanoi
SELECT *
FROM customers
WHERE full_name LIKE 'Nguyen%'
OR address LIKE '%Ha Noi%';

-- 3. Order Big to Small
SELECT o.id AS order_id,o.order_date,o.status,c.full_name AS customer_name
FROM orders o
JOIN customers c ON o.customer_id = c.id
ORDER BY o.order_date DESC;

-- 4. details
SELECT c.full_name AS customer_name,o.order_date,p.product_name,od.quantity,(od.total_price / od.quantity) AS unit_price
FROM orders o
JOIN customers c ON o.customer_id = c.id
JOIN order_details od ON o.id = od.order_id
JOIN products p ON od.product_id = p.id
WHERE o.id = @order_id;

-- 5.never placed any order
SELECT *
FROM customers c
WHERE NOT EXISTS (
SELECT 1
FROM orders o
WHERE o.customer_id = c.id
);
