-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema KIOSCO
-- -----------------------------------------------------
-- BD: KIOSCO
-- Base de datos para administrar negocio del kiosco.
-- - Manejo de cuentas (deudas de clientes, empleados).
-- - Manejo de proveedores (vendedores, información bancaria).
-- - Manejo de inventario (listado de productos, precios de costo y de venta).
-- - Manejo de ingresos y egresos.
-- - Misceláneos (IVA, % de ganancia, cálculo para tarjetas).
-- 
-- Reglas Generales:
-- - Los campos de datos tipo "TEXT" deben tener como longitud máxima 500 caracteres.
-- - Los campos de datos tipo "VARCHAR" deben tener como longitud máxima 255 caracteres.
--  1. En el caso de correc electrónico el límite es 255 caracteres.
--  2. En el caso de números telefónicos el límite es 20 caracteres.
-- - Los campos que contengan datos tipo "DATE" debe tener información de fecha.
-- - El campo "FECHA_CREACION":
--  1. Siempre debe tener fecha de inserción en la base de datos "KIOSCO".
--  2. Siempre es obligatorio.
--  3. No debe ser actualizado bajo ninguna circunstancia.
-- - El campo "FECHA_ACTUALIZACION":
--  1. No deber tener información cuando se crea el registro.
--  2. No debe ser jamás igual o inferior al campo "FECHA_CREACION".
--  3. Debe ser actualizado en cada ocasión que el registro sea modificado.
--  4. No debe ser jamás un valor superior al campo "FECHA_ELIMINACION".
-- - El campo "FECHA_ELIMINACION":
--  1. No deber tener información cuando se crea el registro.
--  2. No debe ser jamás igual o inferior al campo "FECHA_CREACION".
--  3. No debe ser jamás un valor inferior al campo "FECHA_ACTUALIZACION".
-- - Si el campo "FECHA_ELIMINACION" tiene valor, ese dato no debe ser tomado en cuenta para ninguna lista que tenga valores usables en el sistema. A excepción de listas de datos que lo requieran explicítamente.

-- -----------------------------------------------------
-- Schema KIOSCO
--
-- BD: KIOSCO
-- Base de datos para administrar negocio del kiosco.
-- - Manejo de cuentas (deudas de clientes, empleados).
-- - Manejo de proveedores (vendedores, información bancaria).
-- - Manejo de inventario (listado de productos, precios de costo y de venta).
-- - Manejo de ingresos y egresos.
-- - Misceláneos (IVA, % de ganancia, cálculo para tarjetas).
-- 
-- Reglas Generales:
-- - Los campos de datos tipo "TEXT" deben tener como longitud máxima 500 caracteres.
-- - Los campos de datos tipo "VARCHAR" deben tener como longitud máxima 255 caracteres.
--  1. En el caso de correc electrónico el límite es 255 caracteres.
--  2. En el caso de números telefónicos el límite es 20 caracteres.
-- - Los campos que contengan datos tipo "DATE" debe tener información de fecha.
-- - El campo "FECHA_CREACION":
--  1. Siempre debe tener fecha de inserción en la base de datos "KIOSCO".
--  2. Siempre es obligatorio.
--  3. No debe ser actualizado bajo ninguna circunstancia.
-- - El campo "FECHA_ACTUALIZACION":
--  1. No deber tener información cuando se crea el registro.
--  2. No debe ser jamás igual o inferior al campo "FECHA_CREACION".
--  3. Debe ser actualizado en cada ocasión que el registro sea modificado.
--  4. No debe ser jamás un valor superior al campo "FECHA_ELIMINACION".
-- - El campo "FECHA_ELIMINACION":
--  1. No deber tener información cuando se crea el registro.
--  2. No debe ser jamás igual o inferior al campo "FECHA_CREACION".
--  3. No debe ser jamás un valor inferior al campo "FECHA_ACTUALIZACION".
-- - Si el campo "FECHA_ELIMINACION" tiene valor, ese dato no debe ser tomado en cuenta para ninguna lista que tenga valores usables en el sistema. A excepción de listas de datos que lo requieran explicítamente.
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `KIOSCO` DEFAULT CHARACTER SET utf8 ;
SHOW WARNINGS;
USE `KIOSCO` ;

-- -----------------------------------------------------
-- Table `KIOSCO`.`ESTADOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `KIOSCO`.`ESTADOS` (
  `ID_ESTADO` INT NOT NULL AUTO_INCREMENT,
  `NOMBRE_ESTADO` TEXT(500) NOT NULL,
  `DESCRIPCION_ESTADO` TEXT(500) NOT NULL,
  `FECHA_CREACION` DATE NOT NULL,
  `FECHA_ACTUALIZACION` DATE NULL DEFAULT NULL,
  `FECHA_ELIMINACION` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`ID_ESTADO`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'TABLA: ESTADOS\nContiene el listado de los estados para todos' /* comment truncated */ /*los elementos del sistema. Pueden aplicar para los usuarios, proveedores, productos, entre otros.
Los estados son:
- Activo: Estado para todos los elementos que tiene todas las opciones disponibles en el sistema y puede ser utilizado por todas las entidades que tengan asignado un estado.
- Bloqueado: Estado para todos los elementos que NO tienen permitido ingresar al sistema, han sido descartados para su uso por alguna falta o discrepancia en los datos. Estos elementos no pueden ser usados por ninguna entidad del sistema.
- Inactivo: Estado para todos los elementos que han sido deshabilitados del sistema, las condiciones varían dependiendo de la entidad que tenga el estado. Mientras se encuentren en este estado no pueden ser usados en el sistema, pero debe ser validado e informado a los usuarios.
- Eliminado: Estado para todos los elementos que han sido borrados lógicamente del sistema. Estos elementos no deben ser visualizado o utilizados en ninguna parte del sistema.

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

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `KIOSCO`.`ROLES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `KIOSCO`.`ROLES` (
  `ID_ROL` INT NOT NULL AUTO_INCREMENT,
  `NOMBRE_ROL` TEXT(500) NOT NULL,
  `DESCRIPCION` TEXT(500) NOT NULL,
  `ESTADO` TINYINT(1) NOT NULL,
  `FECHA_CREACION` DATE NOT NULL,
  `FECHA_ACTUALIZACION` DATE NULL DEFAULT NULL,
  `FECHA_ELIMINACION` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`ID_ROL`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'TABLA: ROLES\nContiene el listado de roles de usuarios soport' /* comment truncated */ /*do por el modelo de negocios. Cada uno de ellos incluye a su predecesor.
Corresponden a:
- Administrador: Súper usuario del sistema, no tiene límites para crear, actualizar, consultar y eliminar lógicamente información. Es el único con privilegios para mover de estados a los usuarios y vendedores. (Incluye funciones de los roles Cliente, Vendedor y Empleado).
- Cliente: Usuario que solo debe tener cuentas por pagar o montos a su favor. Acceso solo a su información. (No incluye funciones de otros roles).
- Vendedor: Usuario vendedor independiente o de una empresa. Acceso solo a su información personal y los datos de los productos que vende. (Incluye funciones del rol Cliente).
- Empleado: Usuario que tiene acceso para consultar y agregar datos en las cuentas de los clientes, pero no puede eliminar y/o actualizar las cuentas. (Incluye funciones de los roles Cliente y Vendedor).

ID_ROL: Es un valor autoincremental numérico, no debe ser NULL en ninguna ocasión, es único para identificar cada rol agregado en la aplicación y es la clave primaria.
NOMBRE_ROL: Este valor corresponde al nombre de cada rol y que fueron descritos en la lista anterior, son tipos de datos de texto y obligatorio.
DESCRIPCION: Este valor corresponde a la descripción y objetivo de cada rol, fueron descritos en la lista anterior, son tipos de datos de texto y obligatorio.
ESTADO: Corresponde a un valor booleano que identifica si el estado del rol está activo o inactivo. No está relacionado con la tabla "ESTADOS".
FECHA_CREACION: Valor que corresponde al registro de la información en base de datos, es obligatorio, pero no debe ser actualizado en ninguna otra ocasión.
FECHA_ACTUALIZACION: Valor que corresponde a cada ocasión que se realiza alguna actualización en la información del rol, excepto cuando se elimina el rol, es un valor opcional cuando se crea el rol.
FECHA_ELIMINACION: Valor que corresponde a la fecha en la que se realizó la eliminación lógica del rol, es un valor que solo se actualiza una vez, no es obligatorio al crear el rol.

Reglas ROLES:
- Los roles son únicos y tienen funciones específicas.
- Si se tiene un rol con mayor funcionalidad, eventualmente se heredan las anteriores.
- Los estados con valor 1 corresponden a Activos.
- Los estados con valor 0 corresponden a Inactivos.*/;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `KIOSCO`.`USUARIOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `KIOSCO`.`USUARIOS` (
  `ID_USUARIO` INT NOT NULL AUTO_INCREMENT,
  `DOCUMENTO_IDENTIDAD` INT NOT NULL,
  `TIPO_DOCUMENTO_IDENTIDAD` TINYINT(1) NOT NULL,
  `NOMBRE_APELLIDO_USUARIO` LONGTEXT NOT NULL,
  `CORREO_ELECTRONICO` VARCHAR(255) NOT NULL,
  `NUMERO_CONTACTO` VARCHAR(20) NOT NULL,
  `SEXO` TINYINT(1) NOT NULL,
  `ID_ESTADO` INT NOT NULL,
  `ID_ROL` INT NOT NULL,
  `ULTIMA_SESION` DATE NULL DEFAULT NULL,
  `FECHA_CREACION` DATE NOT NULL,
  `FECHA_ACTUALIZACION` DATE NULL DEFAULT NULL,
  `FECHA_ELIMINACION` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`ID_USUARIO`),
  UNIQUE INDEX `CEDULA_IDENTIDAD_UNIQUE` (`DOCUMENTO_IDENTIDAD` ASC),
  INDEX `fk_USUARIOS_ESTADOS_idx` (`ID_ESTADO` ASC),
  INDEX `fk_USUARIOS_ROLES1_idx` (`ID_ROL` ASC),
  UNIQUE INDEX `CORREO_ELECTRONICO_UNIQUE` (`CORREO_ELECTRONICO` ASC),
  CONSTRAINT `fk_USUARIOS_ESTADOS`
    FOREIGN KEY (`ID_ESTADO`)
    REFERENCES `KIOSCO`.`ESTADOS` (`ID_ESTADO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_USUARIOS_ROLES1`
    FOREIGN KEY (`ID_ROL`)
    REFERENCES `KIOSCO`.`ROLES` (`ID_ROL`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'TABLA: USUARIOS\nContiene información de todos los usuarios ' /* comment truncated */ /*egistrados en el sistema. Listado completo de los usuarios, se encuentran clientes, vendedores, empleados y administradores. La información registrada es vital para obtener los datos en caso de utilizar facturación.

ID_USUARIO: Es un valor autoincremental numérico, no debe ser NULL en ninguna ocasión, es único para identificar a cada usuario y es la clave primaria.
DOCUMENTO_IDENTIDAD: Corresponde al número de cédula de cada usuario, debe ser ser un valor númerico y único de cada usuario, es obligatorio y tiene como longitud máxima 9 caracteres.
TIPO_DOCUMENTO_IDENTIDAD: Identifica si el usuario es nacional o extranjero, es un valor booleano y obligatorio.
NOMBRE_APELLIDO_USUARIO: Corresponde a los nombres y apellidos de cada usuario, contiene información de texto, no debe permitir caracteres especiales a excepción de acentos y diéresis, debe ser almacenados como Camel Case, es un dato obligatorio.
CORREO_ELECTRONICO: Corresponde a la dirección de correo electrónico del usuario, debe ser un dato único y obligatorio, no debe permitir caracteres especiales, a excepción del caracter "@" y dominio.
NUMERO_CONTACTO: Corresponde al número teléfonico principal del usuario, debe permitir agregar teléfono celular o local, no debe permitir caracteres especiales ni letras, longitud áxima de 12 caracteres, es un dato obligatorio y no es un valor único.
SEXO: Identifica si el usuario es masculino o femenino, es un valor booleano y obligatorio.
ID_ESTADO: Valor relacionado con la tabla "ESTADOS", es un valor entero y obligatorio.
ID_ROL: Valor relacionado con la tabla "ROLES", es un valor entero y obligatorio.
ULTIMA_SESION: Es un valor de tipo fecha que debe contener la ocasión más reciente en la que se inició la sesión en el sistema, debe actualizarse en cada ocasión.
FECHA_CREACION: Valor que corresponde al registro de la información en base de datos, es obligatorio, pero no debe ser actualizado en ninguna otra ocasión.
FECHA_ACTUALIZACION: Valor que corresponde a cada ocasión que se realiza alguna actualización en la información del usuario, excepto cuando se elimina el usuario, es un valor opcional cuando se crea el usuario.
FECHA_ELIMINACION: Valor que corresponde a la fecha en la que se realizó la eliminación lógica del usuario, es un valor que solo se actualiza una vez, no es obligatorio al crear el usuario.

Reglas USUARIOS:
- El dato "TIPO_DOCUMENTO_IDENTIDAD" tiene valor "1" para usuarios nacionales y valor "0" para usuarios extranjeros.
- El dato "SEXO" tiene valor "1" para usuarios masculinos y valor "0" para usuarios femeninos.
- El dato "ID_ESTADO" depende de la tabla "ESTADOS".
- El dato "ID_ROL" depende de la tabla "ROLES".
- Cada usuario solo debe tener un "ID_ROL" de acuerdo a las reglas de negocio de la tabla "ROLES".
- El dato "ULTIMA_SESION" no necesariamente debe tener información desde el registro del usuario, pero si debe actualizarse en cada ocasión que inicie exitosamente la sesión.*/;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `KIOSCO`.`PROVEEDORES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `KIOSCO`.`PROVEEDORES` (
  `ID_PROVEEDOR` INT NOT NULL AUTO_INCREMENT,
  `RIF` VARCHAR(25) NOT NULL,
  `NOMBRE_PROVEEDOR` TEXT(500) NOT NULL,
  `ID_ESTADO` INT NOT NULL,
  `FECHA_CREACION` DATE NOT NULL,
  `FECHA_ACTUALIZACION` DATE NULL DEFAULT NULL,
  `FECHA_ELIMINACION` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`ID_PROVEEDOR`),
  UNIQUE INDEX `RIF_UNIQUE` (`RIF` ASC),
  INDEX `fk_PROVEEDORES_ESTADOS1_idx` (`ID_ESTADO` ASC),
  CONSTRAINT `fk_PROVEEDORES_ESTADOS1`
    FOREIGN KEY (`ID_ESTADO`)
    REFERENCES `KIOSCO`.`ESTADOS` (`ID_ESTADO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'TABLA: PROVEEDORES\nContiene listado de las empresas y/o prov' /* comment truncated */ /*edores independientes que despachan productos en el Kiosco.

ID_PROVEEDOR: Es un valor autoincremental numérico, no debe ser NULL en ninguna ocasión, es único para identificar cada proveedor agregado en la aplicación y es la clave primaria.
RIF: Dato alfanumérico que corresponde a información legal del proveedor, es obligatorio y único.
NOMBRE_PROVEEDOR: Este valor corresponde al nombre de cada proveedor, son tipos de datos de texto y obligatorio.
ID_TIPO_SERVICIO: Valor relacionado con la tabla "TIPO_SERVICIOS", es un valor entero y obligatorio.
ID_ESTADO: Valor relacionado con la tabla "ESTADOS", es un valor entero y obligatorio.
FECHA_CREACION: Valor que corresponde al registro de la información en base de datos, es obligatorio, pero no debe ser actualizado en ninguna otra ocasión.
FECHA_ACTUALIZACION: Valor que corresponde a cada ocasión que se realiza alguna actualización en la información de los proveedores, excepto cuando se elimina el proveedor, es un valor opcional cuando se crea el proveedor.
FECHA_ELIMINACION: Valor que corresponde a la fecha en la que se realizó la eliminación lógica del proveedor, es un valor que solo se actualiza una vez, no es obligatorio al crear el proveedor.

Reglas PROVEEDORES:
- Los usuarios con rol "Vendedor" tiene como opción pertenecer a una o más empresas.
- Los usuarios con rol "Vendedor" tiene como opción no pertenecer a ninguna empresa.
- Los proveedores no son exclusivos de un producto específico.
- El dato "ID_ESTADO" depende de la tabla "ESTADOS".*/;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `KIOSCO`.`TIPO_SERVICIOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `KIOSCO`.`TIPO_SERVICIOS` (
  `ID_TIPO_SERVICIO` INT NOT NULL AUTO_INCREMENT,
  `NOMBRE_SERVICIO` TEXT(500) NOT NULL,
  `DESCRIPCION_SERVICIO` TEXT(500) NULL DEFAULT NULL,
  `FECHA_CREACION` DATE NOT NULL,
  `FECHA_ACTUALIZACION` DATE NULL DEFAULT NULL,
  `FECHA_ELIMINACION` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`ID_TIPO_SERVICIO`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'TABLA: TIPO_SERVICIOS\nContiene información de los servicios' /* comment truncated */ /*utilizados por el Kiosco y suministrado por los proveedores. Por ejemplo revistas, tarjetas telefónicas, golosinas nacionales, barajitas, entre otros.

ID_TIPO_SERVICIO: Es un valor autoincremental numérico, no debe ser NULL en ninguna ocasión, es único para identificar cada tipo de servicio agregado en la aplicación y es la clave primaria.
NOMBRE_SERVICIO: Este valor corresponde al nombre de cada tipo de servicio, son tipos de datos de texto y obligatorio.
DESCRIPCION_SERVICIO: Este valor corresponde a la descripción y objetivo de cada tipo de servicio, son tipos de datos de texto y obligatorio.
FECHA_CREACION: Valor que corresponde al registro de la información en base de datos, es obligatorio, pero no debe ser actualizado en ninguna otra ocasión.
FECHA_ACTUALIZACION: Valor que corresponde a cada ocasión que se realiza alguna actualización en la información de los tipos de servicios, excepto cuando se elimina el servicio, es un valor opcional cuando se crea un nuevo tipo.
FECHA_ELIMINACION: Valor que corresponde a la fecha en la que se realizó la eliminación lógica del tipo de servicio, es un valor que solo se actualiza una vez, no es obligatorio al crear el tipo de servicio.

Reglas TIPO_SERVICIOS:
- Un proveedor puede suministrar más de un tipo de servicio.
- El mismo tipo de servicio lo puede ofrecer más de un proveedor.*/;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `KIOSCO`.`CUENTAS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `KIOSCO`.`CUENTAS` (
  `ID_CUENTA` INT NOT NULL AUTO_INCREMENT,
  `ID_USUARIO` INT NOT NULL,
  `TOTAL_CUENTA` DOUBLE NOT NULL,
  `ID_ESTADO` TINYINT(1) NOT NULL DEFAULT 1,
  `FECHA_CREACION` DATE NOT NULL,
  `FECHA_ACTUALIZACION` DATE NULL DEFAULT NULL,
  `FECHA_CIERRE` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`ID_CUENTA`, `ID_USUARIO`),
  INDEX `fk_CUENTAS_USUARIOS1_idx` (`ID_USUARIO` ASC),
  CONSTRAINT `fk_CUENTAS_USUARIOS1`
    FOREIGN KEY (`ID_USUARIO`)
    REFERENCES `KIOSCO`.`USUARIOS` (`ID_USUARIO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = armscii8
COMMENT = 'TABLA: CUENTAS\nTabla que contiene total de la cuenta de cada' /* comment truncated */ /*usuario cliente. Debe estar relacionada con la tabla CUENTAS_DETALLE.

ID_CUENTA: Es un valor autoincremental numérico, no debe ser NULL en ninguna ocasión, es único para identificar cada cuenta de clientes y es la clave primaria.
ID_USUARIO: Valor relacionado con la tabla "USUARIOS", es un valor entero y obligatorio.
TOTAL_CUENTA: Corresponde a la suma de todos los detalles de cuenta de un solo cliente que no esten pagados.
ID_ESTADO: Valor relacionado con la tabla "ESTADOS", es un valor entero y obligatorio.
FECHA_CREACION: Valor que corresponde al registro de la información en base de datos, es obligatorio, pero no debe ser actualizado en ninguna otra ocasión.
FECHA_ACTUALIZACION: Valor que corresponde a cada ocasión que se realiza alguna actualización en la información del detalle de las cuentas, es un valor opcional cuando se crea una nueva cuenta.
FECHA_CIERRE: Valor que corresponde a la fecha en la que se pagó por completo y se puede cerrar la deuda.

Reglas CUENTAS:
- Un cliente no debe tener más de una cuenta abierta al mismo tiempo.
- Los estados de las cuentas solo pueden ser activos con valor 1 e inactivos con valor 0.*/;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `KIOSCO`.`PRODUCTOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `KIOSCO`.`PRODUCTOS` (
  `ID_PRODUCTO` INT NOT NULL AUTO_INCREMENT,
  `NOMBRE_PRODUCTO` TEXT(500) NOT NULL,
  `DESCRIPCION_PRODUCTO` TEXT(500) NULL DEFAULT NULL,
  `ID_ESTADO` TINYINT(1) NOT NULL DEFAULT 1,
  `FECHA_CREACION` DATE NOT NULL,
  `FECHA_ACTUALIZACION` DATE NULL DEFAULT NULL,
  `FECHA_ELIMINACION` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`ID_PRODUCTO`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'TABLA: PRODUCTOS\nTabla que el listado de productos de KIOSCO' /* comment truncated */ /*

ID_PRODUCTO: Es un valor autoincremental numérico, no debe ser NULL en ninguna ocasión, es único para identificar cada producto y es la clave primaria.
NOMBRE_PRODUCTO: Identifica el tipo de detalle para sumar o restar montos, es un valor booleano y obligatorio.
DESCRIPCION_PRODUCTO: Valor tipo texto que permite ingresar información adicional del producto, NO es un valor obligatorio.
ID_ESTADO: Valor que indica el estado de un producto, es un valor booleano y es obligatorio.
FECHA_CREACION: Valor que corresponde al registro de la información en base de datos, es obligatorio, pero no debe ser actualizado en ninguna otra ocasión.
FECHA_ACTUALIZACION: Valor que corresponde a cada ocasión que se realiza alguna actualización en la información de cada producto.
FECHA_ELIMINACION: Valor que corresponde a la fecha en la que se realizó la eliminación lógica del producto, es un valor que solo se actualiza una vez, no es obligatorio al crear el producto.

Reglas :
- El mismo proudcto puede ser distribuido por más de un proveedor.
- Muchos productos son distribuidos por muchos vendedores.
- Los estados de los productos solo pueden ser activos con valor 1 e inactivos con valor 0.*/;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `KIOSCO`.`CUENTA_DETALLES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `KIOSCO`.`CUENTA_DETALLES` (
  `ID_CUENTA_DETALLE` INT NOT NULL AUTO_INCREMENT,
  `ID_CUENTA` INT NOT NULL,
  `ID_USUARIO` INT NOT NULL,
  `ID_PRODUCTO` INT NOT NULL,
  `TIPO_DETALLE` TINYINT(1) NOT NULL,
  `DESCRIPCION` TEXT(500) NULL DEFAULT NULL,
  `MONTO_DETALLE` DOUBLE NOT NULL,
  `FECHA_CREACION` DATE NOT NULL,
  `FECHA_ACTUALIZACION` DATE NULL DEFAULT NULL,
  `FECHA_CIERRE` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`ID_CUENTA_DETALLE`, `ID_CUENTA`, `ID_USUARIO`, `ID_PRODUCTO`),
  INDEX `fk_CUENTA_DETALLES_CUENTAS1_idx` (`ID_CUENTA` ASC, `ID_USUARIO` ASC),
  INDEX `fk_CUENTA_DETALLES_PRODUCTOS1_idx` (`ID_PRODUCTO` ASC),
  CONSTRAINT `fk_CUENTA_DETALLES_CUENTAS1`
    FOREIGN KEY (`ID_CUENTA` , `ID_USUARIO`)
    REFERENCES `KIOSCO`.`CUENTAS` (`ID_CUENTA` , `ID_USUARIO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CUENTA_DETALLES_PRODUCTOS1`
    FOREIGN KEY (`ID_PRODUCTO`)
    REFERENCES `KIOSCO`.`PRODUCTOS` (`ID_PRODUCTO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'TABLA: CUENTA_DETALLES\nTabla que los valores unitarios que c' /* comment truncated */ /*nstituyen el total de la cuenta.

ID_CUENTA_DETALLE: Es un valor autoincremental numérico, no debe ser NULL en ninguna ocasión, es único para identificar cada detalle de cuenta y es la clave primaria.
ID_CUENTA: Valor relacionado con la tabla "CUENTA", es un valor entero y obligatorio.
ID_USUARIO: Valor relacionado con la tabla "CUENTA", es un valor entero y obligatorio.
ID_PRODUCTO: Valor relacionado con la tabla "PRODUCTOS", es un valor entero y obligatorio.
TIPO_DETALLE: Identifica el tipo de detalle para sumar o restar montos, es un valor booleano y obligatorio.
DESCRIPCION: Utilizado para almacenar información general cuando el producto seleccionado sea algo genérico y no se específiquen individualmente los productos, NO es obligatorio.
MONTO_DETALLE: Valor decimal que contiene el costo del producto o abono en la cuenta, es un valor obligatorio.
FECHA_CREACION: Valor que corresponde al registro de la información en base de datos, es obligatorio, pero no debe ser actualizado en ninguna otra ocasión.
FECHA_ACTUALIZACION: Valor que corresponde a cada ocasión que se realiza alguna actualización en la información del detalle de las cuentas.
FECHA_CIERRE: Valor que corresponde a la fecha en la que se pagó por completo y se puede cerrar la deuda.

Reglas :
- En valor "TIPO_DETALLE" corresponde 1 cuando se agrega algún producto y 0 cuando se hace un abono.*/;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `KIOSCO`.`PROVEEDORES_PRODUCTOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `KIOSCO`.`PROVEEDORES_PRODUCTOS` (
  `PROVEEDORES_ID_PROVEEDOR` INT NOT NULL,
  `PRODUCTOS_ID_PRODUCTO` INT NOT NULL,
  PRIMARY KEY (`PROVEEDORES_ID_PROVEEDOR`, `PRODUCTOS_ID_PRODUCTO`),
  INDEX `fk_PROVEEDORES_has_PRODUCTOS_PRODUCTOS1_idx` (`PRODUCTOS_ID_PRODUCTO` ASC),
  INDEX `fk_PROVEEDORES_has_PRODUCTOS_PROVEEDORES1_idx` (`PROVEEDORES_ID_PROVEEDOR` ASC),
  CONSTRAINT `fk_PROVEEDORES_has_PRODUCTOS_PROVEEDORES1`
    FOREIGN KEY (`PROVEEDORES_ID_PROVEEDOR`)
    REFERENCES `KIOSCO`.`PROVEEDORES` (`ID_PROVEEDOR`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PROVEEDORES_has_PRODUCTOS_PRODUCTOS1`
    FOREIGN KEY (`PRODUCTOS_ID_PRODUCTO`)
    REFERENCES `KIOSCO`.`PRODUCTOS` (`ID_PRODUCTO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'TABLA: PROVEEDORES_PRODUCTOS\nTabla que almacena las relacion' /* comment truncated */ /*s de los productos con los proveedores.

PROVEEDORES_ID_PROVEEDOR: Valor relacionado con la tabla "PROVEEDORES", es un valor entero y obligatorio.
PRODUCTOS_ID_PRODUCTO: Valor relacionado con la tabla "PRODUCTOS", es un valor entero y obligatorio.

Reglas :
- El mismo proudcto puede ser distribuido por más de un proveedor.
- Muchos productos son distribuidos por muchos vendedores.*/;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `KIOSCO`.`IVA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `KIOSCO`.`IVA` (
  `ID_IVA` INT NOT NULL AUTO_INCREMENT,
  `PORCENTAJE_IVA` DOUBLE NOT NULL,
  `ID_ESTADO` TINYINT(1) NOT NULL DEFAULT 1,
  `FECHA_CREACION` DATE NOT NULL,
  `FECHA_ACTUALIZACION` DATE NULL DEFAULT NULL,
  `FECHA_ELIMINACION` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`ID_IVA`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'TABLA: IVA\nTabla que almacena los IVAs antiguos y actual par' /* comment truncated */ /* realizar calculo de los precios.

ID_IVA: Es un valor autoincremental numérico, no debe ser NULL en ninguna ocasión, es único para identificar cada producto y es la clave primaria.
PORCENTAJE_IVA: Corresponde al porcentaje del impuesto al valor agregado vigente para la venta de los productos, es un valor obligatorio.
ID_ESTADO: Valor que indica el estado de IVA, es un valor booleano y es obligatorio.
FECHA_CREACION: Valor que corresponde al registro de la información en base de datos, es obligatorio, pero no debe ser actualizado en ninguna otra ocasión.
FECHA_ACTUALIZACION: Valor que corresponde a cada ocasión que se realiza alguna actualización en la información de cada IVA.
FECHA_ELIMINACION: Valor que corresponde a la fecha en la que se realizó la eliminación lógica del IVA, es un valor que solo se actualiza una vez, no es obligatorio al registrar IVA.

Reglas IVA:
- Solo debe mantenerse un registro de IVA activo en la tabla.
- Los estados de las tasas de IVA solo pueden ser activos con valor 1 e inactivos con valor 0.*/;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `KIOSCO`.`COSTO_PRODUCTOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `KIOSCO`.`COSTO_PRODUCTOS` (
  `ID_COSTO` INT NOT NULL AUTO_INCREMENT,
  `ID_PRODUCTO` INT NOT NULL,
  `ID_IVA` INT NOT NULL,
  `COSTO_SIN_IVA` DOUBLE NOT NULL,
  `COSTO_CON_IVA` DOUBLE NOT NULL,
  `ID_ESTADO` TINYINT(1) NOT NULL DEFAULT 1,
  `FECHA_CREACION` DATE NOT NULL,
  `FECHA_ELIMINACION` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`ID_COSTO`, `ID_PRODUCTO`, `ID_IVA`),
  INDEX `fk_COSTO_PRODUCTOS_IVA1_idx` (`ID_IVA` ASC),
  INDEX `fk_COSTO_PRODUCTOS_PRODUCTOS1_idx` (`ID_PRODUCTO` ASC),
  CONSTRAINT `fk_COSTO_PRODUCTOS_IVA1`
    FOREIGN KEY (`ID_IVA`)
    REFERENCES `KIOSCO`.`IVA` (`ID_IVA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_COSTO_PRODUCTOS_PRODUCTOS1`
    FOREIGN KEY (`ID_PRODUCTO`)
    REFERENCES `KIOSCO`.`PRODUCTOS` (`ID_PRODUCTO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'TABLA: COSTO_PRODUCTOS\nTabla que almacena la información re' /* comment truncated */ /*acionada a los costos de los productos, debe mantener un registro histórico y se alimenta de las tablas "PRODUCTOS" e "IVA".

ID_COSTO: Es un valor autoincremental numérico, no debe ser NULL en ninguna ocasión, es único para identificar cada costo de producto y es la clave primaria.
ID_PRODUCTO: Valor relacionado con la tabla "PRODUCTOS", es un valor entero y obligatorio.
ID_IVA: Valor relacionado con la tabla "IVA", es un valor entero y obligatorio.
COSTO_SIN_IVA: Valor compuesto de enteros y decimales, que indica el costo del producto sin tomar en cuenta el valor del IVA, es un valor obligatorio.
COSTO_CON_IVA: Valor compuesto de enteros y decimales, que indica el costo del producto tomando en cuenta el valor del IVA, es un valor obligatorio.
ID_ESTADO: Valor que indica el estado de un producto, es un valor booleano y es obligatorio.
FECHA_CREACION: Valor que corresponde al registro de la información en base de datos, es obligatorio, pero no debe ser actualizado en ninguna otra ocasión.
FECHA_ELIMINACION: Valor que corresponde a la fecha en la que se realizó la eliminación lógica del costo, es un valor que solo se actualiza una vez, no es obligatorio al registrar COSTO_PRODUCTOS.

Reglas COSTO_PRODUCTOS:
- Cada producto solo puede tener un precio activo.
- No se debe eliminar ningún registro de los precios anteriores.
- Los estados de los productos solo pueden ser activos con valor 1 e inactivos con valor 0.*/;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `KIOSCO`.`PROVEEDORES_TIPOS_SERVICIOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `KIOSCO`.`PROVEEDORES_TIPOS_SERVICIOS` (
  `PROVEEDORES_ID_PROVEEDOR` INT NOT NULL,
  `TIPO_SERVICIOS_ID_TIPO_SERVICIO` INT NOT NULL,
  PRIMARY KEY (`PROVEEDORES_ID_PROVEEDOR`, `TIPO_SERVICIOS_ID_TIPO_SERVICIO`),
  INDEX `fk_TIPO_SERVICIOS_has_PROVEEDORES_PROVEEDORES1_idx` (`PROVEEDORES_ID_PROVEEDOR` ASC),
  INDEX `fk_TIPO_SERVICIOS_has_PROVEEDORES_TIPO_SERVICIOS1_idx` (`TIPO_SERVICIOS_ID_TIPO_SERVICIO` ASC),
  CONSTRAINT `fk_TIPO_SERVICIOS_has_PROVEEDORES_TIPO_SERVICIOS1`
    FOREIGN KEY (`TIPO_SERVICIOS_ID_TIPO_SERVICIO`)
    REFERENCES `KIOSCO`.`TIPO_SERVICIOS` (`ID_TIPO_SERVICIO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TIPO_SERVICIOS_has_PROVEEDORES_PROVEEDORES1`
    FOREIGN KEY (`PROVEEDORES_ID_PROVEEDOR`)
    REFERENCES `KIOSCO`.`PROVEEDORES` (`ID_PROVEEDOR`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'TABLA: PROVEEDORES_TIPO_SERVICIOS\nTabla relacional que permi' /* comment truncated */ /*e cumplir con las reglas de negocio de los tipos de servicios.
 
PROVEEDORES_ID_PROVEEDOR: Valor relacionado con la tabla "PROVEEDORES", es un valor entero y obligatorio.
TIPO_SERVICIOS_ID_TIPO_SERVICIO: Valor relacionado con la tabla "TIPO_SERVICIOS", es un valor entero y obligatorio.

Reglas PROVEEDORES_TIPO_SERVICIOS:
- Un proveedor puede suministrar más de un tipo de servicio.
- El mismo tipo de servicio lo puede ofrecer más de un proveedor.*/;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `KIOSCO`.`CONTACTO_PROVEEDOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `KIOSCO`.`CONTACTO_PROVEEDOR` (
  `USUARIOS_ID_USUARIO` INT NOT NULL,
  `PROVEEDORES_ID_PROVEEDOR` INT NOT NULL,
  `NUMERO_PROVEEDOR_1` VARCHAR(20) NOT NULL,
  `NUMERO_PROVEEDOR_2` VARCHAR(20) NULL DEFAULT NULL,
  `NUMERO_PROVEEDOR_3` VARCHAR(20) NULL DEFAULT NULL,
  `CORREO_ELECTRONICO_1` TEXT(500) NOT NULL,
  `CORREO_ELECTRONICO_2` TEXT(500) NULL DEFAULT NULL,
  `CORREO_ELECTRONICO_3` TEXT(500) NULL DEFAULT NULL,
  PRIMARY KEY (`USUARIOS_ID_USUARIO`, `PROVEEDORES_ID_PROVEEDOR`),
  INDEX `fk_USUARIOS_has_PROVEEDORES_PROVEEDORES1_idx` (`PROVEEDORES_ID_PROVEEDOR` ASC),
  INDEX `fk_USUARIOS_has_PROVEEDORES_USUARIOS1_idx` (`USUARIOS_ID_USUARIO` ASC),
  CONSTRAINT `fk_USUARIOS_has_PROVEEDORES_USUARIOS1`
    FOREIGN KEY (`USUARIOS_ID_USUARIO`)
    REFERENCES `KIOSCO`.`USUARIOS` (`ID_USUARIO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_USUARIOS_has_PROVEEDORES_PROVEEDORES1`
    FOREIGN KEY (`PROVEEDORES_ID_PROVEEDOR`)
    REFERENCES `KIOSCO`.`PROVEEDORES` (`ID_PROVEEDOR`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'TABLA: CONTACTO_PROVEEDOR\nContiene información adicional de' /* comment truncated */ /* los proveedores como:
- Números telefónicos.
- Correos electrónicos.
- Persona de contacto.
 
USUARIOS_ID_USUARIO: Valor relacionado con la tabla "USUARIOS", es un valor entero y obligatorio. Parte de la clave primaria.
PROVEEDORES_ID_PROVEEDOR: Valor relacionado con la tabla "PROVEEDORES", es un valor entero y obligatorio. Parte de la clave primaria.
PERSONA_CONTACTO: Nombre y apellido del supervisor del vendedor en la empresa, es un valor obligatorio con datos de texto
NUMERO_PROVEEDOR_1: Número telefónico principal del proveedor o supervisor del vendedor, es un dato obligatorio y solo permite números.
NUMERO_PROVEEDOR_2: Número telefónico adicional del proveedor o supervisor del vendedor, es un dato opcional y solo permite números.
NUMERO_PROVEEDOR_3: Número telefónico adicional del proveedor o supervisor del vendedor, es un dato opcional y solo permite números.
CORREO_ELECTRONICO_1: Correo electrónico principal del proveedor o supervisor del vendedor, es un dato obligatorio, no debe permitir caracteres especiales, a excepción del carácter "@" y dominio.
CORREO_ELECTRONICO_2: Correo electrónico adicional del proveedor o supervisor del vendedor, es un dato opcional, no debe permitir caracteres especiales, a excepción del carácter "@" y dominio.
CORREO_ELECTRONICO_3: Correo electrónico adicional del proveedor o supervisor del vendedor, es un dato opcional, no debe permitir caracteres especiales, a excepción del carácter "@" y dominio.
 
Reglas CONTACTO_PROVEEDOR:
- El dato "ID_PROVEEDOR" depende de la tabla "PROVEEDORES".
- Persona de contacto siempre debe ser supervisor a excepción del caso donde el proveedor sea independiente, en cuyo caso aplica el mismo vendedor.
- Es necesario al menos un número telefónico y correo electrónico como contacto en caso que el vendedor preste un mal servicio u otro inconveniente.*/;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `KIOSCO`.`INVENTARIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `KIOSCO`.`INVENTARIO` (
  `ID_INVENTARIO` INT NOT NULL AUTO_INCREMENT,
  `CAJA` VARCHAR(100) CHARACTER SET 'utf8' NOT NULL,
  `CANTIDAD_DISPONIBLE` INT NOT NULL,
  `UNIDAD_PRODUCTO` VARCHAR(45) CHARACTER SET 'utf8' NOT NULL,
  PRIMARY KEY (`ID_INVENTARIO`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'TABLA: INVENTARIO\nTabla que almacena la información relacio' /* comment truncated */ /*ada a la cantidad de productos en existencia del depósito.
 
ID_INVENTARIO: Es un valor autoincremental numérico, no debe ser NULL en ninguna ocasión, es único para identificar cada inventario y es la clave primaria.
CAJA: Valor numérico que identifica la(s) caja(s) en la(s) cual(es) se encuentra(n) almacenado(s) fisicamente el/los producto(s). 
CANTIDAD_DISPONIBLE: Valor numérico que representa el total de productos en inventario de cada producto. 
UNIDAD_PRODUCTO: Corresponde a la informacon que identifica si un producto esta almacenado por unidad, caja, peso, etc. 

Reglas INVENTARIO:
- El mismo producto puede estar almacenado más de una vez, pero con diferente unidad.*/;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `KIOSCO`.`INVENTARIO_PRODUCTOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `KIOSCO`.`INVENTARIO_PRODUCTOS` (
  `INVENTARIO_ID_INVENTARIO` INT NOT NULL,
  `PRODUCTOS_ID_PRODUCTO` INT NOT NULL,
  PRIMARY KEY (`INVENTARIO_ID_INVENTARIO`, `PRODUCTOS_ID_PRODUCTO`),
  INDEX `fk_INVENTARIO_has_PRODUCTOS_PRODUCTOS1_idx` (`PRODUCTOS_ID_PRODUCTO` ASC),
  INDEX `fk_INVENTARIO_has_PRODUCTOS_INVENTARIO1_idx` (`INVENTARIO_ID_INVENTARIO` ASC),
  CONSTRAINT `fk_INVENTARIO_has_PRODUCTOS_INVENTARIO1`
    FOREIGN KEY (`INVENTARIO_ID_INVENTARIO`)
    REFERENCES `KIOSCO`.`INVENTARIO` (`ID_INVENTARIO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_INVENTARIO_has_PRODUCTOS_PRODUCTOS1`
    FOREIGN KEY (`PRODUCTOS_ID_PRODUCTO`)
    REFERENCES `KIOSCO`.`PRODUCTOS` (`ID_PRODUCTO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'TABLA: INVENTARIO_PRODUCTOS\nTabla que almacena la informaci' /* comment truncated */ /*�n relacionada entre "PRODUCTOS" e "INVENTARIO".

INVENTARIO_ID_INVENTARIO: Es un valor autoincremental numérico, no debe ser NULL en ninguna ocasión, es único para identificar cada inventario y es la clave primaria.
PRODUCTOS_ID_PRODUCTO: Valor numérico que identifica la caja en la cual se encuentra almacenado fisicamente el producto. 

Reglas INVENTARIO_PRODUCTOS:
- Los mismos productos pueden estar en más de una caja.*/;

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
