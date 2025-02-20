USE restaurant_db;

-- MENU ITEMS EDA

-- Project Objectives 
-- 1. View the menu_items table.
-- 2. Find the number of items in the menu.
-- 3. What are the least and most expensive items on the menu?
-- 4. How many Italian dishes are on the menu?
-- 5. What are the least and most expensive Italian dish on the menu?
-- 6. How many dishes are in each category?
-- 7. What is the average dish price in each category?

-- Solutions

USE restaurant_db;

-- 1. View the menu_items table.
SELECT *
FROM menu_items;

-- 2. Find the number of items in the menu.
SELECT count(*)
FROM menu_items;

-- 3. What are the least and most expensive items on the menu?
SELECT *
FROM menu_items
ORDER BY price ASC;

SELECT *
FROM menu_items
ORDER BY price DESC;

-- 4. How many Italian dishes are on the menu?
SELECT COUNT(*)
FROM menu_items
WHERE category = 'Italian';

-- 5. What are the least and most expensive Italian dish on the menu?
SELECT *
FROM menu_items
WHERE category = 'Italian'
ORDER BY price ASC;

SELECT *
FROM menu_items
WHERE category = 'Italian'
ORDER BY price DESC;

-- 6. How many dishes are in each category?
SELECT category, COUNT(item_name) AS num_dishes
FROM menu_items
GROUP BY category;

-- 7. What is the average dish price in each category?
SELECT category, AVG(price) AS avg_price
FROM menu_items
GROUP BY category;











