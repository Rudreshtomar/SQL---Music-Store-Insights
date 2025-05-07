# 🎵 Music Store Data Analysis using SQL 📊

## 📖 Project Overview
This project provides deep insights into a **digital music store** database using **SQL**. It covers customer behaviors, sales trends, and artist performances by analyzing invoices, tracks, genres, and more. The goal is to answer key business questions and help make data-driven decisions for marketing and revenue optimization.

## 💼 Business Problem
The music store wants to:
- Understand its top-performing artists, cities, and customers.
- Identify rock music listeners and top genres.
- Recognize patterns in song length and invoice totals.
- Prepare for promotions like music festivals and personalized offers.

## 🧠 Solution Approach
- Used **PostgreSQL** with **pgAdmin 4** to explore the relational schema.
- Wrote **optimized SQL queries** to solve 8 business problems categorized as **easy and moderate**.
- Joined multiple tables such as `Customer`, `Invoice`, `Track`, `Artist`, `Genre`, and others.
- Used filtering, aggregation, sorting, and subqueries to extract insights.

## 📊 SQL Queries & Insights

### 1️⃣ Who is the senior most employee based on job title?
```sql
SELECT * FROM employee
ORDER BY title DESC
LIMIT 1;
````

### 2️⃣ Which countries have the most invoices?

```sql
SELECT billingcountry, COUNT(*) AS total_invoices
FROM invoice
GROUP BY billingcountry
ORDER BY total_invoices DESC;
```

### 3️⃣ What are the top 3 values of total invoice?

```sql
SELECT total
FROM invoice
ORDER BY total DESC
LIMIT 3;
```

### 4️⃣ Which city has the best customers (highest total sales)?

```sql
SELECT billingcity, SUM(total) AS total_sales
FROM invoice
GROUP BY billingcity
ORDER BY total_sales DESC
LIMIT 1;
```

### 5️⃣ Who is the best customer (spent the most)?

```sql
SELECT customer.customerid, firstName, lastName, SUM(total) AS total_spent
FROM invoice
JOIN customer ON invoice.customerid = customer.customerid
GROUP BY customer.customerid
ORDER BY total_spent DESC
LIMIT 1;
```

### 6️⃣ List all Rock Music listeners ordered by email

```sql
SELECT DISTINCT email, firstname, lastname
FROM customer
JOIN invoice ON customer.customerid = invoice.customerid
JOIN invoiceline ON invoice.invoiceid = invoiceline.invoiceid
JOIN track ON track.trackid = invoiceline.trackid
JOIN genre ON track.genreid = genre.genreid
WHERE genre.name = 'Rock'
ORDER BY email;
```

### 7️⃣ Top 10 Rock Bands (by number of Rock tracks)

```sql
SELECT artist.artist_id, artist.name, COUNT(track.trackid) AS number_of_songs
FROM track
JOIN album ON album.album_id = track.album_id
JOIN artist ON artist.artist_id = album.artist_id
JOIN genre ON genre.genre_id = track.genre_id
WHERE genre.name = 'Rock'
GROUP BY artist.artist_id
ORDER BY number_of_songs DESC
LIMIT 10;
```

### 8️⃣ Tracks longer than average song length

```sql
SELECT name, milliseconds
FROM track
WHERE milliseconds > (
    SELECT AVG(milliseconds) FROM track
)
ORDER BY milliseconds DESC;
```

## 🧰 Tech Stack

| Component      | Description                      |
| -------------- | -------------------------------- |
| Language       | SQL (PostgreSQL)                 |
| Tools          | pgAdmin 4, DBeaver               |
| Dataset Format | Relational DB Schema (11 Tables) |
| Files Included | `.sql`, `.zip`, `.png`, `.pdf`   |

## 🗂️ Project Structure

| File Name                   | Description                              |
| --------------------------- | ---------------------------------------- |
| `InsightsUsingPGAdmin4.sql` | SQL queries for solving 8 business tasks |
| `music store data.zip`      | Raw database files                       |
| `MusicDatabaseSchema.png`   | ER diagram of the music database         |
| `ProblemStatement.pdf`      | List of business questions               |
| `README.md`                 | Project summary and insights             |

## 💡 Key Business Insights

| Area              | Insight                                                          |
| ----------------- | ---------------------------------------------------------------- |
| 🎧 Top Customers  | The highest spender is identified with exact customer details    |
| 🏙️ Top City      | The city contributing the most to revenue is targeted for events |
| 🎸 Rock Listeners | Specific customers interested in Rock music are identified       |
| 📀 Top Artists    | The top 10 Rock bands are ranked by track count                  |
| ⏱️ Song Duration  | Longest songs exceeding average duration are discovered          |

## 🧠 Skills Demonstrated

* ✅ Advanced Joins across multiple tables
* ✅ Filtering with `WHERE`, `HAVING`, and `LIKE`
* ✅ Grouping & Aggregation (`SUM()`, `AVG()`, `COUNT()`)
* ✅ Subqueries and Correlated Subqueries
* ✅ Ordering and Limiting Results
* ✅ Writing optimized, readable SQL

## 🧾 Final Conclusion (For Interview)

> "This project reflects my ability to extract meaningful insights from a normalized relational database using complex joins and aggregations. I started by understanding the schema, then solved real business problems through SQL. I can clearly communicate findings and support business strategies with data — such as identifying Rock music lovers or planning promotional events in high-revenue cities. The project also demonstrates my capability to write clean, optimized queries using tools like pgAdmin and DBeaver."

## 📲 Connect With Me

[![LinkedIn](https://img.shields.io/badge/LinkedIn--%230077B5?style=for-the-badge\&logo=linkedin\&logoColor=white)](https://www.linkedin.com/in/rudreshtomar5/)
[![Gmail](https://img.shields.io/badge/Gmail--D14836?style=for-the-badge\&logo=gmail\&logoColor=white)](mailto:rudreshtomar5@gmail.com)

© 2025 Music Store SQL Analysis Project | Rudresh Tomar
