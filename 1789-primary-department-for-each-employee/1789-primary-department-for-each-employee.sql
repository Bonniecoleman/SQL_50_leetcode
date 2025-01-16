# Write your MySQL query statement below

SELECT employee_id, department_id
FROM Employee
GROUP BY 1
HAVING COUNT(employee_id) = 1

UNION ALL

SELECT employee_id, department_id
FROM Employee 
WHERE primary_flag = 'Y'

