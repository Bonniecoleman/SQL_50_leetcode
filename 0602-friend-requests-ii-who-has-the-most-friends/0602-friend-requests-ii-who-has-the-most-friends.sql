# Write your MySQL query statement below

-- WITH new as (
-- SELECT requester_id, COUNT(accepter_id) as count_accept_request
-- FROM RequestAccepted
-- GROUP BY requester_id
-- ), 
-- new_2 as (
-- SELECT accepter_id, COUNT(requester_id) as count_request_accept
-- FROM RequestAccepted
-- GROUP BY accepter_id)

-- SELECT requester_id as id, count_accept_request + count_request_accept as num
-- FROM new
-- JOIN new_2
-- ON new.requester_id = new_2.accepter_id
-- ORDER BY num DESC
-- LIMIT 1


WITH new as (SELECT requester_id, COUNT(accepter_id) as count_accept_request
FROM RequestAccepted
GROUP BY requester_id
UNION ALL
SELECT accepter_id, COUNT(requester_id) as count_request_accept
FROM RequestAccepted
GROUP BY accepter_id)

SELECT requester_id as id, SUM(count_accept_request) as num
FROM new
GROUP BY requester_id 
ORDER BY num DESC
LIMIT 1