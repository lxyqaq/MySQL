USE my_guitar_shop;

#1. Show all guitar names with a list_price greater than 1000
SELECT product_name
FROM products
INNER JOIN categories c ON products.category_id = c.category_id
WHERE category_name = 'Guitars' AND list_price > 1000;

#2. Count how many Drum Kits there are?
SELECT count(*) AS "Drum Kits"
FROM products
INNER JOIN categories c ON products.category_id = c.category_id
WHERE category_name = 'Drums';

#3. How many orders did Allan Sherwood make?
SELECT count(*) AS "Allan Shetwood's"
FROM orders
INNER JOIN customers c ON orders.customer_id = c.customer_id
WHERE first_name = 'Allan';

#4. What was the total cost of Frank Lee Wilsons order?
SELECT sum(item_price - discount_amount) AS "total cost"
FROM order_items
INNER JOIN orders o ON order_items.order_id = o.order_id
INNER JOIN customers c ON o.customer_id = c.customer_id
WHERE first_name = 'Frank Lee';

#5. Who ordered the bass?
SELECT first_name,
       last_name
FROM customers
RIGHT OUTER JOIN orders o ON customers.customer_id = o.customer_id
RIGHT OUTER JOIN order_items oi ON o.order_id = oi.order_id
RIGHT OUTER JOIN products p ON p.product_id = oi.product_id
RIGHT OUTER JOIN categories c ON c.category_id = p.category_id
WHERE category_name = 'Basses';

#6.  Which product was not ordered?
SELECT product_name
FROM products
RIGHT OUTER JOIN order_items oi ON products.product_id = oi.product_id
WHERE oi.product_id;

#7. Write a SELECT statement that joins the Categories table to the Products table and returns these columns: category_name, product_name, list_price.
# Sort the result set by category_name and then by product_name in ascending sequence.
SELECT category_name,
       product_name,
       list_price
FROM categories
INNER JOIN products p ON categories.category_id = p.category_id
ORDER BY find_in_set(category_name,'Basses , Drums , Guitars , Keyboards') AND product_name ASC ;