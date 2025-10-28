/*
Questions: What are the top paying Data Analyst jobs?
- Identify the top 10 highest paying Data Analyst roles that are available remotely.
- Focuses on job postings with specified salaries (remove nulls)
- Why? Highlight the top-paying opportunities for data analysts
*/

SELECT 
    job_id,
    job_title,
    name as company_name,
    job_schedule_type,
    salary_year_avg,
    job_location,
    job_posted_date
FROM
    job_postings_fact

left JOIN
    company_dim USING (company_id)
WHERE
    job_title_short ILIKE 'data analyst' and 
    job_location ilike'%India' AND
    salary_year_avg is NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10