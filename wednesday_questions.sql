-- 1.
SELECT first_name, last_name
FROM customer
JOIN address ON customer.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
JOIN country ON city.country_id = country.country_id
WHERE country = 'United States' and city = 'Texas';

-- 2.
SELECT CONCAT(first_name, ' ', last_name) AS Customer_Name, amount
FROM payment
JOIN customer ON payment.customer_id = customer.customer_id
WHERE payment.amount > 6.99;

-- 3.
SELECT CONCAT(first_name, ' ', last_name) AS Customer_Name
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING SUM(amount) > 175
);

-- 4.
SELECT CONCAT(first_name, ' ', last_name) AS customer_name
FROM customer
JOIN address ON customer.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
JOIN country ON city.country_id = country.country_id
WHERE country = 'Nepal';

-- 5.
SELECT CONCAT(first_name, ' ', last_name) AS Staff_Member, COUNT(payment.staff_id) AS transactions
FROM staff
JOIN payment ON staff.staff_id = payment.staff_id
GROUP BY staff.staff_id
ORDER BY transactions desc;

-- 6.
SELECT rating, COUNT(film_id) 
FROM film
GROUP BY rating;

-- 7.
SELECT CONCAT(first_name, ' ', last_name) AS customers
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    WHERE amount > 6.99
    GROUP BY customer_id
    HAVING COUNT(payment_id) = 1
);

-- 8.
SELECT COUNT(amount) AS "Free???????"
FROM rental
JOIN payment ON rental.rental_id = payment.rental_id
WHERE payment.amount = 0.00;