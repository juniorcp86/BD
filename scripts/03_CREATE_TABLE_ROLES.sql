/*
* NOMBRE BASE DE DATOS: KIOSCO
* NOMBRE DE LA TABLA: ROLES
* FECHA DE CREACIÓN: DD/MM/AAAA
* CREADO POR: Junior Casique
* FECHA DE ACTUALIZACIÓN: 
* ACTUALIZADO POR: 
* DESCRIPCIÓN: Script para realizar la creación de la tabla mencionada.
*/

CREATE TABLE IF NOT EXISTS KIOSCO.ROLES (
  ID_ROL INT NOT NULL AUTO_INCREMENT,
  NOMBRE_ROL TEXT(500) NOT NULL,
  DESCRIPCION TEXT(500) NOT NULL,
  ESTADO TINYINT(1) NOT NULL,
  FECHA_CREACION DATE NOT NULL,
  FECHA_ACTUALIZACION DATE NULL,
  FECHA_ELIMINACION DATE NULL,
  PRIMARY KEY (ID_ROL))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;
/*COMMENT = 'TABLA: ROLES\nContiene el listado de roles de usuarios soportado por el modelo de negocios. Cada uno de ellos incluye a su predecesor.\nCorresponden a:\n- Administrador: Súper usuario del sistema, no tiene límites para crear, actualizar, consultar y eliminar lógicamente información. Es el único con privilegios para mover de estados a los usuarios y vendedores. (Incluye funciones de los roles Cliente, Vendedor y Empleado).\n- Cliente: Usuario que solo debe tener cuentas por pagar o montos a su favor. Acceso solo a su información. (No incluye funciones de otros roles).\n- Vendedor: Usuario vendedor independiente o de una empresa. Acceso solo a su información personal y los datos de los productos que vende. (Incluye funciones del rol Cliente).\n- Empleado: Usuario que tiene acceso para consultar y agregar datos en las cuentas de los clientes, pero no puede eliminar y/o actualizar las cuentas. (Incluye funciones de los roles Cliente y Vendedor).\n\nID_ROL: Es un valor autoincremental numérico, no debe ser NULL en ninguna ocasión, es único para identificar cada rol agregado en la aplicación y es la clave primaria.\nNOMBRE_ROL: Este valor corresponde al nombre de cada rol y que fueron descritos en la lista anterior, son tipos de datos de texto y obligatorio.\nDESCRIPCION: Este valor corresponde a la descripción y objetivo de cada rol, fueron descritos en la lista anterior, son tipos de datos de texto y obligatorio.\nESTADO: Corresponde a un valor booleano que identifica si el estado del rol está activo o inactivo. No está relacionado con la tabla "ESTADOS".\nFECHA_CREACION: Valor que corresponde al registro de la información en base de datos, es obligatorio, pero no debe ser actualizado en ninguna otra ocasión.\nFECHA_ACTUALIZACION: Valor que corresponde a cada ocasión que se realiza alguna actualización en la información del rol, excepto cuando se elimina el rol, es un valor opcional cuando se crea el rol.\nFECHA_ELIMINACION: Valor que corresponde a la fecha en la que se realizó la eliminación lógica del rol, es un valor que solo se actualiza una vez, no es obligatorio al crear el rol.\n\nReglas ROLES:\n- Los roles son únicos y tienen funciones específicas.\n- Si se tiene un rol con mayor funcionalidad, eventualmente se heredan las anteriores.\n- Los estados con valor 1 corresponden a Activos.\n- Los estados con valor 0 corresponden a Inactivos.';*/