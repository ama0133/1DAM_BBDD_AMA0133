USE universidad;
SELECT * FROM ALUMNO_SE_MATRICULA_asignatura;
SELECT * FROM ASIGNATURA;
SELECT * FROM CURSO_ESCOLAR;
SELECT * FROM DEPARTAMENTO;
SELECT * FROM GRADO;
SELECT * FROM PERSONA;
SELECT * FROM PROFESOR;

-- Obtener las alumnas que no sean las de mayor edad.
SELECT 
    *
FROM
    persona
WHERE
    sexo = 'M' AND tipo = 'alumno' AND fecha_nacimiento  > (SELECT 
            MIN(fecha_nacimiento)
        FROM
            persona
        WHERE
            sexo = 'M' AND tipo = 'alumno');
            
-- Número de asignaturas que imparte cada profesor

SELECT 
    pro.id_profesor,
    p.nombre,
    COUNT(a.id) AS 'Número de asinaturas que imparte'
FROM
    asignatura a
        NATURAL JOIN
    profesor pro
        JOIN
    persona p ON (pro.id_profesor = p.id) group by id_profesor;


-- 1. Obtener la alumna con mayor edad.
SELECT 
    *
FROM
    persona
WHERE
    fecha_nacimiento IN (SELECT 
            MIN(fecha_nacimiento)
        FROM
            persona
        WHERE
            sexo = 'M' AND tipo = 'alumno');
-- 2. Mostrar los datos de la asignatura cuyo id sea el mayor.
SELECT 
    *
FROM
    asignatura
WHERE
    id = (SELECT 
            MAX(id)
        FROM
            asignatura);
-- 3. Mostrar el nombre de la asignatura y el nombre de su grado asociado.
SELECT 
    a.nombre AS 'Nombre Asignatura', g.nombre AS 'Nombre Grado'
FROM
    asignatura a
        JOIN
    grado g ON (a.id_grado = g.id);
-- 4. Mostrar el nombre de todas las asignaturas, el nombre de su grado, y el nombre y apellidos del profesor asociado (incluyendo asignaturas sin profesor si las hubiera).
SELECT 
    per.nombre AS 'Nombre Profesor',
    per.apellido1 AS 'Apellido 1 Profesor',
    per.apellido2 AS 'Apellido 2 Profesor',
    a.nombre AS 'Nombre Asignatura',
    g.nombre AS 'Nombre Grado'
FROM
    persona per
        JOIN
    profesor pro ON (per.id = pro.id_profesor)
        RIGHT JOIN
    asignatura a ON (pro.id_profesor = a.id_profesor)
        JOIN
    grado g ON (a.id_grado = g.id);
-- 5. Mostrar el nombre y apellidos de los profesores y el nombre de su departamento.
SELECT 
    per.nombre AS 'Nombre Profesor',
    per.apellido1 AS 'Apellido 1 Profesor',
    per.apellido2 AS 'Apellido 2 Profesor',
    dep.nombre AS 'Nombre Departamento'
FROM
    persona per
        JOIN
    profesor pro ON (per.id = pro.id_profesor)
        JOIN
    departamento dep ON (pro.id_departamento = dep.id);
    
-- 6. Obtener el número de asignaturas que imparte cada profesor, mostrando su nombre y apellidos.
SELECT 
    per.nombre,
    per.apellido1,
    per.apellido2,
    COUNT(a.id) AS 'num_asignaturas'
FROM
    asignatura a
        NATURAL JOIN
    profesor pro
        JOIN
    persona per ON (pro.id_profesor = per.id)
GROUP BY id_profesor;

-- 7. Mostrar los datos de todos los grados, tengan o no asignaturas asociadas.
SELECT 
    *
FROM
    grado g
        LEFT JOIN
    asignatura a ON (g.id = a.id_grado);

-- 8. Mostrar los datos de todas las asignaturas, tengan o no profesor asignado.
SELECT 
    *
FROM
    asignatura a
        LEFT JOIN
    profesor pro ON (pro.id_profesor = a.id_profesor);

-- 9. Datos de los profesores que imparten alguna asignatura
SELECT 
    per.*
FROM
    persona per
        JOIN
    profesor pro ON (per.id = pro.id_profesor)
        JOIN
    asignatura a ON (pro.id_profesor = a.id_profesor)
    group by pro.id_profesor;

-- 10. Cantidad de créditos que imparte cada profesor según su nif.
SELECT 
    per.nif, SUM(a.creditos) AS 'Total de creditos'
FROM
    persona per
        JOIN
    profesor pro ON (per.id = pro.id_profesor)
        JOIN
    asignatura a ON (pro.id_profesor = a.id_profesor)
GROUP BY per.nif;
    
-- 11. Mostrar datos de las asignaturas que tienen más créditos que todas las demás.
SELECT 
    *
FROM
    asignatura
WHERE
    creditos = (SELECT 
            MAX(creditos)
        FROM
            asignatura);

-- 12. Mostrar datos de las asignaturas con menos créditos
SELECT 
    *
FROM
    asignatura
WHERE
    creditos = (SELECT 
            MIN(creditos)
        FROM
            asignatura);

-- 13. Muestra por cada grado la suma de sus créditos.
SELECT 
    g.nombre, SUM(a.creditos) as 'Total creditos'
FROM
    asignatura a
        JOIN
    grado g ON (a.id_grado = g.id)
GROUP BY g.id;

-- 14. Asignaturas que pertenecen al mismo grado que “Bases de Datos”
SELECT 
    *
FROM
    asignatura
WHERE
    id_grado IN (SELECT 
            id_grado
        FROM
            asignatura
        WHERE
            id_grado = 4);
