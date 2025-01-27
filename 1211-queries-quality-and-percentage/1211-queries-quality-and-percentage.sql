# Write your MySQL query statement below

SELECT sub.query_name, ROUND(SUM(rating / position) / count_num, 2) as quality, 
ROUND((SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END) / count_num) * 100, 2)  as poor_query_percentage
FROM (SELECT query_name, COUNT(rating) as count_num
FROM Queries
GROUP BY query_name) as sub
JOIN Queries q
ON sub.query_name = q.query_name
GROUP BY sub.query_name