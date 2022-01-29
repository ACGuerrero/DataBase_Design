/*

 **************************
     CREACION DE TABLAS
 **************************

 */

 --cliente
 CREATE  TABLE cliente(
    id_cliente SERIAL,
    nombre_cliente VARCHAR(128),
    id_domicilio INTEGER
);


--cliente_telefono
CREATE TABLE cliente_telefono(
    id_cliente INTEGER,
    id_telefono INTEGER
);


--correo_persona
CREATE TABLE correo_persona(
    id_correo SERIAL,
    correo VARCHAR(128)
);


--cpago
CREATE TABLE cpago(
    id_cpago SERIAL,
    nombre_pago VARCHAR(128)
);


--cpuesto
CREATE TABLE cpuesto(
    id_cpuesto SERIAL,
    nombre_puesto VARCHAR(128),
    salario NUMERIC
);


--csexo
CREATE TABLE csexo(
    id_sexo SERIAL,
    sexo VARCHAR(1)
);


--ctipo
CREATE TABLE ctipo(
    id_ctipo SERIAL,
    tipo VARCHAR(128)
);


--ctipotel
CREATE TABLE ctipotel(
    id_ctipotel SERIAL,
    tipotel VARCHAR(128)
);

--domicilio
CREATE TABLE domicilio(
    id_domicilio SERIAL,
    calle VARCHAR(128),
    numerointerior VARCHAR(7),
    numeroexterior VARCHAR(7),
    colonia VARCHAR(128),
    delegacion VARCHAR(128),
    codigopostal CHAR(5)
);

--empleado
CREATE TABLE empleado(
    nonomina SERIAL,
    id_cpuesto INTEGER,
    id_empleado_datos INTEGER,
    id_persona INTEGER,
    id_sucursal INTEGER
);


--empleado_datos
CREATE TABLE empleado_datos(
    id_empleado_datos SERIAL,
    noss CHAR(11),
    rfc CHAR(13),
    id_telefono INTEGER
);

--encuesta
CREATE TABLE encuesta(
    id_encuesta SERIAL,
    amabilidad INTEGER,
    calidad INTEGER,
    tiempo INTEGER,
    precios INTEGER,
    id_orden INTEGER
);

--extra
CREATE TABLE extra(
    id_extra SERIAL,
    tipo_extra VARCHAR(128),
    id_servicio INTEGER
);

--factura
CREATE TABLE factura(
    numero_factura SERIAL,
    id_orden INTEGER
);


--miembro
CREATE TABLE  miembro(
    id_miembro SERIAL,
    vigencia DATE,
    nonomina INTEGER,
    id_persona INTEGER
);

--miembro_telefono
CREATE TABLE miembro_telefono(
    id_miembro INTEGER,
    id_telefono INTEGER
);

--orden
CREATE TABLE orden(
    id_orden SERIAL,
    monto_total NUMERIC,
    fechahora TIMESTAMP,
    monto_pagar NUMERIC,
    descuento BOOLEAN,
    id_miembro INTEGER,
    id_cliente INTEGER,
    nonomina INTEGER,
    placa VARCHAR(6),
    id_cpago INTEGER,
    a_domicilio BOOLEAN,
    id_sucursal INTEGER
);

--orden_producto
CREATE TABLE orden_cproducto(
    cantidad INTEGER,
    id_orden INTEGER,
    id_cproducto INTEGER
);

--orden_servicio
CREATE TABLE orden_servicio(
    id_orden INTEGER,
    id_servicio INTEGER,
    cantidad INTEGER
);

--paquete
CREATE TABLE paquete(
    id_paquete SERIAL,
    nombre_paquete VARCHAR(128),
    id_servicio INTEGER
);

--persona
CREATE TABLE persona(
    id_persona SERIAL,
    app VARCHAR(128),
    apm VARCHAR(128),
    nombre VARCHAR(128),
    fechanacimiento DATE,
    id_sexo INTEGER,
    id_domicilio INTEGER,
    id_correo INTEGER
);

--producto
CREATE TABLE cproducto(
    id_cproducto SERIAL,
    nombre VARCHAR(64),
    costo NUMERIC,
    preciopublico NUMERIC
);

--servicio
CREATE TABLE servicio(
    id_servicio SERIAL,
    precio NUMERIC,
    tiempo_espera interval,
    id_ctipo INTEGER
);

--telefono
CREATE TABLE telefono (
    id_telefono SERIAL,
    telefono CHAR(10),
    id_ctipotel INTEGER
);

--vehiculo
CREATE TABLE vehiculo(
    placa VARCHAR(6),
    modelo VARCHAR(128),
    marca VARCHAR(128),
    id_ctipo INTEGER,
    id_miembro INTEGER,
    id_cliente INTEGER,
    id_ccolor INTEGER
);


--vulcanizadora
CREATE TABLE vulcanizadora(
    id_vulcanizadora SERIAL,
    tipovulcanizadora VARCHAR(128),
    id_servicio INTEGER
);

--ccolor
CREATE TABLE ccolor(
    id_ccolor SERIAL,
    color VARCHAR(128)
);

--sucursal
CREATE TABLE sucursal(
    id_sucursal SERIAL,
    nombre VARCHAR(128),
    id_domicilio SERIAL
);

--orden_sucursal
CREATE TABLE orden_sucursal(
    id_orden_sucursal SERIAL,
    fechahorasuc DATE,
    monto_totalsuc NUMERIC,
    id_sucursal INTEGER,
    nonomina INTEGER
);

--orden_sucursal_cproducto
CREATE TABLE orden_sucursal_cproducto(
    cantidad INTEGER,
    id_orden_sucursal INTEGER,
    id_cproducto INTEGER
);

--inventario
CREATE TABLE inventario(
    cantidad INTEGER,
    id_sucursal INTEGER,
    id_cproducto INTEGER
);