SELECT cohorts.name as name, sum(assistance_requests.completed_at - assistance_requests.started_at) as total_duration
FROM students
JOIN cohorts ON students.cohort_id = cohorts.id
JOIN assistance_requests ON students.id = assistance_requests.student_id
GROUP BY cohorts.name
ORDER BY total_duration;