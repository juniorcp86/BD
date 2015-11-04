/*
* NOMBRE BASE DE DATOS: KIOSCO
* NOMBRE DE LA TABLA: PROVEEDORES
* FECHA DE CREACIÓN: 03/11/2015
* CREADO POR: Junior Casique
* FECHA DE ACTUALIZACIÓN: 
* ACTUALIZADO POR: 
* DESCRIPCIÓN: Script para realizar la creación de la tabla mencionada.
*/

USE KIOSCO;

CREATE TABLE IF NOT EXISTS KIOSCO.PROVEEDORES (
  ID_PROVEEDOR INT NOT NULL AUTO_INCREMENT,
  RIF VARCHAR(25) NOT NULL,
  NOMBRE_PROVEEDOR TEXT(500) NOT NULL,
  ID_TIPO_SERVICIO INT NOT NULL,
  ID_ESTADO INT NOT NULL,
  FECHA_CREACION DATE NOT NULL,
  FECHA_ACTUALIZACION DATE NULL,
  FECHA_ELIMINACION DATE NULL,
  PRIMARY KEY (ID_PROVEEDOR),
  UNIQUE INDEX RIF_UNIQUE (RIF ASC),
  INDEX fk_PROVEEDORES_ESTADOS1_idx (ID_ESTADO ASC),
  CONSTRAINT fk_PROVEEDORES_ESTADOS1
    FOREIGN KEY (ID_ESTADO)
    REFERENCES KIOSCO.ESTADOS (ID_ESTADO)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = INNODB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin
COMMENT = 'TABLA: PROVEEDORES\nContiene listado de las empresas y/o proveedores independientes que despachan productos en el Kiosco.\n\nID_PROVEEDOR: Es un valor autoincremental numérico, no debe ser NULL en ninguna ocasión, es único para identificar cada proveedor agregado en la aplicación y es la clave primaria.\nRIF: Dato alfanumérico que corresponde a información legal del proveedor, es obligatorio y único.\nNOMBRE_PROVEEDOR: Este valor corresponde al nombre de cada proveedor, son tipos de datos de texto y obligatorio.\nID_TIPO_SERVICIO: Valor relacionado con la tabla \"TIPO_SERVICIOS\", es un valor entero y obligatorio.\nID_ESTADO: Valor relacionado con la tabla \"ESTADOS\", es un valor entero y obligatorio.\nFECHA_CREACION: Valor que corresponde al registro de la información en base de datos, es obligatorio, pero no debe ser actualizado en ninguna otra ocasión.\nFECHA_ACTUALIZACION: Valor que corresponde a cada ocasión que se realiza alguna actualización en la información de los proveedores, excepto cuando se elimina el proveedor, es un valor opcional cuando se crea el proveedor.\nFECHA_ELIMINACION: Valor que corresponde a la fecha en la que se realizó la eliminación lógica del proveedor, es un valor que solo se actualiza una vez, no es obligatorio al crear el proveedor.\n\nReglas PROVEEDORES:\n- Los usuarios con rol \"Vendedor\" tiene como opción pertenecer a una o más empresas.\n- Los usuarios con rol \"Vendedor\" tiene como opción no pertenecer a ninguna empresa.\n- Los proveedores no son exclusivos de un producto específico.\n- El dato \"ID_ESTADO\" depende de la tabla \"ESTADOS\".';
