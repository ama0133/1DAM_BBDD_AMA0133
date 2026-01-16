use liga;
select * from jugador;
select * from equipo;
select * from partido;

-- 1. Datos del jugador más alto de la liga.
SELECT 
    *
FROM
    jugador
WHERE
    altura = (SELECT 
            MAX(altura)
        FROM
            jugador);
-- 2.Datos de todos los jugadores que pertenecen al Caja Laboral.
SELECT 
    j.*
FROM
    jugador j
        JOIN
    equipo e ON e.id_equipo = j.equipo
WHERE
    e.nombre = 'Caja Laboral';
-- 3.Suma de las alturas de los jugadores que sean del CAI Zaragoza o del Real Madrid.
SELECT 
	SUM(j.altura) as suma_altura
FROM
    jugador j
        JOIN
    equipo e ON e.id_equipo = j.equipo
WHERE
    e.nombre IN ('CAI Zaragoza' , 'Real Madrid');
-- 4.Datos de los jugadores que miden más que todos los jugadores del Caja Laboral.
SELECT 
    *
FROM
    jugador
WHERE
    altura > (SELECT 
            MAX(j.altura)
        FROM
            jugador j
                JOIN
            equipo e ON j.equipo = e.id_equipo
        WHERE
            e.nombre = 'Caja Laboral');
-- 5.Datos de los jugadores mejor pagado y peor pagado de la liga.
SELECT 
    *
FROM
    jugador
WHERE
    salario = (SELECT 
            MAX(salario)
        FROM
            jugador)
        OR salario = (SELECT 
            MIN(salario)
        FROM
            jugador);
-- 6.Datos del jugador más antiguo, es decir, el que lleva más tiempo dado de alta en un equipo.
SELECT 
    *
FROM
    jugador
WHERE
    fecha_alta IS NOT NULL
ORDER BY fecha_alta
LIMIT 1;
-- 7.Datos de los equipos que tienen más de tres jugadores registrados.
SELECT 
    *
FROM
    equipo
WHERE
    id_equipo IN (SELECT 
            equipo
        FROM
            jugador
        GROUP BY equipo
        HAVING COUNT(*) > 3);
-- 8.Mostrar el nombre del jugador, el nombre del equipo al que pertenece y su posición.
SELECT 
    j.nombre, e.nombre, j.posicion
FROM
    jugador j
        RIGHT JOIN
    equipo e ON j.equipo = e.id_equipo;
-- 9.Mostrar el nombre de cada equipo y el nombre de su capitán o capitanes.
SELECT 
    e.nombre AS 'Nombre_Equipo', j.nombre AS 'Nombre_Capitan'
FROM
    jugador j
        JOIN
    equipo e ON j.equipo = e.id_equipo
WHERE
    j.id_capitan = j.id_jugador;
-- 10.Datos de los equipos y el número de partidos que han jugado como locales.
SELECT 
    e.nombre, COUNT(p.local) AS num_veces_local
FROM
    equipo e
        JOIN
    partido p ON e.id_equipo = p.local
GROUP BY e.id_equipo;
-- 11.Datos de los jugadores cuyos equipos hayan jugado al menos tres partidos como visitantes.
SELECT 
    j.nombre, COUNT(p.visitante) AS num_veces_visitante
FROM
    jugador j
        JOIN
    equipo e ON e.id_equipo = j.equipo
        JOIN
    partido p ON e.id_equipo = p.visitante
GROUP BY j.id_jugador
HAVING num_veces_visitante >= 3;

-- 12.Datos de los equipos y el salario máximo de sus jugadores.

SELECT 
    e.nombre AS 'Equipo', MAX(j.salario) AS Salario_Maximo
FROM
    equipo e
        JOIN
    jugador j ON e.id_equipo = j.equipo
GROUP BY e.id_equipo , e.nombre;

-- 13.Datos de los equipos que hayan jugado algún partido contra el Valencia en casa.
SELECT 
    *
FROM
    equipo
WHERE
    id_equipo IN (SELECT 
            visitante
        FROM
            partido
        WHERE
            local = (SELECT 
                    id_equipo
                FROM
                    equipo
                WHERE
                    ciudad = 'Valencia'));
-- 14.Datos de los jugadores de equipos que hayan jugado algún partido contra el Valencia en casa.
SELECT 
    *
FROM
    jugador
WHERE
    id_jugador IN (SELECT 
            visitante
        FROM
            partido
        WHERE
            local = (SELECT 
                    id_equipo
                FROM
                    equipo
                WHERE
                    ciudad = 'Valencia'));
-- 15.Datos de los equipos que no tienen ningún jugador registrado.

-- 16.Mostrar el salario medio de los jugadores de cada equipo.
SELECT 
    e.nombre AS 'Equipo', AVG(j.salario) AS Salario_Medio
FROM
    equipo e
        JOIN
    jugador j ON e.id_equipo = j.equipo
GROUP BY e.id_equipo , e.nombre;

-- 17.Datos de los jugadores que cobran más que la media salarial de su equipo.
SELECT 
    *
FROM
    jugador
WHERE
    salario > (SELECT 
            AVG(j.salario) AS Salario_Medio
        FROM
            equipo e
                JOIN
            jugador j ON e.id_equipo = j.equipo
        GROUP BY e.id_equipo);
        
        SELECT 
            AVG(j.salario) AS Salario_Medio
        FROM
            equipo e
                JOIN
            jugador j ON e.id_equipo = j.equipo
        GROUP BY e.id_equipo;

        
