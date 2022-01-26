const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

const cohortName = process.argv[2];
const limit = process.argv[3] || 5; 
let input = [`%${cohortName}%`, limit]

pool.query(`
SELECT students.id, students.name, cohorts.name as cohort_name
FROM students
JOIN cohorts on students.cohort_id = cohorts.id
WHERE cohorts.name LIKE $1
LIMIT $2;
`, input)
.then(res => {
  res.rows.forEach(user => {
    console.log(`${user.name} has an id of ${user.id} and was in the ${user.cohort_name} cohort`);
  })
});