/*
Question: What skills are required for the top-paying data analyst jobs?

- Use the top 10 highest-paying Data Analyst jobs from the first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills, helping job seekers understand which skills to develop that align with top salaries

*/

With top_paying_job as (
SELECT 
    job_id,
    job_title,
    name as company_name,
    salary_year_avg,
    job_location
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
)

select 
    top_paying_job.*,
    skills
 from top_paying_job
INNER JOIN skills_job_dim USING (job_id)
inner JOIN skills_dim using (skill_id)

ORDER BY
    salary_year_avg DESC


/*
🧠 SQL Project: Top-Paying Data Analyst Jobs in India
Step 1 — Job & Skill Extraction
🧩 Query Summary

This SQL query identifies the top 10 highest-paying “Data Analyst” roles in India from the dataset and lists the skills required for each.

Key logic:

Filters jobs by job_title_short ILIKE 'data analyst' and job_location ILIKE '%India'.

Ensures salary_year_avg IS NOT NULL.

Returns top 10 by highest salary.

Joins with skill tables to display skills associated with each top-paying job.

💼 Sample Roles Found
Job Title	Company	Salary (₹/yr)	Location
Technical Data Architect - Healthcare	Srijan Technologies	₹16.5 LPA	Gurugram
Data Architect - Data Migration	Bosch Group	₹16.5 LPA	Bengaluru
Data Architect 2023	Bosch Group	₹16.5 LPA	Bengaluru
Data Architect	Eagle Genomics	₹16.3 LPA	Hyderabad
Senior Business & Data Analyst	Deutsche Bank	₹11.9 LPA	India
Sr. Enterprise Data Analyst	ACA Group	₹11.8 LPA	India
Mobility Data Analyst	Bosch Group	₹11.1 LPA	Bengaluru
Senior Methods & Data Analyst	NielsenIQ	₹11.1 LPA	Pune


📊 Top Skills Mentioned (by frequency)
Rank	Skill	Mentions	Insight
1️⃣	SQL	~7	Foundation for every analyst/architect role.
2️⃣	Python	~6	Used for data cleaning, automation, and analytics.
3️⃣	Power BI	~4	Common visualization + reporting skill.
4️⃣	Azure	~4	Cloud environment for modern data pipelines.
5️⃣	AWS	~3	Secondary but strong cloud skill.
6️⃣	Spark	~3	Big data processing, key for high-salary roles.
7️⃣	Oracle	~3	Legacy + migration-heavy enterprise systems.
8️⃣	Databricks / Snowflake / Hadoop	~2	Modern data infra — boosts pay.
9️⃣	Pandas	~2	Core Python library for data manipulation.
🔟	R / Excel	~2	Still valuable for analytics/reporting.

Other notable single mentions:
Kafka, Airflow, Docker, Kubernetes, Jenkins, Flow, Confluence, Jira, etc.
→ These indicate pipeline orchestration and DevOps alignment — premium skillsets.

💰 Key Insights

Top-paying Data Analyst roles are hybrid → blend of analytics, cloud, and data engineering.

High-salary roles (₹15L+) emphasize SQL, Python, Spark, and Cloud (Azure/AWS).

Visualization tools like Power BI remain relevant even in data architect-level roles.

Enterprise stack exposure (Oracle, Databricks, Jenkins, Airflow) pushes you into premium pay zones.

🎯 Skill Focus Roadmap

To align with these trends, focus learning in this order:

SQL (Advanced) → CTEs, window functions, subqueries

Python (pandas, numpy, matplotlib)

Power BI (Dashboarding + DAX)

Cloud (Azure preferred; AWS secondary)

Spark / Databricks (for big data workflows)
*/