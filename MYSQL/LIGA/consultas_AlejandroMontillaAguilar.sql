-- PRIMERA RELACIÓN – Consultas básicas
select * from jugador;
select * from equipo;
select * from partido;

-- Alejandro Montilla
-- 1. Obtener los datos de los jugadores del equipo 3 ordenados por su apellido.
select * 
from jugador
where equipo = 3;

-- Alejandro Montilla
-- 2. Jugadores que sean escolta o alero
select id_jugador, nombre, apellido, posicion 
from jugador 
where posicion in ('escolta', 'alero') ;

-- Alejandro Montilla
-- 3. Jugadores con salarios entre 60.000 y 100.000
select id_jugador, nombre, apellido, salario 
from jugador 
where salario between 60000 and 100000;

-- Alejandro Montilla
-- 4. Obtener los datos de los jugadores que sean pívot ordenados por su identificador.
select id_jugador, posicion 
from jugador 
where posicion = 'pivot';

-- Alejandro Montilla
-- 5. Seleccionar los datos de los jugadores que midan más de dos metros y ganen al menos 50.000 euros.
select id_jugador, nombre, apellido, altura, salario 
from jugador 
where altura >= 2 and salario <= 50000;

-- Alejandro Montilla
-- 6. Seleccionar el nombre de los jugadores que jueguen como pívot y ganen más de 100.000 euros.
select nombre, posicion, salario 
from jugador 
where posicion = 'pivot' and salario >= 100000;

-- Alejandro Montilla
-- 7. Seleccionar el nombre de los jugadores de los equipos 1 y 2 que jueguen como base.
select nombre, equipo, posicion 
from jugador
 where equipo in (1, 2) and posicion = 'base';

-- Alejandro Montilla
-- 8. Seleccionar los datos de jugadores de los equipos 1 y 2 que ganen más de 80.000 euros al mes.
select * 
from jugador
where equipo in (1, 2) and salario > 80000;

-- Alejandro Montilla
-- 9. Listar las posiciones diferentes que pueden ocupar los jugadores en la liga.
select distinct posicion 
from jugador
where posicion is not null 
order by posicion;

-- Alejandro Montilla
-- 10. Mostrar todos los datos de los 5 jugadores más altos.
select * 
from jugador 
order by altura desc limit 5;

-- Alejandro Montilla
-- 11. Calcular en una columna llamada SALARIO NETO ANUAL el sueldo neto de cada jugador sabiendo que el IRPF del 18% deja un 82% del salario bruto.
select nombre, salario, (salario * 0.82) as "SALARIO_NETO_ANUAL" 
from jugador
where salario is not null;

-- Alejandro Montilla
-- 12. Seleccionar los datos de los jugadores cuyo salario neto anual sea al menos 70.000 euros.
select *, (salario * 0.82) as "SALARIO_NETO_ANUAL" 
from jugador 
where (salario * 0.82) >= 70000;

-- Alejandro Montilla
-- 13. Jugadores sin posición asignada (NULL)
select nombre, posicion 
from jugador 
where posicion is null;

-- Alejandro Montilla
-- 14. Partidos jugados antes de 2012
select id_partido, fecha 
from partido
where fecha < '2012-01-01';

-- Alejandro Montilla
-- 15. Jugadores que midan más de 1.90 y cobren más de 100.000
select id_jugador, nombre, apellido, altura, salario 
from jugador 
where altura > 1.90 and salario > 100000;

-- --------------------------------------------------------------------------------------------------------

-- SEGUNDA RELACIÓN – Consultas de agregación y agrupación

-- Alejandro Montilla
-- 1. Calcular el salario medio de todos los jugadores.
select nombre, avg(salario) as 'salario_medio' 
from jugador 
where salario is not null
group by nombre 
order by 'salario_medio';

-- Alejandro Montilla
-- 2. Mostrar el id del equipo y la suma de las alturas de sus jugadores cuando esta suma supere los 5 metros.
select equipo, sum(altura) as "suma_alturas_jugadores" 
from jugador 
group by equipo 
having sum(altura) > 5 
order by equipo;

-- Alejandro Montilla
-- 3. Calcular cuántos jugadores miden más de dos metros.
select count(*) as 'cantidad_jugadore' 
from jugador 
where altura > 2;

-- Alejandro Montilla
-- 4. Mostrar para cada equipo cuántos jugadores están asignados a cada posición.
select equipo, posicion, count(*) as num_jugadores 
from jugador 
where posicion is not null
group by equipo, posicion 
order by equipo, posicion;

-- Alejandro Montilla
-- 5. Mostrar el id del equipo y el salario total de cada equipo, pero solo para los equipos que tengan más de 4 jugadores registrados.
select equipo, sum(salario) as 'salario_total' 
from jugador 
group by equipo
having count(*)>4;

-- Alejandro Montilla
-- 6. Calcular cuántas ciudades distintas tienen equipos registrados.
select count(*) as 'total_ciudades' 
from equipo;

-- Alejandro Montilla
-- 7. Mostrar para cada equipo el salario más alto, el más bajo y la diferencia entre ambos.
select equipo, max(salario) as 'salario_maximo', min(salario) as 'salario_minimo',max(salario) - min(salario) as 'diferencia' 
from jugador 
group by equipo;

-- Alejandro Montilla
-- 8. Seleccionar el salario medio de cada equipo, pero únicamente para los equipos cuya media sea superior a 100000.
select equipo, avg(salario) as 'salario_medio' 
from jugador 
group by equipo 
having avg(salario) > 100000;

-- Alejandro Montilla
-- 9. Número de jugadores por equipo
select equipo, count(*) as 'num_jugadores' 
from jugador 
group by equipo;

-- Alejandro Montilla
-- 10. Altura media por equipo
select equipo, avg(altura) as 'altura_media' 
from jugador 
group by equipo;

-- Alejandro Montilla
-- 11. Salario total por equipo
select equipo, sum(salario) as 'salario_total' 
from jugador 
group by equipo;

-- Alejandro Montilla
-- 12. Equipos con una altura media superior a 2 metros
select equipo, avg(altura) as 'altura_media' 
from jugador 
group by equipo
having avg(altura) > 2;

-- Alejandro Montilla
-- 13. El jugador más alto por equipo (altura máxima)
select equipo, max(altura) as 'jugador_mas_alto' 
from jugador 
group by equipo;