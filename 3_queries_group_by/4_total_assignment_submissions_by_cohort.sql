SELECT cohorts.name as cohort, count(assignment_id) as total_submissions
FROM cohorts
JOIN students on students.cohort_id = cohorts.id
JOIN assignment_submissions on assignment_submissions.student_id = students.id
GROUP BY cohorts.name
ORDER BY total_submissions DESC
