# Write your MySQL query statement below

WITH new as (
    SELECT x, y, z, x + y, y + z, x + z, CASE
       WHEN x < y + z AND y < x + z AND z < x + y THEN 'Yes'
       ELSE 'No' END AS triangle
    FROM Triangle)

SELECT x, y, z, triangle
FROM new