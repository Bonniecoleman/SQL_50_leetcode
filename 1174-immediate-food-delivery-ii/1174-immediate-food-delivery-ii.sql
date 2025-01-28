# Write your MySQL query statement below

WITH new as (SELECT delivery_id, customer_id, order_date, customer_pref_delivery_date as pref_date, 
    CASE WHEN order_date = customer_pref_delivery_date THEN 1 ELSE 0 END as tf, rank() OVER (PARTITION BY customer_id ORDER BY order_date) as rank_date
FROM Delivery)


SELECT ROUND((SUM(CASE WHEN TF = 1 THEN 1 ELSE 0 END) / COUNT(tf)) * 100 , 2) as immediate_percentage
From new
WHERE rank_date = 1

