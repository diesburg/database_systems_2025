USE sakila;

SHOW columns FROM film;

-- How many movies are in the database?  Can we use MAX() and MIN()
-- to figure out the answer?

SELECT MAX(film_ID) FROM film;
SELECT MIN(film_ID) FROM film;

SELECT MAX(film_ID) - MIN(film_ID) FROM film;


-- Management wants to automatically recommend movies
-- to customers.  Can we write a query to get
-- get a random movie to recomend based on film_id?
-- (IDs range from 1 to 1000)

-- Play with random
SELECT RAND();

SELECT RAND()*100;

SELECT ROUND(RAND()*100,0);


-- First try:
SELECT film_id, title, description
FROM film
WHERE film_ID = ROUND(RAND()*100,0);

-- The fix
SET @rand_ID = ROUND(RAND()*100,0);

SELECT film_ID, title, description
FROM film
WHERE film_ID = @rand_ID;

-- Date and time functions

-- What are the earliest and latest rentals from sakila?
-- How long has the store been open?

SHOW columns FROM rental;

-- Minimum rental date?
SELECT MIN(rental_date) FROM rental;

-- What month did they open?
SELECT MONTH(MIN(rental_date)) FROM rental;

-- Maximum rental date?
SELECT MAX(rental_date) FROM rental;

-- Get the difference?
SELECT MAX(rental_date) - MIN(rental_date) from rental;

-- Try again
SELECT DATEDIFF(MAX(rental_date), MIN(rental_date)) from rental;