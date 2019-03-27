## Solution

- Cuál es la película más popular por semana?

```sql
select p.titulo, COUNT(a.id_alquiler) "cantidad"
from pelicula p
  inner join casete c on c.id_pelicula = p.id_pelicula
  inner join alquiler a on a.id_casete = c.id_casete
where EXTRACT (DAY FROM (NOW()-a.fecha_alquiler)) <= 7
group by p.titulo order by cantidad DESC;
```

- Cuál es la película más popular por mes?

```sql
select p.titulo, COUNT(a.id_alquiler) "cantidad"
from pelicula p
  inner join casete c on c.id_pelicula = p.id_pelicula
  inner join alquiler a on a.id_casete = c.id_casete
where EXTRACT (DAY FROM (NOW()-a.fecha_alquiler)) <= 30
group by p.titulo order by cantidad DESC;
```

- Cuál es la película más popular por año?

```sql
select p.titulo, COUNT(a.id_alquiler) "cantidad"
from pelicula p
  inner join casete c on c.id_pelicula = p.id_pelicula
  inner join alquiler a on a.id_casete = c.id_casete
where EXTRACT (DAY FROM (NOW()-a.fecha_alquiler)) <= 365
group by p.titulo order by cantidad DESC;
```

- Cuáles son las 5 películas menos populares?

```sql
select p.titulo, COUNT(a.id_alquiler) "cantidad"
from pelicula p
  inner join casete c on c.id_pelicula = p.id_pelicula
  inner join alquiler a on a.id_casete = c.id_casete
group by p.titulo order by cantidad DESC limit 1;
```

- Cuál actor aparece en más películas?

```sql
select a.nombre, COUNT(r.id_pelicula) "cantidad"
from actor a
  inner join reparto r on r.id_actor = a.id_actor
group by a.nombre order by cantidad DESC limit 1;
```

- Cuál es la categoría de películas más solicitada?

```sql
select p.categoria, COUNT(a.id_alquiler) "cantidad"
from pelicula p
  inner join casete c on c.id_pelicula = p.id_pelicula
  inner join alquiler a on a.id_casete = c.id_casete
group by p.categoria order by cantidad DESC limit 1;
```

- Cuál es el usuario que ha alquilado más películas?

```sql
select m.nombre, COUNT(a.id_casete) "cantidad"
from miembros m
inner join alquiler a on a.id_miembro = m.id_miembro
group by m.nombre order by cantidad DESC limit 2;
```

- Cuál es el usuario que ha alquilado que menos películas?

```sql
select m.nombre, COUNT(a.id_casete) "cantidad"
from miembros m
inner join alquiler a on a.id_miembro = m.id_miembro
group by m.nombre order by cantidad ASC;
```
