-- Project Objectives

-- 1. Combine the menu_items and order_details tables into a single table
-- 2. What were the least and most ordered items? 
-- 3. What categories were they in?
-- 4. What were the top 5 orders that spent the most money?
-- 5. View the details of the highest spend order. Which specific items were purchased?
-- 6. BONUS: View the details of the top 5 highest spend orders

USE restaurant_db;

-- 1. Combine the menu_items and order_details tables into a single table
SELECT * FROM menu_items;
SELECT * FROM order_details;

SELECT *
FROM order_details od LEFT JOIN menu_items mi
	ON od.item_id = mi.menu_item_id;

-- 2. What were the least and most ordered items? 
SELECT item_name, COUNT(item_id) AS num_purchases
FROM order_details od LEFT JOIN menu_items mi
	ON od.item_id = mi.menu_item_id
WHERE item_name IS NOT NULL
GROUP BY item_name
ORDER BY num_purchases ASC;

SELECT item_name, COUNT(item_id) AS num_purchases
FROM order_details od LEFT JOIN menu_items mi
	ON od.item_id = mi.menu_item_id
WHERE item_name IS NOT NULL
GROUP BY item_name
ORDER BY num_purchases DESC;

SELECT COUNT(*) FROM
(
SELECT item_name, COUNT(item_id)
FROM order_details od LEFT JOIN menu_items mi
	ON od.item_id = mi.menu_item_id
GROUP BY item_name) AS num_items
WHERE item_name IS NOT NULL;

-- 3. What categories were they in?
SELECT item_name, category,COUNT(item_id) AS num_purchases
FROM order_details od LEFT JOIN menu_items mi
	ON od.item_id = mi.menu_item_id
WHERE item_name IS NOT NULL
GROUP BY item_name, category
ORDER BY num_purchases DESC;

SELECT item_name, category,COUNT(item_id) AS num_purchases
FROM order_details od LEFT JOIN menu_items mi
	ON od.item_id = mi.menu_item_id
WHERE item_name IS NOT NULL
GROUP BY item_name, category
ORDER BY num_purchases ASC;

-- What are the least and most ordered catgory?
SELECT category, COUNT(item_id) AS num_purchases
FROM order_details od LEFT JOIN menu_items mi
	ON od.item_id = mi.menu_item_id
WHERE item_name IS NOT NULL
GROUP BY category
ORDER BY num_purchases DESC;

-- 4. What were the top 5 orders that spent the most money?
SELECT order_id, COUNT(item_id) AS num_purchases, SUM(price) total_price
FROM order_details od LEFT JOIN menu_items mi
	ON od.item_id = mi.menu_item_id
WHERE item_name IS NOT NULL
GROUP BY order_id
HAVING total_price > 185
ORDER BY total_price DESC;

-- OR

SELECT order_id, COUNT(item_id) AS num_purchases, SUM(price) total_price
FROM order_details od LEFT JOIN menu_items mi
	ON od.item_id = mi.menu_item_id
WHERE item_name IS NOT NULL
GROUP BY order_id
ORDER BY total_price DESC
LIMIT 5;


-- 5. View the details of the highest spend order. Which specific items were purchased?
SELECT *
FROM order_details od LEFT JOIN menu_items mi
	ON od.item_id = mi.menu_item_id
WHERE order_id = 440;

SELECT category, COUNT(item_id) AS num_items
FROM order_details od LEFT JOIN menu_items mi
	ON od.item_id = mi.menu_item_id
WHERE order_id = 440
GROUP BY category;

-- 6. BONUS: View the details of the top 5 highest spend orders
SELECT order_id,category, COUNT(item_id) AS num_items
FROM order_details od LEFT JOIN menu_items mi
	ON od.item_id = mi.menu_item_id
WHERE order_id IN (440, 2075, 1957, 330, 2675)
GROUP BY order_id, category;







