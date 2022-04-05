SELECT day, count(name), sum(duration)
FROM assignments
GROUP BY day
ORDER BY day;