/*
* NOMBRE BASE DE DATOS: KIOSCO
* NOMBRE DE LA TABLA: TIPO_SERVICIOS
* FECHA DE CREACIÓN: 03/11/2015
* CREADO POR: Junior Casique
* FECHA DE ACTUALIZACIÓN: 
* ACTUALIZADO POR: 
* DESCRIPCIÓN: Script para realizar la creación de la tabla mencionada.
*/

USE `KIOSCO`;

CREATE TABLE IF NOT EXISTS `KIOSCO`.`TIPO_SERVICIOS` (
  `ID_TIPO_SERVICIO` INT NOT NULL AUTO_INCREMENT,
  `NOMBRE_SERVICIO` TEXT(500) NOT NULL,
  `DESCRIPCION_SERVICIO` TEXT(500) NULL,
  `FECHA_CREACION` DATE NOT NULL,
  `FECHA_ACTUALIZACION` DATE NULL,
  `FECHA_ELIMINACION` DATE NULL,
  PRIMARY KEY (`ID_TIPO_SERVICIO`))
ENGINE = INNODB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin
COMMENT = 'TABLA: TIPO_SERVICIOS\nContiene información de los servicios utilizados por el Kiosco y suministrado por los proveedores. Por ejemplo revistas, tarjetas telefónicas, golosinas nacionales, barajitas, entre otros.\n\nID_TIPO_SERVICIO: Es un valor autoincremental numérico, no debe ser NULL en ninguna ocasión, es único para identificar cada tipo de servicio agregado en la aplicación y es la clave primaria.\nNOMBRE_SERVICIO: Este valor corresponde al nombre de cada tipo de servicio, son tipos de datos de texto y obligatorio.\nDESCRIPCION_SERVICIO: Este valor corresponde a la descripción y objetivo de cada tipo de servicio, son tipos de datos de texto y obligatorio.\nFECHA_CREACION: Valor que corresponde al registro de la información en base de datos, es obligatorio, pero no debe ser actualizado en ninguna otra ocasión.\nFECHA_ACTUALIZACION: Valor que corresponde a cada ocasión que se realiza alguna actualización en la información de los tipos de servicios, excepto cuando se elimina el servicio, es un valor opcional cuando se crea un nuevo tipo.\nFECHA_ELIMINACION: Valor que corresponde a la fecha en la que se realizó la eliminación lógica del tipo de servicio, es un valor que solo se actualiza una vez, no es obligatorio al crear el tipo de servicio.\n\nReglas TIPO_SERVICIOS:\n- Un proveedor puede suministrar más de un tipo de servicio.\n- El mismo tipo de servicio lo puede ofrecer más de un proveedor.';
