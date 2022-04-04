SELECT students.name as student, AVG(assignment_submissions.duration) as average_assignment_duration
from students
JOIN assignment_submissions on assignment_submissions.student_id = students.id
JOIN assignments on assignments.id = assignment_submissions.assignment_id
WHERE students.end_date IS NULL
GROUP BY students.name
ORDER BY average_assignment_duration DESC;