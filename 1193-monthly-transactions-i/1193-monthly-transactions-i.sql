# Write your MySQL query statement below

WITH new as (SELECT country, state, id, amount, DATE_FORMAT(trans_date, '%Y-%m') as month
FROM Transactions) 


SELECT month, country, COUNT(*) as trans_count, 
       SUM(CASE WHEN state = 'approved' THEN 1 ELSE 0 END) as approved_count, 
       SUM(amount) as trans_total_amount, 
       SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) as approved_total_amount
FROM new
GROUP BY month, country
