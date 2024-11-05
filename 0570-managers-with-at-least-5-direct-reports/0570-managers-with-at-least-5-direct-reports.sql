# Write your MySQL query statement below


SELECT name
FROM Employee
WHERE id in (
    select managerId
    from Employee 
    group by managerId
    having count(*) >= 5
)