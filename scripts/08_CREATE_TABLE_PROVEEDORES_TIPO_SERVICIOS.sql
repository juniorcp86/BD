/*
* NOMBRE BASE DE DATOS: KIOSCO
* NOMBRE DE LA TABLA: PROVEEDORES_TIPO_SERVICIOS
* FECHA DE CREACIÓN: DD/MM/AAAA
* CREADO POR: Junior Casique
* FECHA DE ACTUALIZACIÓN: 
* ACTUALIZADO POR: 
* DESCRIPCIÓN: Script para realizar la creación de la tabla mencionada.
*/

CREATE TABLE IF NOT EXISTS KIOSCO.PROVEEDORES_TIPO_SERVICIOS (
  PROVEEDORES_ID_PROVEEDOR INT NOT NULL,
  TIPO_SERVICIOS_ID_TIPO_SERVICIO INT NOT NULL,
  PRIMARY KEY (PROVEEDORES_ID_PROVEEDOR, TIPO_SERVICIOS_ID_TIPO_SERVICIO),
  INDEX fk_PROVEEDORES_has_TIPO_SERVICIOS_TIPO_SERVICIOS1_idx (TIPO_SERVICIOS_ID_TIPO_SERVICIO ASC),
  INDEX fk_PROVEEDORES_has_TIPO_SERVICIOS_PROVEEDORES1_idx (PROVEEDORES_ID_PROVEEDOR ASC),
  CONSTRAINT fk_PROVEEDORES_has_TIPO_SERVICIOS_PROVEEDORES1
    FOREIGN KEY (PROVEEDORES_ID_PROVEEDOR)
    REFERENCES KIOSCO.PROVEEDORES (ID_PROVEEDOR)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_PROVEEDORES_has_TIPO_SERVICIOS_TIPO_SERVICIOS1
    FOREIGN KEY (TIPO_SERVICIOS_ID_TIPO_SERVICIO)
    REFERENCES KIOSCO.TIPO_SERVICIOS (ID_TIPO_SERVICIO)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin
COMMENT = 'TABLA: PROVEEDORES_TIPO_SERVICIOS\nTabla relacional que permite cumplir con las reglas de negocio de los tipos de servicios.\n\nPROVEEDORES_ID_PROVEEDOR: Valor relacionado con la tabla "PROVEEDORES", es un valor entero y obligatorio.\nTIPO_SERVICIOS_ID_TIPO_SERVICIO: Valor relacionado con la tabla "TIPO_SERVICIOS", es un valor entero y obligatorio.\n\nReglas PROVEEDORES_TIPO_SERVICIOS:\n- Un proveedor puede suministrar más de un tipo de servicio.\n- El mismo tipo de servicio lo puede ofrecer más de un proveedor.';