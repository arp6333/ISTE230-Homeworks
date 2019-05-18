/*
	Ellie Parobek, HW3 Part1
*/

use world;

#Question 1
SELECT HeadOfState 
FROM Country 
WHERE Name LIKE "United States";

#Question 2
UPDATE Country
SET HeadOfState="Barack H. Obama II" 
WHERE Name LIKE "United States";

#Question 3
SELECT Name 
FROM Country 
WHERE IndepYear IS NULL;

#Question 4
SELECT Name, Continent 
FROM Country 
WHERE Population>=1000000 AND LifeExpectancy>=70 AND LifeExpectancy<=80;

#Question 5
SELECT Name 
FROM Country 
WHERE Continent="North America" or Continent="South America";