USE profesores;

select * from profesores;
select * from coordinadores;
select * from asignaturas;
select * from imparte;
select * from prepara;

-- 1. Muestra los datos de la asignatura y el dni del profesor que la imparte.alter
SELECT 
    *
FROM
    asignaturas a
        JOIN
    imparte i ON a.codigo = i.asignatura;
    
-- --------------------------------------------- --
SELECT 
    i.dni, a.descripcion
FROM
    asignaturas a
		JOIN
    imparte i ON a.codigo = i.asignatura;
-- --------------------------------------------- --
SELECT 
    *
FROM
    asignaturas a,
    imparte i
WHERE
    a.codigo = i.asignatura;

-- 2. Muestras los datos de los profeosres que imparte algina asignatura
SELECT 
    *
FROM
    profesores p
        JOIN
    imparte i ON p.dni = i.dni;
-- --------------------------------------------- --
SELECT 
    *
FROM
    profesores
        NATURAL JOIN
    imparte;
    
-- 3. Ordenar los profesores de manera ascendete por ingreso.
SELECT 
    *
FROM
    profesores p
        JOIN
    imparte i ON p.dni = i.dni
ORDER BY ingreso;

-- Producto cartesiano (CROSS JOIN)
SELECT 
    *
FROM
    profesores,
    asigatura;
-- --------------------------------------------- --
SELECT 
    *
FROM
    profesores
        CROSS JOIN
    imparte;

-- 4. Suma de creditos que imparte cada profesor segun su dni
SELECT 
    i.dni, SUM(creditos) AS suma_creditos
FROM
    asignaturas a
        JOIN
    imparte i ON a.codigo = i.asignatura
GROUP BY dni;

-- 5. Mostrar el nombre de los profesores y cuantas asignaturas imparte cada uno.
SELECT 
    p.nombre, COUNT(a.codigo) AS num_asignaturas
FROM
    profesores p
        NATURAL JOIN
    imparte i
        JOIN
    asignaturas a ON a.codigo = i.asignatura
GROUP BY p.dni;


select p. nombre, count(*) from profesores p join imperte i on p.dni = i.dni group by dni; 

-- 6. Mostrar el nombre del profesor y la descripción de la asignatura que imparte.
SELECT 
    p.nombre, a.descripcion
FROM
    profesores p
        NATURAL JOIN
    imparte i
        JOIN
    asignaturas a ON a.codigo = i.asignatura;
    
-- 7. DNI y nombre del coordinador y el descripcion de la asignatura
SELECT 
    c.dni, c.nombre, a.descripcion
FROM
    coordinadores c
        JOIN
    asignaturas a ON c.asig = a.codigo;
    
-- 8. DNI del profesor y la suma de los creditos que prepara
SELECT 
    p.dni, SUM(a.creditos) AS suma_creditos
FROM
    prepara p
        JOIN
     asignaturas a ON a.codigo = p.asignatura
GROUP BY dni;

-- 9. LEFT JOIN. Datos de todos los profesores, y si imparte alguna asignatura, los datos de ella.
select * from profesores p left join imparte i on (p.dni = i.dni); -- Para sacar todos los profesores que imparten y los que no.

-- 10. RIGHT JOIN. Datos de todos los profesotes y si preparan alguna asinatura los datos de ella.
SELECT 
    *
FROM
    prepara pr
        RIGHT JOIN
    profesores p ON (pr.dni = p.dni); 


-- ------------------------ SUBCONSULTAS -----------------------------

-- 1. Mostrar todos los datos de las asignaturas que tienen más creditos que la asignatura PC.

SELECT 
    *
FROM
    asignaturas
WHERE
    creditos > (SELECT 
            creditos
        FROM
            asignaturas
        WHERE
            codigo = 'PC');

-- 2. Mostrar a descripcion de las asignatura que tiene  mas creditos que todas las demas

SELECT 
    descripcion
FROM
    asignaturas
WHERE
    creditos = (SELECT 
            MAX(creditos)
        FROM
            asignaturas);
            
-- 3. Nombre de las asignatura que no son las que menos creditos tienen.

SELECT 
    *
FROM
    asignaturas
WHERE
    creditos > (SELECT 
            MIN(creditos)
        FROM
            asignaturas);
            
-- 4. 