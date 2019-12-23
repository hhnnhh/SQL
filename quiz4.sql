SQL QUIZ COURSERA 23.12.2019

QUIZ 4
/* (1) Pull a list of customer ids with the customer’s full name, and address, along with combining their city and country together. Be sure to make a space in between these two and make it UPPER CASE.*/

SELECT
customers.customerId
,customers.LastName
,customers.FirstName
,customers.address
--,customers.city
--,customers.Country
,upper(customers.city||' '||customers.country)
FROM customers

/* (2)Create a new employee user id by combining the first 4 letters of the employee’s first name with the first 2 letters of the employee’s last name. Make the new field lower case and pull each individual step to show your work.*/

SELECT lower(substr(employees.Firstname,1,4)||substr(employees.Lastname,1,2))
,employees.employeeid
--,(first||last)
FROM employees

/*(3) Show a list of employees who have worked for the company for 15 or more years using the current date function. Sort by lastname ascending.*/

SELECT employees.lastname
,STRFTIME('%Y-%m-%d',employees.HireDate)
--,Date((‘now’))-employees.HireDate)
,Date(('now'))
,Date(('now'))-(STRFTIME('%Y-%m-%d',employees.HireDate)) as YEARS
FROM employees
WHERE YEARS > 15 
ORDER BY employees.lastname ASC

/* (4) Profiling the Customers table, answer the following question: Are there any
columns with NULL values: address, lastname, fax, firstname, phone */

SELECT COUNT(*)
FROM Customers
WHERE [postalcode] IS NULL

/*(5) Find the cities with the most customers and rank in descending order.*/
Which of the following cities indicate having 2 customers?

SELECT customers.city,
       COUNT(*)
FROM Customers
GROUP BY customers.city
ORDER BY COUNT(*) DESC
