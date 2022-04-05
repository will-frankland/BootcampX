SELECT students.name as student, teachers.name as teacher, assignments.name as assignment, 
sum(assistance_requests.completed_at - assistance_requests.started_at) as duration
FROM students
JOIN assistance_requests ON assistance_requests.student_id = students.id
JOIN teachers ON teachers.id = assistance_requests.teacher_id
JOIN assignments ON assistance_requests.assignment_id = assignments.id
GROUP BY student, teacher, assignment
ORDER BY duration