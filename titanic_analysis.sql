-- Create the DB
CREATE DATABASE IF NOT EXISTS titanic_db;

-- Select the DB
USE titanic_db;


-- Data cleaning queries
SELECT 
  SUM(Age IS NULL) AS MissingAge, 
  SUM(Embarked IS NULL) AS MissingEmbarked, 
  SUM(Cabin IS NULL) AS MissingCabin
FROM titanic;

SELECT PassengerId, COUNT(*) AS cnt 
FROM titanic 
GROUP BY PassengerId 
HAVING cnt > 1;

-- Analysis queries

-- Overall survival rate
SELECT 
  ROUND(AVG(Survived) * 100, 2) AS SurvivalRatePercentage
FROM titanic;
-- This query calculates the percentage of passengers who survived.
-- SurvivalRatePercentage: 38.38 %

-- Survival patterns by gender
SELECT 
  Sex,
  ROUND(AVG(Survived) * 100, 2) AS SurvivalRatePercentage
FROM titanic
GROUP BY Sex;
-- This query shows survival rates separately for male and female passengers.
-- MALE 18.89%
-- WOMEN 74.20

-- Survival patterns by passenger class
SELECT 
  Pclass,
  ROUND(AVG(Survived) * 100, 2) AS SurvivalRatePercentage
FROM titanic
GROUP BY Pclass
ORDER BY Pclass;
-- This query displays survival rates for each passenger class (1st, 2nd, 3rd).
-- PCLASS   SurvivalRatePercentage
-- 1		62.96
-- 2		47.28
-- 3		24.24


-- Average age of survivors vs non-survivors
SELECT 
  Survived,
  ROUND(AVG(Age), 2) AS AverageAge
FROM titanic
GROUP BY Survived;
-- This query compares the average age of survivors (1) and non-survivors (0).
-- survivors (1) 		23.65 AVG AGE
-- non-survivors (0)	24.03 AVG AGE

-- Most common embarkation port
SELECT 
  Embarked,
  COUNT(*) AS PassengerCount
FROM titanic
GROUP BY Embarked
ORDER BY PassengerCount DESC
LIMIT 1;
-- This identifies the port with the highest number of passengers.
-- EMBARKED 	PassengerCount
-- S  			644

-- Null values count for Age and Cabin
SELECT 
  SUM(Age IS NULL) AS MissingAgeCount,
  SUM(Cabin IS NULL) AS MissingCabinCount
FROM titanic;
-- Double-check for any missing Age or Cabin values.
-- MissingAgeCount		MissingCabinCount
-- 0					0


-- Index for optimization
-- Index created to optimize survival-related queries.
CREATE INDEX idx_survived_sex_pclass ON titanic (Survived, Sex, Pclass);




