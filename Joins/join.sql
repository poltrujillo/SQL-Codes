-- a)	Muestra el nombre y apellido de los jugadores ordenados por el apellido de forma ascendente y por el nombre de forma descendente.
-- b)	Selecciona el nombre y apellido de los jugadores con el dorsal 1 y su ubicación sea ‘Portero’ o con el dorsal 9 y su ubicación sea ‘Delantero’.
-- c)	Muestra en num_ss_jugador de los jugadores junto con el nombre de sus equipos, aunque alguno de ellos no tenga equipo.
-- d)	Muestra en num_ss_jugador de los jugadores junto con el nombre de sus equipos, aunque alguno de ellos no tenga equipo, así como también los equipos sin jugadores.

-- a) 
SELECT nombre, apellido
FROM jugador
ORDER BY apellido ASC, nombre DESC;

-- b)
SELECT nombre, apellido
FROM jugador
WHERE dorsal = 1 AND ubicacion = 'Portero'
OR dorsal = 9 AND ubicacion = 'Delantero';

-- c)
SELECT num_ss_jugador, nombre
FROM jugador
LEFT JOIN equipo ON equipo = nombre_equipo;

-- d)
SELECT num_ss_jugador, nombre
FROM jugador
RIGHT JOIN equipo ON equipo = nombre_equipo;


