/* EJERCICIO 1 */

-- a) Selecciona el nombre de los equipos que han ganado alguna vez una competición (evitando repetidos) siempre que hayan ganado más de 5 veces.

-- b) Muestra el nombre del décimo equipo ordenado de la A a la Z.

SELECT nombre_equipo FROM Equipo ORDER BY nombre_equipo ASC LIMIT 9,1;

-- c) Muestra el número de equipos que hay en la base de datos.

SELECT COUNT(*) FROM Equipo;

-- d) Muestra el número de equipos por competición y temporada.

SELECT COUNT(*), Temporada, Competicion FROM Equipo GROUP BY Temporada, Competicion;

-- e) Muestra cuantos equipos hay en cada competición de la temporada 1.

SELECT COUNT(*), Competicion FROM Equipo WHERE id_temporada = 1 GROUP BY Competicion;


/* EJERCICIO 2 */

-- a) Selecciona el nombre y apellido de los árbitros que sean jugadores (Utilizando conjuntos).

(SELECT nombre, apellido1 
    FROM Persona AS p, Arbitro AS a
        WHERE p.num_ss_arbitro = a.num_ss)

INTERSECT

(SELECT nombre, apellido1 
    FROM Persona AS p, Jugador AS j
        WHERE p.num_ss_jugador = j.num_ss)

-- b) Selecciona el nombre y apellido de los árbitros que no sean jugadores (Utilizando conjuntos).

(SELECT nombre, apellido1 
    FROM Persona AS p, Arbitro AS a 
        WHERE p.num_ss_arbitro = a.num_ss)

MINUS

(SELECT nombre, apellido1 
    FROM Persona AS p, Jugador AS j 
        WHERE num_ss_jugador = num_ss)

-- c) Muestra el número de partidos jugados por equipo como local de los 3 equipos que hayan jugado más.

SELECT COUNT(equipo_local) AS Numero_Partidos 
    FROM Partido GROUP BY equipo_local 
    ORDER BY COUNT(equipo_local) DESC 
    LIMIT 3;

-- d) Muestra la suma de presupuestos de todos los equipos.

SELECT SUM(presupuesto) FROM equipo;;

-- e) Muestra el nombre y apellido de los jugadores ordenados por el apellido de forma ascendente y por el nombre de forma descendente.

SELECT nombre, apellido1
    FROM persona AS p, jugador AS j
    WHERE p.num_ss = j.num_ss_jugador
    ORDER BY apellido1 ASC, nombre DESC;

-- f) Muestra equipos listados de la A a la Z filtrando solo los 3 primeros resultados.

SELECT * FROM equipo 
    ORDER BY nombre ASC 
    LIMIT 3;

/* EJERCICIO 3 */

-- a) Selecciona la id de los subscritores que han comprado alguna entrega (como clientes).

-- b) Selecciona el nombre de las colecciones junto con el número de entregas de cada una de ellas.

-- c) Selecciona las entregas con más de dos regalos.

-- d) Selecciona las colecciones donde el peso total de sus regalos sea superior a 5000g.

-- e) Selecciona la id de los clientes junto con cuantas entregas han comprado, siempre que sean mas de 20.