SELECT name, count(assistance_requests.student_id) as total_assistances
FROM students
JOIN assistance_requests ON assistance_requests.student_id = students.id
WHERE name = 'Elliot Dickinson'
GROUP BY name;