--Q1 Who is the senior most employee based on job title?

SELECT * FROM employee
ORDER BY levels DESC 
LIMIT 1

--Q2 Which countries have the most Invoices?
SELECT billing_country, COUNT(total) AS Most_invoice
FROM invoice
GROUP BY 1
ORDER BY Most_invoice DESC 

--Q3 What are top 3 values of total invoice?

SELECT total AS top_value
FROM invoice
ORDER BY top_value DESC 
LIMIT 3

--Q4 Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money. Write a query that returns one city that has the highest sum of invoice totals. Return both the city name & sum of all invoice totals

SELECT billing_city, SUM(total) AS Total_invoice
FROM invoice
GROUP BY 1 
ORDER BY Total_invoice DESC
LIMIT 1

--Q5 Who is the best customer? The customer who has spent the most money will be declared the best customer. Write a query that returns the person who has spent the most money

SELECT customer.customer_id, customer.first_name, customer.last_name, SUM(invoice.total) as highest_Sum
FROM customer
JOIN invoice ON customer.customer_id = invoice.customer_id
GROUP BY customer.customer_id 
ORDER BY highest_Sum DESC 
LIMIT 1


------------------------------ INTERMEDIATE LEVEL --------------------------------------------- 


--Q6 Write query to return the email, first name, last name, & Genre of all Rock Music listeners. Return your list ordered alphabetically by email starting with A


SELECT DISTINCT email AS Email,first_name AS FirstName, last_name AS LastName, genre.name AS Name
FROM customer
JOIN invoice ON invoice.customer_id = customer.customer_id
JOIN invoice_line ON invoice_line.invoice_id = invoice.invoice_id
JOIN track ON track.track_id = invoice_line.track_id
JOIN genre ON genre.genre_id = track.genre_id
WHERE genre.name = 'Rock'
ORDER BY email;

--Q7 Let's invite the artists who have written the most rock music in our dataset. Write a query that returns the Artist name and total track count of the top 10 rock bands


SELECT artist.Artist_id, artist.name,  COUNT(*) AS NumberOfSongs
FROM track
JOIN genre ON track.genre_id = genre.Genre_id
JOIN album ON track.album_id = album.Album_id
JOIN artist ON album.artist_id = artist.artist_id
WHERE genre.Name = 'Rock'
GROUP BY artist.artist_id, artist.name
ORDER BY NumberOfSongs DESC
LIMIT 10;

SELECT * FROM track

--Q8 Return all the track names that have a song length longer than the average song length. Return the Name and Milliseconds for each track. Order by the song length with the longest songs listed first


SELECT name, milliseconds
FROM track
WHERE milliseconds > (
   SELECT avg(milliseconds)
   FROM track)
ORDER BY milliseconds DESC

































