# Write your MySQL query statement below

WITH new AS (
    SELECT account_id, 
           CASE
               WHEN income < 20000 THEN 'Low Salary'
               WHEN income BETWEEN 20000 AND 50000 THEN 'Average Salary'
               WHEN income > 50000 THEN 'High Salary'
           END AS category
    FROM Accounts),
temp AS (
    SELECT 'Low Salary' AS category 
    UNION ALL 
    SELECT 'Average Salary' 
    UNION ALL 
    SELECT 'High Salary')

SELECT temp.category, COALESCE(COUNT(new.account_id), 0) as accounts_count
FROM temp 
LEFT JOIN new 
ON temp.category = new.category
GROUP BY temp.category