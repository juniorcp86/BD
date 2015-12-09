/*
* NOMBRE BASE DE DATOS: KIOSCO
* NOMBRE DE LA TABLA: CONTACTO_PROVEEDOR
* FECHA DE CREACIÓN: 03/11/2015
* CREADO POR: Junior Casique
* FECHA DE ACTUALIZACIÓN: 09/12/2015 
* ACTUALIZADO POR: Junior Casique
* DESCRIPCIÓN: Script para realizar la eliminación de los datos en la tabla mencionada. Es el rollback del script 07_INSERT_DATA_CONTACTO_PROVEEDOR.sql. Se actualizó por cambios en la estructura de la tabla.
*/

USE KIOSCO;

DELETE FROM KIOSCO.CONTACTO_PROVEEDOR WHERE USUARIOS_ID_USUARIO = '15' AND PROVEEDORES_ID_PROVEEDOR = '1';
