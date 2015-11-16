/*
* NOMBRE BASE DE DATOS: KIOSCO
* NOMBRE DE LA TABLA: CUENTAS
* FECHA DE CREACIÓN: 13/11/2015
* CREADO POR: Junior Casique
* FECHA DE ACTUALIZACIÓN: 
* ACTUALIZADO POR: 
* DESCRIPCIÓN: Script para realizar la eliminación de los datos en la tabla mencionada. Es el rollback del script 20_INSERT_DATA_CUENTAS.sql
*/

USE KIOSCO;

DELETE FROM KIOSCO.CUENTAS WHERE ID_CUENTA = '1';
