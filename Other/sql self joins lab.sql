SELECT concat(aa.first_name,' ',aa.last_name),concat (ab.first_name,' ',ab.last_name) 
FROM sakila.actor as aa
inner join sakila.film_actor as f using (actor_id)
inner join sakila.film_actor as f2 on (f.film_id=f2.film_id) and (f.actor_id != f2.actor_id)
inner join sakila.actor as ab on (ab.actor_id=f2.actor_id);

