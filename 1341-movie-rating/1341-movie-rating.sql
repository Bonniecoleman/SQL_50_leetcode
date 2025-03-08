# Write your MySQL query statement below

SELECT results
FROM(
    SELECT results FROM (
        SELECT u.name as results
        FROM MovieRating m
        LEFT JOIN Users u ON m.user_id = u.user_id
        GROUP BY u.user_id, u.name
        ORDER BY COUNT(*) DESC, u.name ASC
        LIMIT 1) A

UNION ALL

SELECT results
FROM (
    SELECT results FROM(
        SELECT m.title as results
        FROM MovieRating r
        JOIN Movies m
        ON r.movie_id = m.movie_id
        WHERE YEAR(r.created_at) = 2020 AND MONTH(r.created_at) = 2
        GROUP BY r.movie_id, m.title
        ORDER BY AVG(r.rating) DESC, m.title ASC
        LIMIT 1) as B1
        ) as B2
    ) Final;
