------------------SOLVED---------------------------

-- Cual es la pelicula mas popular 
-- Por semana :

select p.titulo, COUNT(a.id_alquiler) "cantidad"
from pelicula p 
inner join casete c on c.id_pelicula = p.id_pelicula
inner join alquiler a on a.id_casete = c.id_casete
where EXTRACT (DAY FROM (NOW()-a.fecha_alquiler)) <= 7
group by p.titulo order by cantidad DESC;

-- Por mes:

select p.titulo, COUNT(a.id_alquiler) "cantidad"
from pelicula p 
inner join casete c on c.id_pelicula = p.id_pelicula
inner join alquiler a on a.id_casete = c.id_casete
where EXTRACT (DAY FROM (NOW()-a.fecha_alquiler)) <= 30
group by p.titulo order by cantidad DESC;

-- Por ano:

select p.titulo, COUNT(a.id_alquiler) "cantidad"
from pelicula p 
inner join casete c on c.id_pelicula = p.id_pelicula
inner join alquiler a on a.id_casete = c.id_casete
where EXTRACT (DAY FROM (NOW()-a.fecha_alquiler)) <= 365
group by p.titulo order by cantidad DESC;

----------------------------------------------

-- Cuales son las 5 peliculas menos populares?

select p.titulo, COUNT(a.id_alquiler) "cantidad"
from pelicula p 
inner join casete c on c.id_pelicula = p.id_pelicula
inner join alquiler a on a.id_casete = c.id_casete
group by p.titulo order by cantidad DESC limit 1;

-------------------------------------------

-- Cual actor aparece en mas peliculas?

select a.nombre, COUNT(r.id_pelicula) "cantidad"
from actor a
inner join reparto r on r.id_actor = a.id_actor
group by a.nombre order by cantidad DESC limit 1;

-->respuesta: Tuan Lind | 7 repartos!!

-------------------------------------------

--Cual es la categoria de peliculas mas solicitada?

select p.categoria, COUNT(a.id_alquiler) "cantidad"
from pelicula p
inner join casete c on c.id_pelicula = p.id_pelicula
inner join alquiler a on a.id_casete = c.id_casete
group by p.categoria order by cantidad DESC limit 1;

-->respuesta: Comedia | 179 

-------------------------------------------

-- Cual es el usuario que alquilo
-- mas peliculas

select m.nombre, COUNT(a.id_casete) "cantidad"
from miembros m
inner join alquiler a on a.id_miembro = m.id_miembro
group by m.nombre order by cantidad DESC limit 2;

-->respuesta: Empate! 2 usuarios

-- menos peliculas

select m.nombre, COUNT(a.id_casete) "cantidad"
from miembros m
inner join alquiler a on a.id_miembro = m.id_miembro
group by m.nombre order by cantidad ASC;

-->respuesta: Empate!! "n" usuarios