
# Titanic Survival Analysis Using SQL

## Overview
This project presents an exploratory data analysis of the Titanic passenger dataset using SQL. The objective was to uncover survival patterns based on gender, passenger class, age, and embarkation port. The analysis simulates a real-world database audit, applying data cleaning, querying, and basic optimization.

## Methodology
- The dataset (`train.csv`) was imported into a MySQL database for analysis.
- Data cleaning included checking for missing values and duplicates.
- SQL queries explored survival rates across various dimensions such as gender, class, and age.
- An index was created on survival, gender, and class fields to optimize query performance.

## Key SQL Queries
```sql
SELECT ROUND(AVG(Survived) * 100, 2) AS SurvivalRatePercentage FROM titanic;
SELECT Sex, ROUND(AVG(Survived) * 100, 2) AS SurvivalRatePercentage FROM titanic GROUP BY Sex;
SELECT Pclass, ROUND(AVG(Survived) * 100, 2) AS SurvivalRatePercentage FROM titanic GROUP BY Pclass ORDER BY Pclass;
SELECT Survived, ROUND(AVG(Age), 2) AS AverageAge FROM titanic GROUP BY Survived;
SELECT Embarked, COUNT(*) AS PassengerCount FROM titanic GROUP BY Embarked ORDER BY PassengerCount DESC LIMIT 1;
```

## Key Insights
- Women had a significantly higher survival rate (74%) than men (19%), reflecting the priority given during evacuation.
- First-class passengers had a survival rate of 63%, higher than second and third classes.
- Age did not show a major survival pattern.
- Most passengers boarded at Southampton.

## Challenges and Learnings
I encountered challenges in importing data due to MySQL Workbench’s file-loading restrictions and overcame this by learning terminal import methods. Indexing and query optimization helped improve my understanding of SQL performance tuning.

## About Me
I am Pooja Mehra, an aspiring data analyst passionate about SQL, data storytelling, and uncovering actionable insights. My work focuses on delivering clear, business-relevant findings through structured analysis.

## Repository
[View code on GitHub](https://github.com/data-made-easy-with-us-24-7/titanic-sql-analysis)
