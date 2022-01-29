/*

 **************************
     LLAVES PRIMARIAS
 **************************

 */

--cliente
ALTER TABLE cliente ADD CONSTRAINT pk_cliente_id_cliente PRIMARY KEY (id_cliente);

--correo_persona
ALTER TABLE correo_persona ADD CONSTRAINT pk_correo_persona_id_correo PRIMARY KEY (id_correo);
--ccolor
ALTER TABLE ccolor ADD CONSTRAINT pk_ccolor_id_ccolor PRIMARY KEY (id_ccolor);
--cpago
ALTER TABLE cpago ADD CONSTRAINT pk_cpago_id_cpago PRIMARY KEY(id_cpago);

--cpuesto
ALTER TABLE cpuesto ADD CONSTRAINT pk_cpuesto_id_cpuesto PRIMARY KEY (id_cpuesto);

--csexo
ALTER TABLE csexo ADD  CONSTRAINT pk_csexo_id_sexo PRIMARY KEY (id_sexo);

--ctipo
ALTER TABLE ctipo ADD CONSTRAINT pk_ctipo_id_ctipo PRIMARY KEY (id_ctipo);

--ctipotel
ALTER TABLE ctipotel ADD CONSTRAINT pk_ctipotel_id_ctipotel PRIMARY KEY (id_ctipotel);

--domicilio
ALTER TABLE domicilio ADD CONSTRAINT pk_domicilio_id_domicilio PRIMARY KEY (id_domicilio);

--empleado
ALTER TABLE empleado ADD CONSTRAINT pk_empleado_nonomina PRIMARY KEY (nonomina);

--empleado_datos
ALTER TABLE empleado_datos ADD CONSTRAINT pk_empleado_datos_id_empleado_datos PRIMARY KEY (id_empleado_datos);

--encuesta
ALTER TABLE encuesta ADD CONSTRAINT pk_encuesta_id_encuesta PRIMARY KEY (id_encuesta);

--extra
ALTER TABLE extra ADD CONSTRAINT pk_extra_id_extra PRIMARY KEY (id_extra);

--facturas
ALTER TABLE factura ADD CONSTRAINT pk_factura_numero_factura PRIMARY KEY (numero_factura);

--miembro
ALTER TABLE miembro ADD CONSTRAINT pk_miembro_id_miembro PRIMARY KEY (id_miembro);

--orden
ALTER TABLE orden  ADD CONSTRAINT pk_orden_id_orden PRIMARY KEY (id_orden);

--paquete
ALTER TABLE paquete ADD CONSTRAINT pk_paquete_id_paquete PRIMARY KEY (id_paquete);

--persona
ALTER TABLE persona ADD CONSTRAINT pk_persona_id_persona PRIMARY KEY (id_persona);

--cproducto
ALTER TABLE cproducto ADD CONSTRAINT pk_cproducto_id_cproducto PRIMARY KEY (id_cproducto);

--servicio
ALTER TABLE servicio ADD CONSTRAINT pk_servicio_id_servicio PRIMARY KEY (id_servicio);

--telefono
ALTER TABLE telefono ADD CONSTRAINT pk_telefono_id_telefono PRIMARY KEY (id_telefono);

--vehiculo
ALTER TABLE vehiculo ADD CONSTRAINT pk_vehiculo_placa PRIMARY KEY (placa);

--vulcanizadora
ALTER TABLE vulcanizadora ADD CONSTRAINT pk_vulcanizadora_id_vulcanizadora PRIMARY KEY (id_vulcanizadora);

--sucursal
ALTER TABLE sucursal ADD CONSTRAINT pk_sucursal_id_sucursal PRIMARY KEY (id_sucursal);
--orden_sucursal
ALTER TABLE orden_sucursal ADD CONSTRAINT pk_orden_sucursal_id_orden_sucursal PRIMARY KEY (id_orden_sucursal);
/*

 **************************
     LLAVES FORANEAS
 **************************

 */

 --cliente
 ALTER TABLE cliente ADD CONSTRAINT fk_cliente_id_domicilio_domicilio_id_domicilio FOREIGN KEY (id_domicilio) REFERENCES domicilio(id_domicilio);

-- cliente_telefono
ALTER TABLE cliente_telefono ADD CONSTRAINT fk_cliente_telefono_id_cliente_cliente_id_cliente FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente);
ALTER TABLE cliente_telefono ADD CONSTRAINT fk_cliente_telefono_id_telefono_telefono_id_telefono FOREIGN KEY (id_telefono) REFERENCES telefono(id_telefono);

--empleado
ALTER TABLE empleado ADD CONSTRAINT fk_empleado_id_cpuesto_cpuesto_id_cpuesto FOREIGN KEY (id_cpuesto) REFERENCES cpuesto(id_cpuesto);
ALTER TABLE empleado ADD CONSTRAINT fk_empleado_id_empleado_datos_empleado_datos_id_empleado_datos FOREIGN KEY (id_empleado_datos) REFERENCES empleado_datos(id_empleado_datos);
ALTER TABLE empleado ADD CONSTRAINT fk_empleado_id_persona_persona_id_persona FOREIGN KEY (id_persona) REFERENCES persona(id_persona);
ALTER TABLE empleado ADD CONSTRAINT fk_empleado_id_sucursal_sucursal_id_sucursal FOREIGN KEY (id_sucursal) REFERENCES sucursal(id_sucursal);
--empleado_datos
ALTER TABLE empleado_datos ADD CONSTRAINT fk_empleado_datos_id_telefono_telefono_id_telefono FOREIGN KEY (id_telefono) REFERENCES telefono(id_telefono);
--encuesta id_orden
ALTER TABLE encuesta ADD CONSTRAINT fk_encuesta_id_orden_orden_id_orden FOREIGN KEY (id_orden) REFERENCES orden(id_orden);

--extra
ALTER TABLE extra ADD CONSTRAINT fk_extra_id_servicio_servicio_id_servicio FOREIGN KEY (id_servicio) REFERENCES servicio(id_servicio);

--factura
ALTER TABLE factura ADD CONSTRAINT fk_factura_id_orden_orden_id_orden FOREIGN KEY (id_orden) REFERENCES orden(id_orden);
--inventario
ALTER TABLE inventario ADD CONSTRAINT fk_inventario_id_sucursal_sucursal_id_sucursal FOREIGN KEY (id_sucursal) REFERENCES sucursal(id_sucursal);
ALTER TABLE inventario ADD CONSTRAINT fk_inventario_id_cproducto_cproducto_id_cproducto FOREIGN KEY (id_cproducto) REFERENCES cproducto(id_cproducto);

--miembro
ALTER TABLE miembro ADD CONSTRAINT fk_miembro_id_persona_persona_id_persona FOREIGN KEY (id_persona) REFERENCES persona(id_persona);

--miembro_telefono
ALTER TABLE miembro_telefono ADD CONSTRAINT fk_miembro_telefono_id_miembro_miembro_id_miembro FOREIGN KEY (id_miembro) REFERENCES miembro(id_miembro);
ALTER TABLE miembro_telefono ADD CONSTRAINT fk_miembro_telefono_id_telefono_telefono_id_telefono FOREIGN KEY (id_telefono) REFERENCES telefono(id_telefono);

--orden
ALTER TABLE orden ADD CONSTRAINT fk_orden_id_miembro_miembro_id_miembro FOREIGN KEY (id_miembro) REFERENCES miembro(id_miembro);
ALTER TABLE orden ADD CONSTRAINT fk_orden_id_cliente_cliente_id_cliente FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente);
ALTER TABLE orden ADD CONSTRAINT fk_orden_nonomina_empleado_nonomina FOREIGN KEY (nonomina) REFERENCES empleado(nonomina);
ALTER TABLE orden ADD CONSTRAINT fk_orden_placa_vehiculo_placa FOREIGN KEY (placa) REFERENCES vehiculo(placa);
ALTER TABLE orden ADD CONSTRAINT fk_orden_id_cpago_cpago_id_cpago FOREIGN KEY (id_cpago) REFERENCES cpago(id_cpago);
ALTER TABLE orden ADD CONSTRAINT fk_orden_id_sucusal_sucursal_id_sucursal FOREIGN KEY (id_sucursal) REFERENCES sucursal(id_sucursal);
--orden_cproducto
ALTER TABLE orden_cproducto ADD CONSTRAINT fk_orden_cproducto_id_orden_orden_id_orden FOREIGN KEY (id_orden) REFERENCES orden(id_orden);
ALTER TABLE orden_cproducto ADD CONSTRAINT fk_orden_cproducto_id_cproducto_cproducto_id_cproducto FOREIGN KEY (id_cproducto) REFERENCES cproducto(id_cproducto);

--orden_servicio
ALTER TABLE orden_servicio ADD CONSTRAINT fk_orden_servicio_id_servicio_servicio_id_servicio FOREIGN KEY (id_servicio) REFERENCES servicio(id_servicio);
ALTER TABLE orden_servicio ADD CONSTRAINT fk_orden_servicio_id_orden_orden_id_orden FOREIGN KEY (id_orden) REFERENCES orden(id_orden);
--orden_sucursal
ALTER TABLE orden_sucursal ADD CONSTRAINT fk_orden_sucursal_id_sucursal_sucursal_id_sucursal FOREIGN KEY (id_sucursal) REFERENCES sucursal(id_sucursal);
ALTER TABLE orden_sucursal ADD CONSTRAINT fk_orden_sucursal_nonomina_empleado_nonomina FOREIGN KEY (nonomina) REFERENCES empleado(nonomina);

--orden_sucursal_cproducto
ALTER TABLE orden_sucursal_cproducto ADD CONSTRAINT fk_orden_sucursal_cproducto_id_orden_sucursal_orden_sucursal FOREIGN KEY (id_orden_sucursal) REFERENCES orden_sucursal(id_orden_sucursal);
ALTER TABLE orden_sucursal_cproducto ADD CONSTRAINT fk_orden_sucursal_cproducto_id_cproducto_cproducto_id_cproducto FOREIGN KEY (id_cproducto) REFERENCES cproducto(id_cproducto);
--paquete
ALTER TABLE paquete ADD CONSTRAINT fk_paquete_id_servicio_servicio_id_servicio FOREIGN KEY (id_servicio) REFERENCES servicio(id_servicio);

--persona
ALTER TABLE persona ADD CONSTRAINT fk_persona_id_correo_correo_persona_id_correo FOREIGN KEY (id_correo) REFERENCES correo_persona(id_correo);
ALTER TABLE persona ADD CONSTRAINT fk_persona_id_domicilio_domicilio_id_domicilio FOREIGN KEY (id_domicilio) REFERENCES domicilio(id_domicilio);
ALTER TABLE persona ADD CONSTRAINT fk_persona_id_sexo_csexo_id_sexo FOREIGN KEY (id_sexo) REFERENCES csexo(id_sexo);

--servicio
ALTER TABLE servicio ADD CONSTRAINT fk_servicio_id_ctipo_ctipo_id_ctipo FOREIGN KEY (id_ctipo) REFERENCES ctipo(id_ctipo);
--sucursal
ALTER TABLE sucursal ADD CONSTRAINT fk_sucursal_id_domicilio_domicilio_id_domicilio FOREIGN KEY (id_domicilio) REFERENCES domicilio(id_domicilio);

--telefono
ALTER TABLE telefono ADD CONSTRAINT fk_telefono_id_ctipotel_ctipotel_id_ctipotel FOREIGN KEY (id_ctipotel) REFERENCES ctipotel(id_ctipotel);


--vehiculo
ALTER TABLE vehiculo ADD CONSTRAINT fk_vehiculo_id_ctipo_ctipo_id_ctipo FOREIGN KEY (id_ctipo) REFERENCES ctipo(id_ctipo);
ALTER TABLE vehiculo ADD CONSTRAINT fk_vehiculo_id_miembro_miembro_id_miembro FOREIGN KEY (id_miembro) REFERENCES miembro(id_miembro);
ALTER TABLE vehiculo ADD CONSTRAINT fk_vehiculo_id_cliente_cliente_id_cliente FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente);
ALTER TABLE vehiculo ADD CONSTRAINT fk_vehiculo_id_ccolor_ccolor_id_ccolor FOREIGN KEY (id_ccolor) REFERENCES ccolor(id_ccolor);
--vulcanizadora
ALTER TABLE vulcanizadora ADD CONSTRAINT fk_vulcanizadora_id_servicio_servicio_id_servicio FOREIGN KEY (id_servicio) REFERENCES servicio(id_servicio);

/*

 **************************
   RESTRICCION DE DOMINIO
 **************************

 */

--correo_persona
ALTER TABLE correo_persona ADD CONSTRAINT chk_correo_persona_correo CHECK (correo LIKE '%@%');

--Restriccion cpago
ALTER TABLE cpago ADD CONSTRAINT chk_cpago_nombre_pago CHECK ( nombre_pago IN ('tarjeta','efectivo') );

--Restriccion cpuesto
ALTER TABLE cpuesto ADD CONSTRAINT chk_cpuesto_salario CHECK (salario>0);

--csexo
ALTER TABLE csexo ADD CONSTRAINT chk_csexo_sexo CHECK (sexo IN ('M','F'));

--Restriccion ctipo
ALTER TABLE ctipo ADD CONSTRAINT chk_ctipo_tipo CHECK(tipo IN ('moto','automovil','camioneta pequena', 'camioneta grande'));

--Restriccion ctipotel
ALTER TABLE ctipotel ADD CONSTRAINT chk_ctipotel_tipotel CHECK(tipotel IN ('casa','celular','oficina'));

--domicilio
ALTER TABLE domicilio ADD CONSTRAINT chk_domicilio_codigopostal CHECK(codigopostal SIMILAR TO '[0-9][0-9][0-9][0-9][0-9]');

--empleado_datos
ALTER TABLE empleado_datos ADD CONSTRAINT chk_empleado_datos_noss CHECK (noss SIMILAR TO '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]');
ALTER TABLE empleado_datos ADD CONSTRAINT chk_empleado_datos_rfc CHECK ( rfc SIMILAR TO '[A-Z][A-Z][A-Z][A-Z][0-9][0-9][0-9][0-9][0-9][0-9]%' );

--encuesta
ALTER TABLE encuesta ADD CONSTRAINT chk_encuesta_amabilidad CHECK(amabilidad IN ('1','2','3','4','5'));
ALTER TABLE encuesta ADD CONSTRAINT chk_encuesta_calidad CHECK(calidad IN ('1','2','3','4','5'));
ALTER TABLE encuesta ADD CONSTRAINT chk_encuesta_tiempo CHECK(tiempo IN ('1','2','3','4','5') );
ALTER TABLE encuesta ADD CONSTRAINT chk_encuesta_precios CHECk (precios IN ('1','2','3','4','5') );
--inventario
ALTER TABLE inventario ADD CONSTRAINT chk_inventario_cantidad CHECK ( cantidad>=0 );
--orden
ALTER TABLE orden ADD CONSTRAINT chk_orden_monto_pagar CHECK (monto_pagar IN (monto_total,monto_total*0.9));

--orden_cproducto
ALTER TABLE orden_cproducto ADD CONSTRAINT chk_orden_producto_cantidad CHECK ( cantidad>0 );

--orden_servicio
ALTER TABLE orden_servicio ADD CONSTRAINT chk_orden_servicio_cantidad CHECK ( cantidad>0 );
--orden_sucursal
ALTER TABLE orden_sucursal ADD CONSTRAINT chk_orden_sucursal_monto_totalsuc CHECK ( monto_totalsuc>0 );
--orden_sucursal_cproducto
ALTER TABLE orden_sucursal_cproducto ADD CONSTRAINT chk_orden_sucursal_cproducto_cantidad CHECK ( cantidad>0 );

--cproducto
ALTER TABLE cproducto ADD CONSTRAINT chk_cproducto_costo CHECK ( costo>0 );
ALTER TABLE cproducto ADD CONSTRAINT chk_cproducto_preciopublico CHECK ( preciopublico>costo );

--servicio
ALTER TABLE servicio ADD CONSTRAINT chk_servicio_tiempo_espera CHECK ( tiempo_espera BETWEEN '0'::INTERVAL AND '5 hours'::INTERVAL);
ALTER TABLE servicio ADD CONSTRAINT chk_servicio_precio CHECK ( precio>0 );

--telefono
ALTER TABLE telefono ADD CONSTRAINT chk_telefono_telefono CHECK (telefono SIMILAR TO '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]');


/*

 **************************
   RESTRICCION DE NULIDAD
 **************************

 */

--ccolor
ALTER TABLE ccolor ALTER COLUMN color SET NOT NULL;

--correo_persona
ALTER TABLE correo_persona ALTER COLUMN correo SET NOT NULL;

--cpago
ALTER TABLE cpago ALTER COLUMN nombre_pago SET NOT NULL;

--cpuesto
ALTER TABLE cpuesto ALTER COLUMN nombre_puesto SET NOT NULL;
ALTER TABLE cpuesto ALTER COLUMN salario SET NOT NULL;

--csexo
ALTER TABLE csexo ALTER COLUMN sexo SET NOT NULL;

--ctipo
ALTER TABLE ctipo ALTER COLUMN tipo SET NOT NULL;

--ctipo
ALTER TABLE ctipotel ALTER COLUMN tipotel SET NOT NULL;

--domicilio
ALTER TABLE domicilio ALTER COLUMN calle SET NOT NULL;
ALTER TABLE domicilio ALTER COLUMN colonia SET NOT NULL;
ALTER TABLE domicilio ALTER COLUMN delegacion SET NOT NULL;
ALTER TABLE domicilio ALTER COLUMN codigopostal SET NOT NULL;
ALTER TABLE domicilio ALTER COLUMN numeroexterior SET NOT NULL;

--empleado
ALTER TABLE empleado ALTER COLUMN id_cpuesto SET NOT NULL;
ALTER TABLE empleado ALTER COLUMN id_empleado_datos SET NOT NULL;
ALTER TABLE empleado ALTER COLUMN id_persona SET NOT NULL;
ALTER TABLE empleado ALTER COLUMN id_sucursal SET NOT NULL;
--empleado_datos
ALTER TABLE empleado_datos ALTER COLUMN noss SET NOT NULL;
ALTER TABLE empleado_datos ALTER COLUMN rfc SET NOT NULL;
ALTER TABLE empleado_datos ALTER COLUMN id_telefono SET NOT NULL;
--encuesta
ALTER TABLE encuesta ALTER COLUMN amabilidad SET NOT NULL;
ALTER TABLE encuesta ALTER COLUMN calidad SET NOT NULL;
ALTER TABLE encuesta ALTER COLUMN tiempo SET NOT NULL;
ALTER TABLE encuesta ALTER COLUMN precios SET NOT NULL;

--extra
ALTER TABLE extra ALTER COLUMN tipo_extra SET NOT NULL;
ALTER TABLE extra ALTER COLUMN id_servicio SET NOT NULL;

--factura
ALTER TABLE factura ALTER COLUMN id_orden SET NOT NULL;
--inventario
ALTER TABLE inventario ALTER COLUMN id_sucursal SET NOT NULL;
ALTER TABLE inventario ALTER COLUMN id_cproducto SET NOT NULL;
ALTER TABLE inventario ALTER COLUMN cantidad SET NOT NULL;
--miembro
ALTER TABLE miembro ALTER COLUMN id_persona SET NOT NULL;
ALTER TABLE miembro ALTER COLUMN vigencia SET NOT NULL;
--miembro_telefono
ALTER TABLE miembro_telefono ALTER COLUMN id_miembro SET NOT NULL;
ALTER TABLE miembro_telefono ALTER COLUMN id_telefono SET NOT NULL;
--orden
ALTER TABLE orden ALTER COLUMN monto_total SET NOT NULL;
ALTER TABLE orden ALTER COLUMN fechahora SET NOT NULL;
ALTER TABLE orden ALTER COLUMN monto_pagar SET NOT NULL;
ALTER TABLE orden ALTER COLUMN descuento SET NOT NULL;
ALTER TABLE orden ALTER COLUMN nonomina SET NOT NULL;
ALTER TABLE orden ALTER COLUMN id_cpago SET NOT NULL;
ALTER TABLE orden ALTER COLUMN a_domicilio SET NOT NULL;
ALTER TABLE orden ALTER COLUMN id_sucursal SET NOT NULL;
--orden_cproducto
ALTER TABLE orden_cproducto ALTER COLUMN id_orden SET NOT NULL;
ALTER TABLE orden_cproducto ALTER COLUMN id_cproducto SET NOT NULL;
ALTER TABLE orden_cproducto ALTER COLUMN cantidad SET NOT NULL;

--orden_servicio
ALTER TABLE orden_servicio ALTER COLUMN cantidad SET NOT NULL;
ALTER TABLE orden_servicio ALTER COLUMN id_orden SET NOT NULL;
ALTER TABLE orden_servicio ALTER COLUMN id_servicio SET NOT NULL;
--orden_sucursal
ALTER TABLE orden_sucursal ALTER COLUMN fechahorasuc SET NOT NULL;
ALTER TABLE orden_sucursal ALTER COLUMN monto_totalsuc SET NOT NULL;
ALTER TABLE orden_sucursal ALTER COLUMN id_sucursal SET NOT NULL;
ALTER TABLE orden_sucursal ALTER COLUMN nonomina SET NOT NULL;
--orden_sucursal_cproducto
ALTER TABLE orden_sucursal_cproducto ALTER COLUMN cantidad SET NOT NULL;
ALTER TABLE orden_sucursal_cproducto ALTER COLUMN id_orden_sucursal SET NOT NULL;
ALTER TABLE orden_sucursal_cproducto ALTER COLUMN id_cproducto SET NOT NULL;
--paquete
ALTER TABLE paquete ALTER COLUMN nombre_paquete SET NOT NULL;
ALTER TABLE paquete ALTER COLUMN id_servicio SET NOT NULL;

--persona
ALTER TABLE persona ALTER COLUMN app SET NOT NULL;
ALTER TABLE persona ALTER COLUMN nombre SET NOT NULL;
ALTER TABLE persona ALTER COLUMN fechanacimiento SET NOT NULL;
ALTER TABLE persona ALTER COLUMN id_correo SET NOT NULL;
ALTER TABLE persona ALTER COLUMN id_domicilio SET NOT NULL;
ALTER TABLE persona ALTER COLUMN id_sexo SET NOT NULL;

--cproducto
ALTER TABLE cproducto ALTER COLUMN nombre SET NOT NULL;
ALTER TABLE cproducto ALTER COLUMN costo SET NOT NULL;
ALTER TABLE cproducto ALTER COLUMN preciopublico SET NOT NULL;

--servicio
ALTER TABLE servicio ALTER COLUMN precio SET NOT NULL;
ALTER TABLE servicio ALTER COLUMN tiempo_espera SET NOT NULL;
ALTER TABLE servicio ALTER COLUMN id_ctipo SET NOT NULL;
--sucursal
ALTER TABLE sucursal ALTER COLUMN nombre SET NOT NULL;
ALTER TABLE sucursal ALTER COLUMN id_domicilio SET NOT NULL;
--telefono
ALTER TABLE telefono ALTER COLUMN telefono SET NOT NULL;
ALTER TABLE telefono ALTER COLUMN id_ctipotel SET NOT NULL;

--vehiculo
ALTER TABLE vehiculo ALTER COLUMN placa SET NOT NULL;
ALTER TABLE vehiculo ALTER COLUMN modelo SET NOT NULL;
ALTER TABLE vehiculo ALTER COLUMN marca SET NOT NULL;
ALTER TABLE vehiculo ALTER COLUMN id_ctipo SET NOT NULL;
ALTER TABLE vehiculo ALTER COLUMN id_ccolor SET NOT NULL;
--vulcanizadora
ALTER TABLE vulcanizadora ALTER COLUMN tipovulcanizadora SET NOT NULL;
ALTER TABLE vulcanizadora ALTER COLUMN id_servicio SET NOT NULL;