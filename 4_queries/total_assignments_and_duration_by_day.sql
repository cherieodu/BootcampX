SELECT day, count(assignments), sum(duration)
FROM assignments
GROUP BY day
ORDER BY day;