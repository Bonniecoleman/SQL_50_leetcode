# Write your MySQL query statement below
WITH new as (
    SELECT product_name, product_id, product_category
    FROM Products
    GROUP BY product_name)

SELECT product_name, SUM(unit) as unit
FROM Orders o
JOIN new n
ON o.product_id = n.product_id
WHERE MONTH(order_date) = 2 AND YEAR(order_date) = 2020
GROUP BY product_name
HAVING sum(unit) >= 100
