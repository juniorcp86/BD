/*
* NOMBRE BASE DE DATOS: KIOSCO
* NOMBRE DE LA TABLA: CONTACTO_PROVEEDOR
* FECHA DE CREACIÓN: DD/MM/AAAA
* CREADO POR: Junior Casique
* FECHA DE ACTUALIZACIÓN: 
* ACTUALIZADO POR: 
* DESCRIPCIÓN: Script para realizar la creación de la tabla mencionada.
*/

CREATE TABLE IF NOT EXISTS KIOSCO.CONTACTO_PROVEEDOR (
  ID_PROVEEDOR INT NOT NULL,
  ID_USUARIO INT NOT NULL,
  PERSONA_CONTACTO TEXT(500) NOT NULL,
  NUMERO_PROVEEDOR_1 INT NOT NULL,
  NUMERO_PROVEEDOR_2 INT NULL,
  NUMERO_PROVEEDOR_3 INT NULL,
  CORREO_ELECTRONICO_1 TEXT(500) NOT NULL,
  CORREO_ELECTRONICO_2 TEXT(500) NULL,
  CORREO_ELECTRONICO_3 TEXT(500) NULL,
  PRIMARY KEY (ID_PROVEEDOR, ID_USUARIO))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin
COMMENT = 'TABLA: CONTACTO_PROVEEDOR\nContiene información adicional de los proveedores como:\n- Números telefónicos.\n- Correos electrónicos.\n- Persona de contacto.\n\nID_PROVEEDOR: Valor relacionado con la tabla "PROVEEDORES", es un valor entero y obligatorio. Parte de la clave primaria.\nID_USUARIO: Valor relacionado con la tabla "USUARIOS", es un valor entero y obligatorio. Parte de la clave primaria. Corresponde al valor del usuario vendedor.\nPERSONA_CONTACTO: Nombre y apellido del supervisor del vendedor en la empresa, es un valor obligatorio con datos de texto\nNUMERO_PROVEEDOR_1: Número telefónico principal del proveedor o supervisor del vendedor, es un dato obligatorio y solo permite números.\nNUMERO_PROVEEDOR_2: Número telefónico adicional del proveedor o supervisor del vendedor, es un dato opcional y solo permite números.\nNUMERO_PROVEEDOR_3: Número telefónico adicional del proveedor o supervisor del vendedor, es un dato opcional y solo permite números.\nCORREO_ELECTRONICO_1: Correo electrónico principal del proveedor o supervisor del vendedor, es un dato obligatorio, no debe permitir caracteres especiales, a excepción del carácter "@" y dominio.\nCORREO_ELECTRONICO_2: Correo electrónico adicional del proveedor o supervisor del vendedor, es un dato opcional, no debe permitir caracteres especiales, a excepción del carácter "@" y dominio.\nCORREO_ELECTRONICO_3: Correo electrónico adicional del proveedor o supervisor del vendedor, es un dato opcional, no debe permitir caracteres especiales, a excepción del carácter "@" y dominio.\n\nReglas CONTACTO_PROVEEDOR:\n- El dato "ID_PROVEEDOR" depende de la tabla "PROVEEDORES".\n- El dato "ID_USUARIO" depende de la tabla "USUARIOS".\n- Persona de contacto siempre debe ser supervisor a excepción del caso donde el proveedor sea independiente, en cuyo caso aplica el mismo vendedor.\n- Es necesario al menos un número telefónico y correo electrónico como contacto en caso que el vendedor preste un mal servicio u otro inconveniente.';