# Write your MySQL query statement below

SELECT a1.id
FROM Weather a1, Weather a2 
WHERE DATEDIFF(a1.recordDate, a2.recordDate) = 1
AND a1.temperature > a2.temperature;