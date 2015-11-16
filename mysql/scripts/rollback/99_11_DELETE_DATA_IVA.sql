/*
* NOMBRE BASE DE DATOS: KIOSCO
* NOMBRE DE LA TABLA: IVA
* FECHA DE CREACIÓN: 16/11/2015
* CREADO POR: Junior Casique
* FECHA DE ACTUALIZACIÓN: 
* ACTUALIZADO POR: 
* DESCRIPCIÓN: Script para realizar la eliminación de los datos en la tabla mencionada. Es el rollback del script 11_INSERT_DATA_IVA.sql
*/

USE KIOSCO;

DELETE FROM KIOSCO.IVA WHERE ID_IVA = '1';
