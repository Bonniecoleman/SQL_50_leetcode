# Write your MySQL query statement below

-- WITH new AS (SELECT email, MIN(id) AS min_id
--              FROM Person
--              GROUP BY email)

-- DELETE FROM Person
-- WHERE id NOT IN (SELECT min_id
--                  FROM new);

DELETE P1 
FROM Person p1, Person p2
WHERE p1.email = p2.email AND p1.id > p2.id