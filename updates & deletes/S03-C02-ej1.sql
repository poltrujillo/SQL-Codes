-- 1.
b) 

Update clasificacion as c, temporada as t
    set posicion = 0
    where c.id_temporada = c.id_temporada
        and year(fecha_inicio) = 2019;

c)

Update federacion
    set fecha_creacion = CURRENT_DATE()
    where nombre_federacion = 'Federacion Espanyola de Futbol';

d)

Update competicion
    set nombre_Tv = null
    where nombre_competicion = 'Champions';

e)

Delete from clasificacion;

-- 2
b)

Update jugador
    set dorsal = 1, ubicacion = 'Portero'
    where num_ss_jugador = 1;

c)

Update equipo
    set presidente = entrenador
    where nombre = 'Madrid'

d)

Update equipo
    set presupuesto = presupuesto + 1000000
    order by nombre ascendente
    limit 1;

e)

Delete from equipo
    order by nombre desc
    limit 1;