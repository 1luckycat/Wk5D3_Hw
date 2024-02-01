-- Week 5 Day 3 Homework --


--1.  List all customers who live in Texas (use JOINs)
select first_name, last_name, district
from customer 
left join address
on customer.address_id = address.address_id 
where district = 'Texas';


--2.  Get all payments above $6.99 with the Customer's Full Name
select first_name, last_name, amount
from payment 
inner join customer 
on payment.customer_id = customer.customer_id
where amount > 6.99;


--3.  Show all customers names who have made payments over $175 (use subqueries)
select first_name, last_name
from customer 
where customer_id in (
	select customer_id 
	from payment 
	group by customer_id 
	having sum(amount) > 175
	order by sum(amount) desc
);


--4.  List all customers that live in Nepal (use the city table)
select *
from customer 
inner join address
on customer.address_id = address.address_id
inner join city
on address.city_id = city.city_id 
inner join country 
on city.country_id = country.country_id 
where country = 'Nepal';


--5.  Which staff member had the most transactions?
select staff.first_name, staff.last_name, count(payment.amount)
from staff 
inner join payment 
on staff.staff_id = payment.staff_id
group by staff.staff_id
order by staff.staff_id desc
limit 1;


--6.  How many movies of each rating are there?
select rating, count(film_id)
from film 
group by rating
order by count(film_id);


--7.  Show all customers who have made a single payment above $6.99 (Use Subqueries)
select customer_id, first_name, last_name
from customer 
where customer_id in (
	select customer_id
	from payment
	where payment.amount > 6.99
	group by customer_id
	having count(amount) = 1
);


--8.  How many free rentals did our stores give away?
select count(rental), amount
from rental
inner join payment
on rental.rental_id = payment.rental_id 
where amount = 0
group by payment.amount;



