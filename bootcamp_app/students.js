const req = require('express/lib/request');
const { Pool } = require('pg');
process.argv.slice(2);

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});


pool.query(`
SELECT students.id as student_id, students.name as student_name, cohorts.name as cohort_name
FROM students
JOIN cohorts on cohorts.id = students.cohort_id
LIMIT 5;
`)
.then(res => {
  res.rows.forEach(user => {
    console.log(user)
    console.log(`${user.student_name} has an id of ${user.student_id} and was in the ${user.cohort_name} cohort`);
  })
})
.catch(err => console.error('query error', err.stack));