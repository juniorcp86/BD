/*
* NOMBRE BASE DE DATOS: KIOSCO
* NOMBRE DE LA TABLA: ROLES
* FECHA DE CREACIÓN: DD/MM/AAAA
* CREADO POR: Junior Casique
* FECHA DE ACTUALIZACIÓN: 
* ACTUALIZADO POR: 
* DESCRIPCIÓN: Script para realizar la inserción de datos en la tabla mencionada.
*/

INSERT INTO KIOSCO.ROLES VALUES (DEFAULT,'Administrador','Super usuario del sistema, no tiene límites para crear, actualizar, consultar y eliminar lógicamente información. Es el único con privilegios para mover de estados a los usuarios y vendedores. (Incluye funciones de los roles Cliente, Vendedor y Empleado).','',CURRENT_TIMESTAMP,NULL,NULL);
INSERT INTO KIOSCO.ROLES VALUES (DEFAULT,'Cliente','Usuario que solo debe tener cuentas por pagar o montos a su favor. Acceso solo a su información. (No incluye funciones de otros roles).','',CURRENT_TIMESTAMP,NULL,NULL);
INSERT INTO KIOSCO.ROLES VALUES (DEFAULT,'Vendedor','Usuario vendedor independiente o de una empresa. Acceso solo a su información personal y los datos de los productos que vende. (Incluye funciones del rol Cliente).','',CURRENT_TIMESTAMP,NULL,NULL);
INSERT INTO KIOSCO.ROLES VALUES (DEFAULT,'Empleado','Usuario que tiene acceso para consultar y agregar datos en las cuentas de los clientes, pero no puede eliminar y/o actualizar las cuentas. (Incluye funciones de los roles Cliente y Vendedor).','',CURRENT_TIMESTAMP,NULL,NULL);