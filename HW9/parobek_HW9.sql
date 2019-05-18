/**
* Ellie Parobek
* ISTE230-01
* HW 9
*/

USE book;

#Question 1
SELECT DISTINCT CONCAT(City, ", ", StateCode) AS "Location", COUNT(Name) AS "Count"
FROM publisher
GROUP BY City, StateCode
ORDER BY COUNT(Name) ASC;

#Question 2
SELECT book.Title, COUNT(bookreview.Rating) AS "Total Ratings", MIN(bookreview.Rating) AS "Low", MAX(bookreview.Rating) AS "High", AVG(Rating) AS "Average"
FROM book
LEFT JOIN bookreview ON bookreview.ISBN = book.ISBN
GROUP BY Title
ORDER BY COUNT(bookreview.Rating) DESC, AVG(Rating) DESC;

#Question 3
SELECT publisher.Name AS "Publisher Name", COUNT(book.Title) AS "Book Count"
FROM publisher
LEFT JOIN book ON book.PublisherID = publisher.PublisherID
GROUP BY Name
HAVING COUNT(book.Title) > 2
ORDER BY COUNT(book.Title) desc, publisher.Name asc;

#Question 4
SELECT Title, LENGTH(Title) AS "Length", SUBSTRING(title, INSTR(Title, "bill") + 4, LENGTH(Title)) AS "After Bill"
FROM book
WHERE Title LIKE "%bill%";

#Question 5
SELECT DISTINCT book.Title
FROM book 
RIGHT JOIN ownersbook ON ownersbook.ISBN = book.ISBN;