/*
Question: What are the most in-demand skills for data analysts?

- Join job_postings to the inner join table similar to Query 2.
- Identify the top 5 in-demand skills for a data analyst.
- Focus on all job postings.

Why?
Retrieves the top 5 skills with the highest demand in the job market,
providing insights into the most valuable skills for job seekers.
*/


SELECT 
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
    job_location ILIKE '%india'
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5


/*
💡 Question

What are the most in-demand skills for Data Analysts in India?

Goal: Identify which skills appear most often in job postings to understand what employers value the most.

🧾 Query Output
Rank	Skill	Demand Count
1️⃣	SQL	3,145
2️⃣	Python	2,178
3️⃣	Excel	1,988
4️⃣	Tableau	1,628
5️⃣	Power BI	1,212


🧠 Insights

SQL is king — almost every analyst job lists it. It’s your base survival skill.

Python has clearly moved beyond data science — it’s now core for analytics automation.

Excel still dominates practical business reporting; don’t underestimate it.

Tableau and Power BI show that visualization + storytelling remain key hiring points.

➡️ Together, these 5 form the core India-market skill stack for Data Analysts.
*/