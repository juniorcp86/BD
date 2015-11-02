/*
* NOMBRE BASE DE DATOS: KIOSCO
* NOMBRE DE LA TABLA: 
* FECHA DE CREACIÓN: DD/MM/AAAA
* CREADO POR: Junior Casique
* FECHA DE ACTUALIZACIÓN: 
* ACTUALIZADO POR: 
* DESCRIPCIÓN: Script para realizar la creación de la base de datos KIOSCO.
*/

CREATE DATABASE IF NOT EXISTS KIOSCO
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;
/*COMMENT = 'BD: KIOSCO\nBase de datos para administrar negocio del kiosco.\n- Manejo de cuentas (deudas de clientes, empleados).\n- Manejo de proveedores (vendedores, información bancaria).\n- Manejo de inventario (listado de productos, precios de costo y de venta).\n- Manejo de ingresos y egresos.\n- Misceláneos (IVA, % de ganancia, cálculo para tarjetas).\n\nReglas Generales:\n- Los campos de datos tipo "TEXT" deben tener como longitud máxima 500 caracteres.\n- Los campos que contengan datos tipo "DATE" debe tener información de fecha y hora.\n- El campo "FECHA_CREACION":\n 1. Siempre debe tener fecha de inserción en la base de datos "KIOSCO".\n 2. Siempre es obligatorio.\n 3. No debe ser actualizado bajo ninguna circunstancia.\n- El campo "FECHA_ACTUALIZACION":\n 1. No deber tener información cuando se crea el registro.\n 2. No debe ser jamás igual o inferior al campo "FECHA_CREACION".\n 3. Debe ser actualizado en cada ocasión que el registro sea modificado.\n 4. No debe ser jamás un valor superior al campo "FECHA_ELIMINACION".\n- El campo "FECHA_ELIMINACION":\n 1. No deber tener información cuando se crea el registro.\n 2. No debe ser jamás igual o inferior al campo "FECHA_CREACION".\n 3. No debe ser jamás un valor inferior al campo "FECHA_ACTUALIZACION".\n- Si el campo "FECHA_ELIMINACION" tiene valor, ese dato no debe ser tomado en cuenta para ninguna lista que tenga valores usables en el sistema. A excepción de listas de datos que lo requieran explicítamente.';*/