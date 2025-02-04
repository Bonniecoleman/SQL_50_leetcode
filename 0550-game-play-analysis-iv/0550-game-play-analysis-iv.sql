-- WITH new as (
--     SELECT player_id, device_id, event_date, DATEDIFF(event_date, LAG(event_date) OVER (PARTITION BY player_id ORDER BY event_date)) as date_diff
-- FROM Activity) 

-- -- SELECT ROUND(COUNT(DISTINCT CASE WHEN date_diff = 1 THEN 1 END) / COUNT(DISTINCT player_id), 2) as fraction
-- -- FROM new


-- SELECT player_id, event_date, RANK() OVER (PARTITION BY player_id ORDER BY event_date) as rank_event, DATE(event_date + 1) as event_date, DATEDIFF(event_date, LEAD(event_date) OVER (PARTITION BY player_id ORDER BY event_date)) as date_diff
-- FROM Activity



WITH new as(SELECT player_id, event_date, MIN(event_date) as first_date
FROM Activity
GROUP BY player_id)


SELECT ROUND(COALESCE(SUM(CASE WHEN DATEDIFF(a.event_date, n.first_date) = 1 THEN 1 END) / COUNT(DISTINCT a.player_id), 0), 2) as fraction
FROM Activity a
JOIN new n
ON a.player_id = n.player_id