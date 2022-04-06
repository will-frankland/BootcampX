const req = require('express/lib/request');
const { Pool } = require('pg');
const cohortName = process.argv[2]

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

console.log('cohortName: ', cohortName);

pool.query(`
SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort
FROM teachers
JOIN assistance_requests ON teacher_id = teachers.id
JOIN students ON student_id = students.id
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.name = '${cohortName}'
ORDER BY teachers.name
`)
.then(res => {
  res.rows.forEach(row => {
    console.log(row.teacher)
  })
})
.catch(err => console.error('query error', err.stack));