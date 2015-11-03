/*
* NOMBRE BASE DE DATOS: KIOSCO
* NOMBRE DE LA TABLA: ESTADOS
* FECHA DE CREACIÓN: 03/11/2015
* CREADO POR: Junior Casique
* FECHA DE ACTUALIZACIÓN: 
* ACTUALIZADO POR: 
* DESCRIPCIÓN: Script para realizar la inserción de datos en la tabla mencionada.
*/

USE 'KIOSCO';

INSERT INTO KIOSCO.ESTADOS VALUES (DEFAULT,'Activo','Estado para todos los elementos que tiene todas las opciones disponibles en el sistema y puede ser utilizado por todas las entidades que tengan asignado un estado.',CURRENT_DATE(),NULL,NULL);
INSERT INTO KIOSCO.ESTADOS VALUES (DEFAULT,'Bloqueado','Estado para todos los elementos que NO tienen permitido ingresar al sistema, han sido descartados para su uso por alguna falta o discrepancia en los datos. Estos elementos no pueden ser usados por ninguna entidad del sistema.',CURRENT_DATE(),NULL,NULL);
INSERT INTO KIOSCO.ESTADOS VALUES (DEFAULT,'Inactivo','Estado para todos los elementos que han sido deshabilitados del sistema, las condiciones varían dependiendo de la entidad que tenga el estado. Mientras se encuentren en este estado no pueden ser usados en el sistema, pero debe ser validado e informado a los usuarios.',CURRENT_DATE(),NULL,NULL);
INSERT INTO KIOSCO.ESTADOS VALUES (DEFAULT,'Eliminado','Estado para todos los elementos que han sido borrados lógicamente del sistema. Estos elementos no deben ser visualizado o utilizados en ninguna parte del sistema.',CURRENT_DATE(),NULL,NULL);
