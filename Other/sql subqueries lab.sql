SELECT f.title, count(i.inventory_id) FROM sakila.inventory as i
join sakila.film as f using (film_id)
where title = 'Hunchback Impossible';

select title, length from sakila.film
where length > (select avg(length) from sakila.film);

select first_name, last_name from sakila.actor 
where actor_id in (select actor_id
from sakila.film_actor
where film_id = (
select film_id
from sakila.film
where title = 'ALONE TRIP'
)
);

select title from sakila.film 
where film_id in 
(select film_id from film_category 
where category_id in 
(select category_id from category 
where name = 'Family')); 

select first_name,last_name,email, country from customer as c
join address as a using (address_id)
join city as ci using (city_id)
join country as co using (country_id)
where country = 'Canada'; 

select first_name,last_name,email from customer 
where address_id in 
(select address_id from address 
where city_id in
(select city_id from city 
where country_id = 
(select country_id from country 
where country = 'Canada')));

select fa.actor_id,fa.film_id,f.title 
from film_actor as fa 
join film as f using (film_id) 
where fa.actor_id = 
(select actor_id as count from film_actor 
group by actor_id 
order by count desc
limit 1);

select p.customer_id,f.film_id,f.title
from film as f 
join inventory as i using (film_id)
join rental as r using (inventory_id)
join payment as p using (rental_id)
where p.customer_id = 
(select customer_id from payment 
group by customer_id 
order by sum(amount) desc
limit 1);

select p.customer_id,f.film_id,f.title
from film as f 
join inventory as i using (film_id)
join rental as r using (inventory_id)
join payment as p using (rental_id)
where p.customer_id in  
(select customer_id from payment 
group by customer_id
having avg(amount) > (select avg(amount) from payment) 
order by sum(amount) desc);



