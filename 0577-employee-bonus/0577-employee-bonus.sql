# Write your MySQL query statement below

SELECT A.name, B.bonus
From Employee as A
LEFT JOIN Bonus as B
ON A.empId = B.empId
Where B.bonus < 1000 or B.bonus IS NULL;
