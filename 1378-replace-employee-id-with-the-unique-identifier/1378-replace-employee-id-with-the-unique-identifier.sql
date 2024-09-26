# Write your MySQL query statement below

SELECT A.name, B.unique_id
From Employees As A
LEFT JOIN EmployeeUNI AS B
ON A.id = B.id;