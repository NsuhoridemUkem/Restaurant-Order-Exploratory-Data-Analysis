-- Project Objectives

-- 1. View the order_details table
-- 2. What is the date range of the table?
-- 3. How many order were made within this date range?
-- 4. How many items were ordered within this date range?
-- 5. Which orders had the most number of items?
-- 6. How many orders had more than 12 items?

-- 1. View the order_details table
SELECT *
FROM order_details;

-- 2. What is the date range of the table?
SELECT MIN(order_date), MAX(order_date)
FROM order_details;

SELECT order_date, SUBSTRING(order_date, 6, 2) AS 'month'
FROM order_details
GROUP BY order_date;

WITH CTE AS
(SELECT order_date, SUBSTRING(order_date, 6, 2) AS 'month'
FROM order_details
GROUP BY order_date
)
SELECT  `month`, COUNT(*) AS num_days
FROM CTE
GROUP BY `month`;

-- 3. How many order were made within this date range?
SELECT COUNT(order_id)
FROM order_details;

SELECT COUNT(DISTINCT(order_id))
FROM order_details;

select *
from order_details;

-- 4. How many items were ordered within this date range?
SELECT COUNT(DISTINCT(item_id))
FROM order_details;

SELECT item_id, COUNT(item_id)
FROM order_details
WHERE item_id IS NOT NULL
GROUP BY item_id
ORDER BY COUNT(item_id) ASC;

SELECT item_id, COUNT(item_id)
FROM order_details
WHERE item_id IS NOT NULL
GROUP BY item_id
ORDER BY COUNT(item_id) DESC;

-- 5. Which orders had the most number of items?
SELECT order_id, COUNT(item_id) AS num_items
FROM order_details
GROUP BY order_id
ORDER BY num_items DESC;

-- 6. How many orders had more than 12 items?
SELECT COUNT(*)
FROM 
(SELECT order_id, COUNT(item_id) AS num_items
FROM order_details
GROUP BY order_id
HAVING COUNT(item_id) >= 12) AS num_orders;

-- OR

WITH CTE AS
(
SELECT order_id, COUNT(item_id) AS num_items
FROM order_details
GROUP BY order_id
HAVING COUNT(item_id) >= 12
)
SELECT COUNT(*)
FROM CTE;



