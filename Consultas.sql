/*
 Consulta básica, solo incluye una tabla
 */

--Placa, id_cliente de las ordenes en las que el monto pagado fue menor a mil,
--tales que el id_cliente no es nulo
SELECT placa,id_cliente
FROM orden
WHERE monto_pagar<1000 AND id_cliente IS NOT NULL;


/*
 subconsulta al menos 3 niveles
 */

--nombre, app, apm del empleado que más ordenes ha atendido
SELECT nombre, app, apm
FROM persona
WHERE id_persona IN (
    SELECT id_persona
    FROM empleado
    WHERE nonomina IN (
        SELECT nonomina
        FROM (SELECT nonomina, count(id_orden) total
              FROM orden
              GROUP BY nonomina) T2
        WHERE total IN (SELECT MAX(total)
                        FROM (SELECT nonomina, count(id_orden) total
                              FROM orden
                              GROUP BY nonomina) T1)));


/*
 compuesta 3 tablas deben de estar involucradas en un JOIN
 */

--nombre, app, apm, nonomina de los empleados que más membresías han vendido y total
SELECT nombre, app, apm, nonomina, total
FROM persona
         JOIN (SELECT id_persona, empleado.nonomina, total
               FROM (SELECT nonomina, COUNT(id_miembro) total
                     FROM miembro
                     GROUP BY nonomina) T1
                        JOIN empleado ON T1.nonomina = empleado.nonomina
               WHERE total = (SELECT MAX(total)
                              FROM (SELECT nonomina, COUNT(id_miembro) total
                                    FROM miembro
                                    GROUP BY nonomina) T2)) T3
              ON persona.id_persona = T3.id_persona;


/*
 paginacion
 */

--nombre de los miembros  que en las encuestas la calificación sobre amabilidad y precios
-- fue la peor posible (i.e. 1 en ambos rubros), 10 lineas con offset 4
SELECT nombre, app, apm
FROM persona
WHERE id_persona IN (SELECT id_persona
                     FROM miembro
                     WHERE id_miembro IN (SELECT id_miembro
                                          FROM orden
                                          WHERE id_orden IN (
                                              SELECT id_orden
                                              FROM encuesta
                                              WHERE amabilidad = 1
                                                AND precios = 1)
                                            AND id_miembro IS NOT NULL))
OFFSET 4 ROWS FETCH NEXT 10 ROWS ONLY;



/*
 crosstab
 */


--numero de ordenes por mes realizadas para cada tipo de vehículo
CREATE EXTENSION tablefunc;
SELECT *
FROM CROSSTAB(
             'SELECT id_ctipo, EXTRACT(month FROM fechahora)mes,COUNT(id_orden)total
             FROM vehiculo JOIN orden ON vehiculo.placa=orden.placa
             GROUP BY id_ctipo, EXTRACT(month FROM fechahora)
             ORDER BY id_ctipo,EXTRACT(month FROM fechahora)',
             'SELECT DISTINCT(EXTRACT(month from fechahora))mes FROM orden ORDER BY mes')
         AS resultado(
                      tipo INTEGER,
                      octubre DOUBLE PRECISION,
                      noviembre DOUBLE PRECISION,
                      diciembre DOUBLE PRECISION);


/*
 funcion de ventana
 */

--ordenes de miembros por mes
SELECT DISTINCT EXTRACT(MONTH from fechahora)                                     mes,
                COUNT(id_orden) OVER (PARTITION BY EXTRACT(MONTH from fechahora)) ordenesmiembros
FROM orden
WHERE id_miembro IS NOT NULL
ORDER BY ordenesmiembros ASC;

/*
 agrupacion
 */

--ordenes de miembros por mes
SELECT  EXTRACT(MONTH FROM fechahora) mes,count(id_orden)ordenesmiembros
FROM orden
WHERE id_miembro IS NOT NULL
GROUP BY EXTRACT(MONTH FROM fechahora)
ORDER BY ordenesmiembros ASC;