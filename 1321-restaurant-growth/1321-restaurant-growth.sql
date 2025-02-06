# Write your MySQL query statement below


-- WITH temp as (SELECT *, DATEDIFF(visited_on, week_before) as diff
-- FROM(SELECT visited_on, SUM(amount) as amount, DATE(visited_on - 6) as week_before 
-- FROM Customer
-- GROUP BY visited_on) new)

-- SELECT visited_on, total as amount, ROUND(total/7, 2) as average_amount
-- FROM (SELECT *, 
-- CASE WHEN diff = 6 THEN SUM(amount) OVER (ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) END as total
-- FROM temp) final
-- WHERE diff is NOT NULL



WITH new as (SELECT visited_on, amount, mark, CAST(mark as signed) - 6 as diff
FROM(SELECT visited_on, SUM(amount) as amount, DENSE_RANK() OVER (ORDER BY visited_on) as mark 
FROM Customer
GROUP BY visited_on) temp)

SELECT visited_on, total as amount, ROUND(total/7, 2) as average_amount
FROM (SELECT *, 
CASE WHEN diff > 0 THEN SUM(amount) OVER (ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) END as total
FROM new) final
WHERE diff > 0