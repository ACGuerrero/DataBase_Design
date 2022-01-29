/*

 ***************************************
        PRELIMINARES: CATALOGOS
 ***************************************

 */
--ccolor
INSERT INTO ccolor(color) VALUES ('Violeta'),('Verde'),('Turquesa'),('Rosado'),('Rojo'),('Plateado'),('Negro'),('Naranja'),('Morado'),('Marrón'),('Índigo'),('Gris'),('Fuscia'),('Dorado'),('Amarillo'),('Azul'),('Blanco'),('Caqui'),('Carmesí'),('Cyan');

--cpago
INSERT INTO cpago (id_cpago,nombre_pago) VALUES (1,'efectivo'),(2,'tarjeta');

--cpuesto
INSERT INTO cpuesto (id_cpuesto,nombre_puesto,salario) VALUES (1,'lavador',14800),(2,'administrador',16000),(3,'recepcionista',15300),(4,'cajero',14000),(5,'telefonista',14500),(6,'mecánico',15800);

--csexo
INSERT INTO csexo (id_sexo,sexo) VALUES (1,'F'),(2,'M');

--ctipo
INSERT INTO ctipo (id_ctipo,tipo) VALUES (1,'moto'),(2,'automovil'),(3,'camioneta pequena'),(4,'camioneta grande');

-- ctipotel
INSERT INTO ctipotel(id_ctipotel,tipotel) VALUES (1,'casa'),(2,'celular'),(3,'oficina');

--servicio (paquetes)
INSERT INTO servicio(precio, tiempo_espera, id_ctipo) VALUES (30,'00:40:00',1);
INSERT INTO servicio(precio, tiempo_espera, id_ctipo) VALUES (80,'00:40:00',2);
INSERT INTO servicio(precio, tiempo_espera, id_ctipo) VALUES (100,'00:40:00',3);
INSERT INTO servicio(precio, tiempo_espera, id_ctipo) VALUES (120,'00:40:00',4);


INSERT INTO servicio(precio, tiempo_espera, id_ctipo) VALUES(95,'00:50:00',2);
INSERT INTO servicio(precio, tiempo_espera, id_ctipo) VALUES(115,'00:50:00',3);
INSERT INTO servicio(precio, tiempo_espera, id_ctipo) VALUES(135,'00:50:00',4);

INSERT INTO servicio(precio, tiempo_espera, id_ctipo) VALUES(150,'01:00:00',2);
INSERT INTO servicio(precio, tiempo_espera, id_ctipo) VALUES(180,'01:00:00',3);
INSERT INTO servicio(precio, tiempo_espera, id_ctipo) VALUES(200,'01:00:00',4);

INSERT INTO servicio(precio, tiempo_espera, id_ctipo) VALUES(230,'02:30:00',2);
INSERT INTO servicio(precio, tiempo_espera, id_ctipo) VALUES(300,'02:30:00',3);
INSERT INTO servicio(precio, tiempo_espera, id_ctipo) VALUES(400,'02:30:00',4);



--paquete
INSERT INTO paquete(nombre_paquete, id_servicio) VALUES ('Express moto',1);
INSERT INTO paquete(nombre_paquete, id_servicio) VALUES ('Express auto',2);
INSERT INTO paquete(nombre_paquete, id_servicio) VALUES ('Express camioneta chica',3);
INSERT INTO paquete(nombre_paquete, id_servicio) VALUES ('Express camioneta grande',4);

INSERT INTO paquete(nombre_paquete, id_servicio) VALUES ('Básico auto',5);
INSERT INTO paquete(nombre_paquete, id_servicio) VALUES ('Básico camioneta chica',6);
INSERT INTO paquete(nombre_paquete, id_servicio) VALUES ('Básico camioneta grande',7);

INSERT INTO paquete(nombre_paquete, id_servicio) VALUES ('Premium auto',8);
INSERT INTO paquete(nombre_paquete, id_servicio) VALUES ('Premium camioneta chica',9);
INSERT INTO paquete(nombre_paquete, id_servicio) VALUES ('Premium camioneta grande',10);

INSERT INTO paquete(nombre_paquete, id_servicio) VALUES ('VIP auto',11);
INSERT INTO paquete(nombre_paquete, id_servicio) VALUES ('VIP camioneta chica',12);
INSERT INTO paquete(nombre_paquete, id_servicio) VALUES ('VIP camioneta grande',13);

--servicios
--(vulcanizadora)
INSERT INTO servicio(precio,tiempo_espera,id_ctipo) VALUES (80,'00:45:00',1);
INSERT INTO servicio(precio,tiempo_espera,id_ctipo) VALUES (80,'00:45:00',2);
INSERT INTO servicio(precio,tiempo_espera,id_ctipo) VALUES (80,'00:45:00',3);
INSERT INTO servicio(precio,tiempo_espera,id_ctipo) VALUES (80,'00:45:00',4);
INSERT INTO servicio(precio,tiempo_espera,id_ctipo) VALUES (70,'01:10:00',1);
INSERT INTO servicio(precio,tiempo_espera,id_ctipo) VALUES (70,'01:10:00',2);
INSERT INTO servicio(precio,tiempo_espera,id_ctipo) VALUES (70,'01:10:00',3);
INSERT INTO servicio(precio,tiempo_espera,id_ctipo) VALUES (70,'01:10:00',4);
INSERT INTO servicio(precio,tiempo_espera,id_ctipo) VALUES (140,'02:00:00',1);
INSERT INTO servicio(precio,tiempo_espera,id_ctipo) VALUES (140,'02:00:00',2);
INSERT INTO servicio(precio,tiempo_espera,id_ctipo) VALUES (140,'02:00:00',3);
INSERT INTO servicio(precio,tiempo_espera,id_ctipo) VALUES (140,'02:00:00',4);
--(extra)
INSERT INTO servicio(precio,tiempo_espera,id_ctipo) VALUES (70,'00:30:00',2);
INSERT INTO servicio(precio,tiempo_espera,id_ctipo) VALUES (90,'00:30:00',3);
INSERT INTO servicio(precio,tiempo_espera,id_ctipo) VALUES (90,'00:30:00',4);
INSERT INTO servicio(precio,tiempo_espera,id_ctipo) VALUES (30,'00:15:00',2);
INSERT INTO servicio(precio,tiempo_espera,id_ctipo) VALUES (50,'00:15:00',3);
INSERT INTO servicio(precio,tiempo_espera,id_ctipo) VALUES (50,'00:15:00',4);
INSERT INTO servicio(precio,tiempo_espera,id_ctipo) VALUES (40,'00:15:00',2);
INSERT INTO servicio(precio,tiempo_espera,id_ctipo) VALUES (60,'00:15:00',3);
INSERT INTO servicio(precio,tiempo_espera,id_ctipo) VALUES (60,'00:15:00',4);
INSERT INTO servicio(precio,tiempo_espera,id_ctipo) VALUES (100,'02:00:00',2);
INSERT INTO servicio(precio,tiempo_espera,id_ctipo) VALUES (130,'02:00:00',3);
INSERT INTO servicio(precio,tiempo_espera,id_ctipo) VALUES (130,'02:00:00',4);


--vulcanizadora
INSERT INTO vulcanizadora (tipovulcanizadora,id_servicio) VALUES ('Parchado moto',14);
INSERT INTO vulcanizadora (tipovulcanizadora,id_servicio) VALUES ('Parchado auto',15);
INSERT INTO vulcanizadora (tipovulcanizadora,id_servicio) VALUES ('Parchado camioneta chica',16);
INSERT INTO vulcanizadora (tipovulcanizadora,id_servicio) VALUES ('Parchado camioneta grande',17);
INSERT INTO vulcanizadora (tipovulcanizadora,id_servicio) VALUES ('Balajeo moto',18);
INSERT INTO vulcanizadora (tipovulcanizadora,id_servicio) VALUES ('Balajeo auto',19);
INSERT INTO vulcanizadora (tipovulcanizadora,id_servicio) VALUES ('Balajeo camioneta chica',20);
INSERT INTO vulcanizadora (tipovulcanizadora,id_servicio) VALUES ('Balajeo camioneta grande',21);
INSERT INTO vulcanizadora (tipovulcanizadora,id_servicio) VALUES ('Montaje moto',22);
INSERT INTO vulcanizadora (tipovulcanizadora,id_servicio) VALUES ('Montaje auto',23);
INSERT INTO vulcanizadora (tipovulcanizadora,id_servicio) VALUES ('Montaje camioneta chica',24);
INSERT INTO vulcanizadora (tipovulcanizadora,id_servicio) VALUES ('Montaje camioneta grande',25);


--extra
INSERT INTO extra (tipo_extra,id_servicio) VALUES ('Lavado de motor',26);
INSERT INTO extra (tipo_extra,id_servicio) VALUES ('Lavado de motor',27);
INSERT INTO extra (tipo_extra,id_servicio) VALUES ('Lavado de motor',28);
INSERT INTO extra (tipo_extra,id_servicio) VALUES ('Aspirado de cajuela',29);
INSERT INTO extra (tipo_extra,id_servicio) VALUES ('Aspirado de cajuela',30);
INSERT INTO extra (tipo_extra,id_servicio) VALUES ('Aspirado de cajuela',31);
INSERT INTO extra (tipo_extra,id_servicio) VALUES ('Abrillantador en interior',32);
INSERT INTO extra (tipo_extra,id_servicio) VALUES ('Abrillantador en interior',33);
INSERT INTO extra (tipo_extra,id_servicio) VALUES ('Abrillantador en interior',34);
INSERT INTO extra (tipo_extra,id_servicio) VALUES ('Pulido y encerado',35);
INSERT INTO extra (tipo_extra,id_servicio) VALUES ('Pulido y encerado',36);
INSERT INTO extra (tipo_extra,id_servicio) VALUES ('Pulido y encerado',37);

--producto
INSERT INTO cproducto(nombre,preciopublico,costo) VALUES ('Aceite de motor sintético marca castrol 4.7 L',925,925/2);
INSERT INTO cproducto(nombre,preciopublico,costo) VALUES ('Aceite de motor semi-sintetico 4 L',745,745/2);
INSERT INTO cproducto(nombre,preciopublico,costo) VALUES ('Aceite de motor de alto kilometraje 4.73 L',979,979/2);
INSERT INTO cproducto(nombre,preciopublico,costo) VALUES ('Aceite de motor convencional 3.78 L',1299,1299/2);
INSERT INTO cproducto(nombre,preciopublico,costo) VALUES ('Plumas limpiadoras de parabrisas 16/40.6 ',198,198/2);
INSERT INTO cproducto(nombre,preciopublico,costo) VALUES ('Plumas limpiadoras de parabrisas 20/50.8',198,198/2);
INSERT INTO cproducto(nombre,preciopublico,costo) VALUES ('Plumas limpiadoras de parabrisas 22/55.8',220,220/2);
INSERT INTO cproducto(nombre,preciopublico,costo) VALUES ('Desengrasante de motor 20 L',699,699/2);
INSERT INTO cproducto(nombre,preciopublico,costo) VALUES ('Líquido limpiaparabrisas 500 ml',170,170/2);
INSERT INTO cproducto(nombre,preciopublico,costo) VALUES ('Abrillantador de llantas de auto 900 ml',398,398/2);
INSERT INTO cproducto(nombre,preciopublico,costo) VALUES ('Shampoocar con cera 1.89 L ',589,589/2);
INSERT INTO cproducto(nombre,preciopublico,costo) VALUES ('Trapos de microfibra ',70,70/2);
INSERT INTO cproducto(nombre,preciopublico,costo) VALUES ('Pulidor líquido polish 520 ml ',100,100/2);
INSERT INTO cproducto(nombre,preciopublico,costo) VALUES ('Cera sintetica 473 ml ',293,293/2);
INSERT INTO cproducto(nombre,preciopublico,costo) VALUES ('Silicona tablero de auto 300 ml',175,175/2);
INSERT INTO cproducto(nombre,preciopublico,costo) VALUES ('Tapetes de autos uso rudo',680,680/2);
INSERT INTO cproducto(nombre,preciopublico,costo) VALUES ('Cubreasientos deportivo ',1399,1399/2);
INSERT INTO cproducto(nombre,preciopublico,costo) VALUES ('Cables pasa corriente',220,220/2);
INSERT INTO cproducto(nombre,preciopublico,costo) VALUES ('Baterias D35',1700,1700/2);
INSERT INTO cproducto(nombre,preciopublico,costo) VALUES ('Baterias G34',1800,1800/2);
INSERT INTO cproducto(nombre,preciopublico,costo) VALUES ('Baterias G24',1500,1500/2);


