# Write your MySQL query statement below

Select A.customer_id, COUNT(*) as count_no_trans
From Visits AS A
LEFT JOIN Transactions AS B
ON A.visit_id = B.visit_id
WHERE B.transaction_id IS NULL
GROUP BY A.customer_id;