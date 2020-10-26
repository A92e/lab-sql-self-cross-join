use sakila;


-- Lab | SQL Self and cross join

-- 1- Get all pairs of actors that worked together.


select fa1.actor_id as actor1, fa2.actor_id as actor2, fa2.film_id from  film_actor fa1
join film_actor fa2
on fa1.actor_id <> fa2.actor_id
and fa1.film_id=fa2.film_id
order by fa1.actor_id , fa2.actor_id ;



-- 2- Get all pairs of customers that have rented the same film more than 3 times.

select c1.customer_id,c2.customer_id, count(*) as num_films
from sakila.customer c1
join rental r1
on r1.customer_id = c1.customer_id
join inventory i1
on i1.inventory_id = r1.inventory_id
join film f1
on i1.film_id = f1.film_id
join inventory i2
on i2.film_id = f1.film_id
join rental r2
on r2.inventory_id = i2.inventory_id
join customer c2
on r2.customer_id = c2.customer_id
where c1.customer_id <> c2.customer_id
group by f1.film_id 

having count(*)>3 order by num_films desc;


--  3- Get all possible pairs of actors and films.

select * from (
  select  actor_id, first_name,last_name from actor
) sub1
cross join (
  select film_id from film
) sub2
order by film_id;









