SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort, count(assistance_requests) as total_assistances
FROM cohorts
JOIN students ON cohorts.id = students.cohort_id
JOIN assistance_requests ON students.id = assistance_requests.student_id
JOIN teachers on assistance_requests.teacher_id = teachers.id
WHERE cohorts.name = 'JUL02'
GROUP BY teachers.name, cohorts.name
ORDER BY teachers.name;