/*
 1. Función que devuelve valor
 */

--función que devuelva un valor
CREATE FUNCTION fnc_porcentaje(
ptotal1 INTEGER,
ptotal2 INTEGER
)
RETURNS DECIMAL
AS
$$
DECLARE resultado DECIMAL;
BEGIN
    resultado = (CAST(ptotal1*100 AS DECIMAL)/CAST (ptotal2 AS DECIMAL));
RETURN resultado;
end;
$$
LANGUAGE 'plpgsql' VOLATILE;

--ejemplo de uso
SELECT tipo, totaltipo, totalglobal, fnc_porcentaje(totaltipo, totalglobal)
FROM (
         SELECT tipo,
                CAST(COUNT(id_orden) AS INTEGER)                     totaltipo,
                (SELECT CAST(COUNT(id_orden) AS INTEGER) FROM orden) totalglobal
         FROM orden
                  JOIN vehiculo v on v.placa = orden.placa
                  JOIN ctipo c on v.id_ctipo = c.id_ctipo
         GROUP BY (tipo)) T1;


 /*
 2. Función que devuelve una tabla
 */



--función que devuelve una tabla
--nombre y apellido paterno de los empleados que
-- han vendido  ordenes durante un mes especifico (diciembre)
CREATE OR REPLACE  FUNCTION fnc_nobredeempleado(
pmes INTEGER)
RETURNS TABLE (onombre VARCHAR(128),oapp VARCHAR(128))
AS
$$
BEGIN
    RETURN QUERY SELECT DISTINCT nombre,app
    FROM persona JOIN empleado e on persona.id_persona = e.id_persona
    JOIN orden o on e.nonomina = o.nonomina
    WHERE EXTRACT(MONTH FROM fechahora)=pmes;
    END;
$$
LANGUAGE 'plpgsql' VOLATILE;


SELECT *
FROM fnc_nobredeempleado(12);


/*
 3. Función que realiza una acción
 */

--opcion 1
--Esta función permite insertar un nuevo producto al catálogo

CREATE OR REPLACE FUNCTION fnc_insertproduct(
pnombre_producto VARCHAR(100), --el nombre del producto a registrar
pcostoproducto NUMERIC, --el costo que tiene el producto
pprecioparapublico NUMERIC --el precio que paga el publico
)
RETURNS VARCHAR(20)
AS
$$
DECLARE vid_producto_calculado INTEGER; --para calcular el id del producto, similar a la funcion anterior
DECLARE vinsercion VARCHAR(100); --lo que escupe la funcion
BEGIN
IF ((SELECT count(*)
         FROM cproducto
         WHERE nombre = pnombre_producto) = 0) --verifica que no haya otro producto que se llame igual
    THEN
        vid_producto_calculado = CASE
                                    WHEN ((SELECT MAX(id_cproducto)
                                           FROM cproducto) IS NOT NULL)
                                        THEN (SELECT MAX(id_cproducto)
                                              FROM cproducto) + 1
                                    ELSE 1
            END;

        INSERT INTO cproducto VALUES (vid_producto_calculado, pnombre_producto,pcostoproducto,pprecioparapublico); --realiza la insercion

        vinsercion = 'Producto registrado';
    ELSE
        vinsercion = 'El producto que esta intentando registrar ya existe';

    END IF;
    RETURN vinsercion;
END;
$$
LANGUAGE 'plpgsql' VOLATILE;

--Ejemplos de uso de la funcion, con un producto que ya existe y con uno que no
SELECT * FROM fnc_insertproduct('Tapetes de autos uso rudo',300,600);
SELECT * FROM fnc_insertproduct('Tapete de autos uso no tan rudo',200,300);