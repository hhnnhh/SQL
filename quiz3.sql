
Module 3



/* (1) Using a subquery, find the names of all the tracks for the album "Californication".*/

SELECT TrackId
,Name
,AlbumId
FROM Tracks
WHERE AlbumId IN (SELECT AlbumId
FROM albums
WHERE Title ='Californication');

/*SELECT AlbumId
FROM albums
WHERE Title ='Californication'*/

/*SELECT TrackId
,Name
,AlbumId
FROM Tracks
WHERE AlbumId = 195*/

/*(2) Find the total number of invoices for each customer along with the customer's full name, city and email.*/

SELECT COUNT(InvoiceId)
--,InvoiceId
,invoices.CustomerId
,Customers.LastName
,Customers.FirstName
,Customers.Email
FROM invoices
LEFT JOIN Customers ON invoices.CustomerId=customers.CustomerId
Group BY customers.CustomerId

/* (3) Retrieve the track name, album, artistID, and trackID for all the albums.

SELECT
albums.Title
,tracks.TrackId
,tracks.Name
FROM albums
LEFT JOIN tracks ON albums.AlbumId=tracks.AlbumId
WHERE albums.Title LIKE 'For%'

/* (4) Retrieve a list with the managers last name, and the last name of the employees who report to him or her.*/

select mgr.LastName Manager, e.LastName Employee
from Employees e
left join Employees mgr
on e.ReportsTo = mgr.EmployeeId 

/* (5) Find the name and ID of the artists who do not have albums. */

SELECT 
albums.title
,artists.name
FROM artists
LEFT JOIN albums ON albums.ArtistId=artists.ArtistId
WHERE albums.title IS NULL


/* (6) Use a UNION to create a list of all the employee's and customer's first names and last names ordered by the last name in descending order.*/

select e.FirstName, e.LastName
from Employees e
UNION
select c.FirstName, c.LastName
from Customers c
order by c.LastName DESC

/* (7) See if there are any customers who have a different city listed in their billing city versus their customer city.*/


select c.CustomerId, c.FirstName, c.LastName, c.City
from Customers c
join Invoices i
on c.CustomerId = i.CustomerId
where c.City <> i.BillingCity
