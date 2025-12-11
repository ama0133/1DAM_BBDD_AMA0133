select * from jugador;
select * from equipo;
select * from partido;

-- Alejandro Montilla Aguilar
-- 1. Mostrar los datos de los partidos jugados en el mes de febrero.
select * 
from partido 
where month (fecha) = 2;

-- Alejandro Montilla Aguilar
-- 2. Mostrar el nombre y apellido de cada jugador en una sola columna llamada “Nombre Completo”, en MAYÚSCULAS.
-- Usararemos para la mayuscula el upper que pone todo en mayuscula y el concat para agrupar los atributos en una misma columna.
select upper(concat(nombre, ' ', apellido ))
as 'nombre_completo' 
from jugador;

-- Alejandro Montilla Aguilar
-- 3. Mostrar los enlaces de las webs de los equipos que NO contengan “www”.
-- Usaremos not like para que seleccione solo cuando la web no tenga el www y ponemos el nombre del atributo 
-- y lo metemos dentro de comillas simples y ponemos %www% porque el porcentaje indica la posición.
select web 
from equipo 
where web not like '%www%';

-- Alejandro Montilla Aguilar
-- 4. Mostrar los datos de los equipos cuya web incluya la palabra “basket”.
select * 
from equipo 
where web like '%basket%';

-- Alejandro Montilla Aguilar
-- 5. Mostrar los enlaces de las webs de los equipos pero sin “http://”.
-- Usamos REPLACE para sustituir el texto por una cadena vacía.
select replace(web, 'http://', '') 
as 'web_limpia' 
from equipo;

-- Alejandro Montilla Aguilar
-- 6. Consulta que devuelva esta frase:
-- “El jugador con nombre y apellidos: Juan Carlos Navarro juega en la posición: escolta”.
select concat('El jugador con nombre y apellidos: ', nombre, ' ', apellido, ' juega en la posición: ', posicion) as 'frase'
from jugador;
 
-- Alejandro Montilla Aguilar
-- 7. Datos de los equipos cuyo nombre tenga 12 caracteres o menos.
-- Usaremos length(), que devuelve la cantidad de caracteres de la cadena proporcionada como parámetro.
select nombre 
from jugador
where length(nombre) <= 12;	

-- Alejandro Montilla Aguilar
-- 8. Datos de los jugadores que fueron dados de alta en 2008 o 2011.
select * 
from jugador 
where year(fecha_alta) in(2008, 2011);

-- Alejandro Montilla Aguilar
-- 9. Mostrar un listado de las páginas web de los equipos pero cambiando “http://” por “https://”.
select replace(web, 'http://', 'https://') 
as 'web_segura' 
from equipo;

-- Alejandro Montilla Aguilar
-- 10. Mostrar el nombre del jugador y su nombre invertido.
select nombre, reverse(nombre) as 'nombre_al_reves' 
from jugador;

-- Alejandro Montilla Aguilar
-- 11. Mostrar el nombre de los equipos rellenado por la izquierda hasta 20 caracteres con ‘*’.
-- LPAD Devuelve el texto texto1 con una longitud long, rellenando por la izquierda con texto2
select lpad(nombre, 20,'*') as 'nombre_equipo'
from equipo;

-- Alejandro Montilla Aguilar
-- 12. Mostrar el apellido de los jugadores y sus 3 primeras letras.
-- La función LEFT(apellido, 3) sirve para recortar una palabra y quedarte solo con el principio.
select apellido, left(apellido, 3) as 'abreviatura' 
from jugador;


-- Alejandro Montilla Aguilar
-- 13. Mostrar la posición en la que aparece la letra ‘a’ en el nombre del equipo.
select nombre, instr(nombre, 'a') as 'posicion_a'
from equipo;


-- Alejandro Montilla Aguilar
-- 14. Mostrar el nombre del jugador y un campo que indique:
-- 		“Veterano” si fue dado de alta antes de 2010
-- 		“Moderno” si fue dado de alta a partir de 2010 (usar CASE)
select nombre, fecha_alta,
	case 
		when year(fecha_alta) < 2010 then 'Veterano'
        else 'Moderno'
	end as resultado_por_defecto
from jugador;

-- Alejandro Montilla Aguilar
-- 15. Mostrar los jugadores cuyo apellido termina en “ez”.
select nombre, apellido
from jugador
where apellido like '%ez';

-- Alejandro Montilla Aguilar
-- 16. Mostrar los equipos ordenados por la longitud de su nombre.
select nombre  as 'nombres_ordenados'
from equipo
order by length(nombre) asc;

-- Alejandro Montilla Aguilar
-- 17. Mostrar el nombre del jugador completamente en minúsculas.
select lower(concat(nombre, ' ', apellido ))
as 'nombre_completo' 
from jugador; 

-- Alejandro Montilla Aguilar
-- 18. Mostrar el nombre del jugador y las 2 primeras letras de su apellido.
select nombre,  right(apellido, 2) as 'apellido_2_letras' 
from jugador;


-- Alejandro Montilla Aguilar
-- 19. Mostrar el nombre del jugador y el año en el que fue dado de alta.
select nombre, year(fecha_alta) as 'año_alta'
from jugador;

-- Alejandro Montilla Aguilar
-- 20. Mostrar nombre y apellido en una sola columna separados por un guion.
select concat(nombre, ' - ', apellido) as 'nombre_completo'
from jugador;


