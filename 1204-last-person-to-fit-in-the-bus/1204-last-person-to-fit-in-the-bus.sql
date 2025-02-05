# Write your MySQL query statement below

WITH new as (SELECT turn, person_id, person_name, weight, SUM(weight) OVER (ORDER BY turn) as sum
FROM Queue
ORDER BY turn ASC)

SELECT person_name
FROM new
WHERE sum <= 1000
ORDER BY sum DESC
LIMIT 1