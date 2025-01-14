# Write your MySQL query statement below

SELECT e.employee_id
FROM Employees e
LEFT JOIN Employees e2
ON e.manager_id = e2.employee_id
WHERE e2.employee_id IS NULL 
AND e.salary < 30000
AND e.manager_id NOT IN (SELECT employee_id FROM Employees)
ORDER BY 1

