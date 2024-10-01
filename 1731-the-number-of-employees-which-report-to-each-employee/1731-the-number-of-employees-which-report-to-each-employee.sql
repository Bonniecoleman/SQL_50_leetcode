# Write your MySQL query statement below

SELECT a1.employee_id, a1.name, count(a2.reports_to) as reports_count, ROUND(AVG(a2.age), 0) as average_age
FROM Employees a1
JOIN Employees a2 
ON a1.employee_id = a2.reports_to
WHERE a2.reports_to IS NOT NULL
GROUP BY a1.employee_id, a1.name
ORDER BY employee_id ASC