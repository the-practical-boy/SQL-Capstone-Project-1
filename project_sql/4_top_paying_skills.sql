/*
Question: What are the top skills based on salary?

- Look at the average salary associated with each skill for Data Analyst positions.
- Focuses on roles with specified salaries, regardless of location.

Why?
It reveals how different skills impact salary levels for Data Analysts
and helps identify the most financially rewarding skills to acquire or improve.
*/

SELECT 
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
    skills
HAVING
    COUNT(j.job_id)>=3
ORDER BY
    avg_salary DESC
LIMIT 20

/*
💡 Insights — Top Paying Skills for Data Analysts (India-Filtered)

Although the data was filtered for job postings mentioning India, the salaries are still in USD, reflecting global roles accessible to India-based professionals (including remote/hybrid positions).
These results reveal which skills command the highest global pay for data analysts in or from India.

🧩 Skill Category Insights
Category	Example Skills	Key Insight
🧠 Data Engineering & Big Data	Databricks, Spark, Airflow, Hadoop, Scala, Snowflake	Highest-paying domain — powering data pipelines, ETL, and scalable analytics.
🐍 Data Processing (Python Stack)	Pandas, PySpark	Strong demand for Python-driven data wrangling and automation.
☁️ Cloud Platforms	AWS, Azure, BigQuery, Redshift	Cloud proficiency pushes salary premium across all analyst roles.
📊 BI & Visualization	Power BI, Looker, Tableau	Still core to business communication — solid pay with lower entry barrier.
🏢 Enterprise Systems	SAP, Oracle, Unix	Legacy tech remains lucrative in large corporations and finance.
💰 Key Takeaways

Databricks, Spark, and Airflow dominate top-tier pay — they form the modern data engineering core.

Pandas + Python remain universal — every analyst still needs them for data handling.

Visualization tools like Power BI are still crucial for business-facing roles, maintaining strong salaries.

Cloud + automation experience consistently leads to global-level compensation even for India-based analysts.

The real money lies in the hybrid zone — analysts who understand both business insight and data infrastructure.

🎯 Summary

The transition from “Data Analyst” to “Data Engineer” or “Analytics Engineer” skillsets — combining SQL, Python, BI, Cloud, and Big Data tools — is where India-based professionals unlock the highest global salaries.
*/