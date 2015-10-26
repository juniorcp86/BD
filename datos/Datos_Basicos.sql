/*TABLA: ESTADOS*/
INSERT INTO KIOSCO.ESTADOS VALUES (DEFAULT,'Activo','Estado para todos los elementos que tiene todas las opciones disponibles en el sistema y puede ser utilizado por todas las entidades que tengan asignado un estado.',CURRENT_TIMESTAMP,NULL,NULL);
INSERT INTO KIOSCO.ESTADOS VALUES (DEFAULT,'Bloqueado','Estado para todos los elementos que NO tienen permitido ingresar al sistema, han sido descartados para su uso por alguna falta o discrepancia en los datos. Estos elementos no pueden ser usados por ninguna entidad del sistema.',CURRENT_TIMESTAMP,NULL,NULL);
INSERT INTO KIOSCO.ESTADOS VALUES (DEFAULT,'Inactivo','Estado para todos los elementos que han sido deshabilitados del sistema, las condiciones varían dependiendo de la entidad que tenga el estado. Mientras se encuentren en este estado no pueden ser usados en el sistema, pero debe ser validado e informado a los usuarios.',CURRENT_TIMESTAMP,NULL,NULL);
INSERT INTO KIOSCO.ESTADOS VALUES (DEFAULT,'Eliminado','Estado para todos los elementos que han sido borrados lógicamente del sistema. Estos elementos no deben ser visualizado o utilizados en ninguna parte del sistema.',CURRENT_TIMESTAMP,NULL,NULL);

/*TABLA: ROLES*/
INSERT INTO KIOSCO.ROLES VALUES (DEFAULT,'Administrador','Súper usuario del sistema, no tiene límites para crear, actualizar, consultar y eliminar lógicamente información. Es el único con privilegios para mover de estados a los usuarios y vendedores. (Incluye funciones de los roles Cliente, Vendedor y Empleado).','',CURRENT_TIMESTAMP,NULL,NULL);
INSERT INTO KIOSCO.ROLES VALUES (DEFAULT,'Cliente','Usuario que solo debe tener cuentas por pagar o montos a su favor. Acceso solo a su información. (No incluye funciones de otros roles).','',CURRENT_TIMESTAMP,NULL,NULL);
INSERT INTO KIOSCO.ROLES VALUES (DEFAULT,'Vendedor','Usuario vendedor independiente o de una empresa. Acceso solo a su información personal y los datos de los productos que vende. (Incluye funciones del rol Cliente).','',CURRENT_TIMESTAMP,NULL,NULL);
INSERT INTO KIOSCO.ROLES VALUES (DEFAULT,'Empleado','Usuario que tiene acceso para consultar y agregar datos en las cuentas de los clientes, pero no puede eliminar y/o actualizar las cuentas. (Incluye funciones de los roles Cliente y Vendedor).','',CURRENT_TIMESTAMP,NULL,NULL);

/*TABLA: USUARIOS*/
INSERT INTO KIOSCO.USUARIOS VALUES (DEFAULT,'17641081','V','Junior Casique','juniorcp86@gmail.com','04241996265','1','1',NULL,CURRENT_TIMESTAMP,NULL,NULL);
INSERT INTO KIOSCO.USUARIOS VALUES (DEFAULT,'','','','','','','',NULL,CURRENT_TIMESTAMP,NULL,NULL);
INSERT INTO KIOSCO.USUARIOS VALUES (DEFAULT,'','','','','','','',NULL,CURRENT_TIMESTAMP,NULL,NULL);
INSERT INTO KIOSCO.USUARIOS VALUES (DEFAULT,'','','','','','','',NULL,CURRENT_TIMESTAMP,NULL,NULL);
INSERT INTO KIOSCO.USUARIOS VALUES (DEFAULT,'','','','','','','',NULL,CURRENT_TIMESTAMP,NULL,NULL);

/*TABLA: PROVEEDORES*/
INSERT INTO KIOSCO.PROVEEDORES VALUES (DEFAULT,'J-294556507','Distribuida Careste, C.A.','',CURRENT_TIMESTAMP,NULL,NULL);
INSERT INTO KIOSCO.PROVEEDORES VALUES (DEFAULT,'','','',CURRENT_TIMESTAMP,NULL,NULL);
INSERT INTO KIOSCO.PROVEEDORES VALUES (DEFAULT,'','','',CURRENT_TIMESTAMP,NULL,NULL);
INSERT INTO KIOSCO.PROVEEDORES VALUES (DEFAULT,'','','',CURRENT_TIMESTAMP,NULL,NULL);
INSERT INTO KIOSCO.PROVEEDORES VALUES (DEFAULT,'','','',CURRENT_TIMESTAMP,NULL,NULL);

/*TABLA: CONTACTO_PROVEEDOR*/
INSERT INTO KIOSCO.CONTACTO_PROVEEDOR VALUES ('','','','',NULL,NULL,'',NULL,NULL);
INSERT INTO KIOSCO.CONTACTO_PROVEEDOR VALUES ('','','','',NULL,NULL,'',NULL,NULL);
INSERT INTO KIOSCO.CONTACTO_PROVEEDOR VALUES ('','','','',NULL,NULL,'',NULL,NULL);
INSERT INTO KIOSCO.CONTACTO_PROVEEDOR VALUES ('','','','',NULL,NULL,'',NULL,NULL);
INSERT INTO KIOSCO.CONTACTO_PROVEEDOR VALUES ('','','','',NULL,NULL,'',NULL,NULL);

/*TABLA: TIPO_SERVICIOS*/
INSERT INTO KIOSCO.TIPO_SERVICIOS VALUES (DEFAULT,'Tarjetas Telefónicas Movistar','Distribución de tarjetas telefónicas Movistar',CURRENT_TIMESTAMP,NULL,NULL);
INSERT INTO KIOSCO.TIPO_SERVICIOS VALUES (DEFAULT,'','',CURRENT_TIMESTAMP,NULL,NULL);
INSERT INTO KIOSCO.TIPO_SERVICIOS VALUES (DEFAULT,'','',CURRENT_TIMESTAMP,NULL,NULL);
INSERT INTO KIOSCO.TIPO_SERVICIOS VALUES (DEFAULT,'','',CURRENT_TIMESTAMP,NULL,NULL);
INSERT INTO KIOSCO.TIPO_SERVICIOS VALUES (DEFAULT,'','',CURRENT_TIMESTAMP,NULL,NULL);

/*TABLA: PROVEEDORES_TIPO_SERVICIOS*/
INSERT INTO KIOSCO.PROVEEDORES_TIPO_SERVICIOS VALUES ('','');
INSERT INTO KIOSCO.PROVEEDORES_TIPO_SERVICIOS VALUES ('','');
INSERT INTO KIOSCO.PROVEEDORES_TIPO_SERVICIOS VALUES ('','');
INSERT INTO KIOSCO.PROVEEDORES_TIPO_SERVICIOS VALUES ('','');
INSERT INTO KIOSCO.PROVEEDORES_TIPO_SERVICIOS VALUES ('','');