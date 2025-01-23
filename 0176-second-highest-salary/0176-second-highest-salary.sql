
SELECT COALESCE((SELECT DISTINCT salary as second
FROM Employee
ORDER BY salary DESC
LIMIT 1
OFFSET 1), NULL) as SecondHighestSalary