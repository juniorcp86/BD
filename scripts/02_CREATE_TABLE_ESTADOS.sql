/*
* NOMBRE BASE DE DATOS: KIOSCO
* NOMBRE DE LA TABLA: ESTADOS
* FECHA DE CREACIÓN: 03/11/2015
* CREADO POR: Junior Casique
* FECHA DE ACTUALIZACIÓN: 
* ACTUALIZADO POR: 
* DESCRIPCIÓN: Script para realizar la creación de la tabla mencionada.
*/

USE `KIOSCO`;

CREATE TABLE IF NOT EXISTS `KIOSCO`.`ESTADOS` (
  `ID_ESTADO` INT NOT NULL AUTO_INCREMENT,
  `NOMBRE_ESTADO` TEXT(500) NOT NULL,
  `DESCRIPCION_ESTADO` TEXT(500) NOT NULL,
  `FECHA_CREACION` DATE NOT NULL,
  `FECHA_ACTUALIZACION` DATE NULL,
  `FECHA_ELIMINACION` DATE NULL,
  PRIMARY KEY (`ID_ESTADO`))
ENGINE = INNODB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin
COMMENT = 'TABLA: ESTADOS\nContiene el listado de los estados para todos los elementos del sistema. Pueden aplicar para los usuarios, proveedores, productos, entre otros.\nLos estados son:\n- Activo: Estado para todos los elementos que tiene todas las opciones disponibles en el sistema y puede ser utilizado por todas las entidades que tengan asignado un estado.\n- Bloqueado: Estado para todos los elementos que NO tienen permitido ingresar al sistema, han sido descartados para su uso por alguna falta o discrepancia en los datos. Estos elementos no pueden ser usados por ninguna entidad del sistema.\n- Inactivo: Estado para todos los elementos que han sido deshabilitados del sistema, las condiciones varían dependiendo de la entidad que tenga el estado. Mientras se encuentren en este estado no pueden ser usados en el sistema, pero debe ser validado e informado a los usuarios.\n- Eliminado: Estado para todos los elementos que han sido borrados lógicamente del sistema. Estos elementos no deben ser visualizado o utilizados en ninguna parte del sistema.' /* comment truncated */

/*
ID_ESTADO: Es un valor autoincremental numérico, no debe ser NULL en ninguna ocasión, es único para identificar cada estado agregado en la aplicación y es la clave primaria.
NOMBRE_ESTADO: Este valor corresponde al nombre de cada estado y que fueron descritos en la lista anterior, son tipos de datos de texto y obligatorio.
DESCRIPCION_ESTADO: Este valor corresponde a la descripción y objetivo de cada estado, fueron descritos en la lista anterior, son tipos de datos de texto y obligatorio.
FECHA_CREACION: Valor que corresponde al registro de la información en base de datos, es obligatorio, pero no debe ser actualizado en ninguna otra ocasión.
FECHA_ACTUALIZACION: Valor que corresponde a cada ocasión que se realiza alguna actualización en la información del estado, excepto cuando se elimina el estado, es un valor opcional cuando se crea el estado.
FECHA_ELIMINACION: Valor que corresponde a la fecha en la que se realizó la eliminación lógica del estado, es un valor que solo se actualiza una vez, no es obligatorio al crear el estado.

Reglas ESTADOS:
- Los estados se encuentran estandarizados para todos los usuarios (incluyendo los roles) y proveedores.
- El estado "Bloqueado" en el caso de los usuarios aplica cuando fallan el inicio de sesión en 3 oportunidades.
- El estado "Bloqueado" en el caso de los proveedores aplica cuando se tienen malas experiencias o se ha descartado una futura negociación.
- El estado "Inactivo" en el caso de los usuarios aplica cuando tienen más de un año sin iniciar sesión.
- El estado "Inactivo" en el caso de los proveedores aplica cuando no se ha realizado ningún pedido desde hace un año.*/;
