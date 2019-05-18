/**
* Ellie Parobek
* ISTE230-01
* HW 8
*/

USE jobs;

#Question 1
SELECT statecode FROM employer
UNION
SELECT location FROM quarter;

#Question 2
SELECT employer.companyname, employer.division, employer.statecode, interview.salaryoffered
FROM employer, interview
WHERE employer.companyname = interview.companyname 
AND employer.division = interview.division;

#Question 3
SELECT state.statecode, state.description
FROM state
LEFT JOIN employer ON state.statecode = employer.statecode
WHERE employer.statecode IS NULL;

#Question 4
SELECT DISTINCT companyname, minhrsoffered
FROM interview;

#Question 5
SELECT statecode, description
FROM state
WHERE description LIKE '__a%'
OR description LIKE '__e%'
OR description LIKE '__i%'
OR description LIKE '__o%'
OR description LIKE '__u%';

#Question 6
SELECT qtrcode, location, description
FROM quarter
LEFT JOIN state ON state.statecode = quarter.location;

#Question 7
SELECT state.description, employer.companyname
FROM state
LEFT JOIN employer ON state.statecode = employer.statecode;