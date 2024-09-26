# Write your MySQL query statement below

Select B.product_name, A.year, A.price
From Sales AS A
LEFT JOIN Product AS B
ON A.product_id = B.product_id;