use TiendaTecnologia;

select * from categorias;
select * from clientes;
select * from detalles_pedido;
select * from fabricantes;
select * from pedidos;
select * from productos;



-- ALEJANDRO MONTILLA AGUILAR
-- 1. Listado con todos los productos, mostrando para cada uno el id_fab, el id_producto, la descripción y el precio. 
select id_fab, id_producto, descripcion, precio 
from productos;

-- ALEJANDRO MONTILLA AGUILAR
-- 2. Listado de todos los pedidos realizados por el cliente 2, extrayendo toda la información.
select *
from pedidos
where n_pedido = '2';

-- ALEJANDRO MONTILLA AGUILAR
-- 3. Consultar todos los datos de los productos de más de 100 €.
select * 
from productos
where precio >= '100';

-- ALEJANDRO MONTILLA AGUILAR
-- 4. Listado de clientes de Madrid o Barcelona.
select *
from clientes
where ciudad in('madrid', 'barcelona');

-- ALEJANDRO MONTILLA AGUILAR
-- 5. Obtener el precio medio de los productos del fabricante con id_fab = '1'.
select id_fab, avg(precio) as 'media_precio'
from  productos
where id_fab = '1';

-- ALEJANDRO MONTILLA AGUILAR
-- 6. Consultar la fecha del pedido más antiguo.
select fecha_pedido
from pedidos
order by fecha_pedido asc limit 1;

-- ALEJANDRO MONTILLA AGUILAR
-- 7. Consultar los diferentes paises que existen en los fabricantes (sin repetir).
select pais
from fabricantes
group by pais;

-- ALEJANDRO MONTILLA AGUILAR
-- 8. Obtén los pedidos realizados entre el 1 de enero de 2024 y el 5 de febrero de 2024.
select *
from pedidos
where fecha_pedido between '2024-01-01' and '2024-02-05';

-- ALEJANDRO MONTILLA AGUILAR
-- 9. Muestra una lista de los clientes con su nombre completo (direccion + ciudad) concatenados en un solo campo.
select nombre, concat(direccion, ' ', ciudad) as 'cidudad_direccion'
from clientes;

-- ALEJANDRO MONTILLA AGUILAR
-- 10. Muestra cuantos fabricantes hay en cada país.
select pais, count(*) as 'num_fabricantes'
from fabricantes
group by pais;

-- ALEJANDRO MONTILLA AGUILAR
-- 11. Muestra en otra columna llamada precio_con_iva todos los datos de los productos, suma el iva 21%.
select *,  precio * '1.21' as 'precio_con_iva'
from productos;

-- ALEJANDRO MONTILLA AGUILAR
-- 12. Producto más caro
select precio
from productos
order by precio desc limit 1;

-- ALEJANDRO MONTILLA AGUILAR
-- 13. Cliente con más pedidos
select id_cliente, count(*) as 'num_pedidos'
from pedidos
group by id_cliente;

select * from pedidos;


-- ALEJANDRO MONTILLA AGUILAR
-- 14. Mostrar los productos ordenados por precio de mayor a menor
select *
from productos
order by precio desc;

-- ALEJANDRO MONTILLA AGUILAR
-- 15. Mostrar los clientes ordenados por ciudad alfabéticamente
select *
from clientes
order by ciudad asc;

-- ALEJANDRO MONTILLA AGUILAR
-- 16. Mostrar solo los 5 productos más baratos
select * 
from productos
order by precio asc limit 5;

-- ALEJANDRO MONTILLA AGUILAR
-- 17. Mostrar cuántos productos hay por fabricante
select id_fab, count(*) as 'num_productos' 
from productos 
group by id_fab;

-- ALEJANDRO MONTILLA AGUILAR
-- 18. Mostrar solo los fabricantes que tengan más de 1 producto
select id_fab, count(*) 
from productos 
group by id_fab 
having count(*) > 1;

-- ALEJANDRO MONTILLA AGUILAR
-- 19. Mostrar clientes cuyo nombre empiece por "A"
select nombre 
from clientes 
where nombre like 'A%';

-- ALEJANDRO MONTILLA AGUILAR
-- 20. Mostrar productos cuyo nombre contenga la palabra "Portátil"
select descripcion 
from productos
where descripcion like 'Portátil%';

-- ALEJANDRO MONTILLA AGUILAR
-- 21. Convertir nombres de clientes a mayúsculas
select upper(nombre) 
from clientes;

-- ALEJANDRO MONTILLA AGUILAR
-- 22. Convertir descripciones de productos a minúsculas
select lower(descripcion) 
from productos;

-- ALEJANDRO MONTILLA AGUILAR
-- 23. Nombre + dirección en mayúsculas en una columna llamada "Nombre_Completo"
select upper(concat(nombre, ' ', direccion)) as 'Nombre_Completo'
from clientes;

-- ALEJANDRO MONTILLA AGUILAR
-- 24. Cambiar el formato de los nombres de productos para que comiencen con "Producto:" seguido de su descripción. Crear un alias Producto_Descripcion.
select concat('Producto: ', descripcion) as 'Producto_Descripcion'
from productos;

-- ALEJANDRO MONTILLA AGUILAR
-- 25. Extraer las tres primeras letras del nombre de cada país de fabricantes:
select substr(pais,1,3) as 'Paises'
from fabricantes;

-- ALEJANDRO MONTILLA AGUILAR
-- 26. Reemplazar "Calle" por "Avda." en las direcciones de cliente
select replace(direccion,'Calle','Avda.' ) as 'Cambios_direccion'
from clientes;

-- ALEJANDRO MONTILLA AGUILAR
-- 27. Calcular cuántos días han pasado desde cada pedido hasta hoy (función SYSDATE):
select n_pedido as n_pedido,fecha_pedido, sysdate() as Fecha_Actual, datediff(sysdate(), fecha_pedido) AS 'Dias_Transcurridos'
from pedidos;

-- ALEJANDRO MONTILLA AGUILAR
-- 28. Obtener la última fecha del mes en que se realizó cada pedido (función LAST_DAY):
select fecha_pedido, last_day(fecha_pedido) as 'ultima_fecha'
from pedidos;

-- ALEJANDRO MONTILLA AGUILAR
-- 29. Asignar un estado personalizado a los pedidos dependiendo de su estado actual, 'Finalizado', 'Anulado' o 'En Gestión' (expresión CASE):
select  ;

-- ALEJANDRO MONTILLA AGUILAR
-- 30. Obtener los pedidos realizados en 2023.
select * 
from pedidos
where year(fecha_pedido) = '2023';

-- ALEJANDRO MONTILLA AGUILAR
-- 31. Elevar el precio de cada producto al cuadrado
select id_producto, power(precio,2) as 'Precios_al_cuadrado'
from productos;

-- ALEJANDRO MONTILLA AGUILAR
-- 32. Redondear el precio de cada producto a 1 decimal
select id_producto, round(precio, 1) as 'precio_redondeado'
from productos;

-- ALEJANDRO MONTILLA AGUILAR
-- 33. Extraer el año de las fechas de pedido:
select fecha_pedido, year(fecha_pedido) as 'Año'
from pedidos;


-- ALEJANDRO MONTILLA AGUILAR
-- 34. Calcular cuántos pedidos se hicieron en un año específico (por ejemplo, 2024):
select count(*) as 'pedidos_2024'
from pedidos
where year(fecha_pedido) = '2024';

-- ALEJANDRO MONTILLA AGUILAR
-- 35. Invertir el nombre de los clientes:
select nombre, reverse(nombre) as 'nombre_invertido'
from clientes;

-- ALEJANDRO MONTILLA AGUILAR
-- 36. Mostrar la longitud de cada nombre de cliente
select nombre, length(nombre) as 'longitud_nombre'
from clientes;

-- ALEJANDRO MONTILLA AGUILAR
-- 37. Mostrar solo los 4 primeros caracteres del nombre del cliente
select substr(nombre, 1, 4) as 'primeros_caracteres'
from clientes;

-- ALEJANDRO MONTILLA AGUILAR
-- 38. Mostrar "CARO" para productos => 500 o "BARATO" según el precio
select descripcion, precio,
case when precio >= 500 then 'CARO' else 'BARATO' end as 'clasificacion'
from productos;

-- ALEJANDRO MONTILLA AGUILAR
-- 39. Cantidad total de productos vendidos por cada producto
select Id_producto, sum(Cant) as 'total_vendidos'
from Detalles_Pedido
group by Id_producto;

-- ALEJANDRO MONTILLA AGUILAR.
-- 40. Número de clientes por cada ciudad (Añade algo a la consulta para mostrar solo las ciudades que tengan más de un cliente).
select Ciudad, count(*) as 'num_clientes'
from Clientes
group by Ciudad
having count(*) > 1;
