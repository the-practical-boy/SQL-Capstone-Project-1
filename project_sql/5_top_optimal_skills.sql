-- FInding most optimal skills  
/*
Question: What are the most optimal skills for Data Analysts?

- Combine skill demand (number of job postings) and average salary.
- Focus only on roles with specified salaries and remote/work-from-home options.
- Apply a minimum frequency threshold to remove outliers.

Why?
Identifies skills that are both high-paying and frequently requested,
revealing the most valuable skills for Data Analysts to learn or improve.
*/


with skills_demand as (
SELECT 
    skill_id,
    skills,
    count(skills_job_dim.job_id) as demand_count
FROM 
    job_postings_fact
INNER JOIN
    skills_job_dim USING (job_id)
INNER JOIN
    skills_dim USING (skill_id)

WHERE
    job_title_short ILIKE '%data analyst%' AND
    job_location ILIKE '%india' AND
    salary_year_avg is NOT NULL
GROUP BY
    skill_id, skills

), average_salary as (

    SELECT 
        skill_id,
        skills,
        ROUND(AVG(salary_year_avg),2) as avg_salary
    FROM 
        job_postings_fact j
    INNER JOIN
        skills_job_dim USING (job_id)
    INNER JOIN
        skills_dim USING (skill_id)

    WHERE
        job_title_short ILIKE '%data analyst%' AND
        job_location ILIKE '%india' AND
        salary_year_avg is NOT NULL

    GROUP BY
        skill_id,skills
   


)

SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    avg_salary
FROM
    skills_demand
INNER JOIN
    average_salary
using (skill_id)
ORDER BY
 avg_salary DESC,demand_count DESC



-- code 2 (Works same but concise)



SELECT 
    s.skill_id,
    s.skills,
    COUNT(sj.job_id) AS demand_count,
    ROUND(AVG(j.salary_year_avg), 2) AS avg_salary
FROM 
    job_postings_fact AS j
INNER JOIN
    skills_job_dim AS sj ON j.job_id = sj.job_id
INNER JOIN
    skills_dim AS s ON sj.skill_id = s.skill_id
WHERE
    j.job_title_short ILIKE 'Data Analyst'
    AND j.salary_year_avg IS NOT NULL
    AND job_location ILIKe '%india'
GROUP BY 
    s.skill_id, s.skills
HAVING 
    COUNT(sj.job_id) > 10
ORDER BY 
    avg_salary DESC,
    demand_count DESC



