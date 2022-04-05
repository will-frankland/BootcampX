SELECT cohorts.name as name, avg(assistance_requests.completed_at - assistance_requests.started_at) 
as average_assistance_request_duration
FROM cohorts
JOIN students ON students.cohort_id = cohorts.id
JOIN assistance_requests ON assistance_requests.student_id = students.id
GROUP BY cohorts.name
ORDER BY average_assistance_request_duration;