
WITH first as(
    SELECT product_id, MIN(year) as first_year
    FROM Sales
    GROUP BY product_id
)

SELECT s.product_id, f.first_year, s.quantity, s.price
FROM first f
JOIN Sales s
ON f.product_id = s.product_id AND f.first_year = s.year;