SELECT SUM(duration) as total_duration
FROM assignment_submissions
JOIN students ON students.id = assignment_submissions.student_id
JOIN cohorts ON cohorts.id = students.cohort_id
WHERE cohorts.name = 'FEB12'
GROUP BY cohort_id;