Lab 4: Advanced SQL - Joins, Aggregates, and Subqueries
Course: CMPT 308 - Database Management

Author: Daniel

Date: February 26, 2026

Project Overview
This laboratory exercise demonstrates proficiency in writing complex SQL queries using PostgreSQL. The tasks cover a range of relational database operations including multiple-table joins, grouped aggregations with filtering, nested subqueries, and set operations. Additionally, it includes a comparative analysis of AI-generated SQL solutions.

Database Schema
The queries in this lab operate on a university database schema consisting of three primary tables:

Students: Contains student IDs, names, and majors.

Courses: Contains course IDs and titles.

Enrollments: Maps students to courses and tracks the specific term (e.g., 2026SP).

How to Run the SQL
Environment: Ensure you have PostgreSQL installed and pgAdmin 4 (or a similar tool) connected to your database.

Setup: * If the tables do not exist, run your CREATE and INSERT scripts from Weeks 2–3.

Ensure there is at least one course in the Courses table that has no corresponding entries in Enrollments for the 2026SP term to verify LEFT JOIN functionality.

Execution:

Open lab4.sql in your Query Tool.

Execute the script. The results for Parts A through D will be generated sequentially.

Contents
lab4.sql: The complete SQL script containing all queries for Parts A, B, C, and D.

Lab4_Submission.pdf: Documentation containing screenshots of the query results and the Part E AI reflection.

Reflection (Part E Summary)
For this lab, I compared GitHub Copilot and Gemini. Both tools successfully identified the nuances of the "Zero Enrollment" task, specifically the requirement to place the term filter within the JOIN...ON clause rather than the WHERE clause to maintain the integrity of the LEFT JOIN.

Final Steps for Submission:

File Name: Save the content above as README.md inside your lab4 folder.

Git Commands:

Bash
git add README.md lab4.sql
git commit -m "Add README and final SQL for Lab 4"
git push origin main
Verification: Go to your GitHub repo in the browser and make sure you see the lab4 folder with your files inside.
