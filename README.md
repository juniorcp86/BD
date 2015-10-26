# BD
Este branch es para desarrollar las versiones de la base de datos para sistema del Kiosco y futuros negocios de la familia Casique.

#############################################################################################################################
Documentación de la BD y core del negocio.
#############################################################################################################################
-----------------------------------------------------------------------------------------------------------------------------
BD: KIOSCO
Base de datos para administrar negocio del kiosco.
- Manejo de cuentas (deudas de clientes, empleados).
- Manejo de proveedores (vendedores, información bancaria).
- Manejo de inventario (listado de productos, precios de costo y de venta).
- Manejo de ingresos y egresos.
- Misceláneos (IVA, % de ganancia, cálculo para tarjetas).

Reglas Generales:
- Los campos de datos tipo "TEXT" deben tener como longitud máxima 500 caracteres.
- Los campos que contengan datos tipo "DATE" debe tener información de fecha y hora.
- El campo "FECHA_CREACION":
 1. Siempre debe tener fecha de inserción en la base de datos "KIOSCO".
 2. Siempre es obligatorio.
 3. No debe ser actualizado bajo ninguna circunstancia.
- El campo "FECHA_ACTUALIZACION":
 1. No deber tener información cuando se crea el registro.
 2. No debe ser jamás igual o inferior al campo "FECHA_CREACION".
 3. Debe ser actualizado en cada ocasión que el registro sea modificado.
 4. No debe ser jamás un valor superior al campo "FECHA_ELIMINACION".
- El campo "FECHA_ELIMINACION":
 1. No deber tener información cuando se crea el registro.
 2. No debe ser jamás igual o inferior al campo "FECHA_CREACION".
 3. No debe ser jamás un valor inferior al campo "FECHA_ACTUALIZACION".
- Si el campo "FECHA_ELIMINACION" tiene valor, ese dato no debe ser tomado en cuenta para ninguna lista que tenga valores usables en el sistema. A excepción de listas de datos que lo requieran explicítamente.
-----------------------------------------------------------------------------------------------------------------------------
TABLA: USUARIOS
Contiene información de todos los usuarios registrados en el sistema. Listado completo de los usuarios, se encuentran clientes, vendedores, empleados y administradores. La información registrada es vital para obtener los datos en caso de utilizar facturación.

ID_USUARIO: Es un valor autoincremental numérico, no debe ser NULL en ninguna ocasión, es único para identificar a cada usuario y es la clave primaria.
DOCUMENTO_IDENTIDAD: Corresponde al número de cédula de cada usuario, debe ser ser un valor númerico y único de cada usuario, es obligatorio y tiene como longitud máxima 9 caracteres.
TIPO_DOCUMENTO_IDENTIDAD: Identifica si el usuario es nacional o extranjero, es un valor booleano y obligatorio.
NOMBRE_APELLIDO_USUARIO: Corresponde a los nombres y apellidos de cada usuario, contiene información de texto, no debe permitir caracteres especiales a excepción de acentos y diéresis, debe ser almacenados como Camel Case, es un dato obligatorio.
CORREO_ELECTRONICO: Corresponde a la dirección de correo electrónico del usuario, debe ser un dato único y obligatorio, no debe permitir caracteres especiales, a excepción del caracter "@" y dominio.
NUMERO_CONTACTO: Corresponde al número teléfonico principal del usuario, debe permitir agregar teléfono celular o local, no debe permitir caracteres especiales ni letras, longitud áxima de 12 caracteres, es un dato obligatorio y no es un valor único.
SEXO: Identifica si el usuario es masculino o femenino, es un valor booleano y obligatorio.
ID_ESTADO: Valor relacionado con la tabla "ESTADOS_USUARIOS", es un valor entero y obligatorio.
ULTIMA_SESION: Es un valor de tipo fecha que debe contener la ocasión más reciente en la que se inició la sesión en el sistema, debe actualizarse en cada ocasión.
FECHA_CREACION: Valor que corresponde al registro de la información en base de datos, es obligatorio, pero no debe ser actualizado en ninguna otra ocasión.
FECHA_ACTUALIZACION: Valor que corresponde a cada ocasión que se realiza alguna actualización en la información del usuario, excepto cuando se elimina el usuario, es un valor opcional cuando se crea el usuario.
FECHA_ELIMINACION: Valor que corresponde a la fecha en la que se realizó la eliminación lógica del usuario, es un valor que solo se actualiza una vez, no es obligatorio al crear el usuario.

Reglas USUARIOS:
- El dato "TIPO_DOCUMENTO_IDENTIDAD" tiene valor "1" para usuarios nacionales y valor "0" para usuarios extranjeros.
- El dato "SEXO" tiene valor "1" para usuarios masculinos y valor "0" para usuarios femeninos.
- El dato "ID_ESTADO" depende de la tabla "ESTADOS".
-----------------------------------------------------------------------------------------------------------------------------
TABLA: ESTADOS
Contiene el listado de los estados para todos los elementos del sistema. Pueden aplicar para los usuarios, proveedores, productos, entre otros.
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
- El estado "Inactivo" en el caso de los proveedores aplica cuando no se ha realizado ningún pedido desde hace un año.
-----------------------------------------------------------------------------------------------------------------------------
