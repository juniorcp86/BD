/*
* NOMBRE BASE DE DATOS: KIOSCO
* NOMBRE DE LA TABLA: USUARIOS
* FECHA DE CREACIÓN: DD/MM/AAAA
* CREADO POR: Junior Casique
* FECHA DE ACTUALIZACIÓN: 
* ACTUALIZADO POR: 
* DESCRIPCIÓN: Script para realizar la creación de la tabla mencionada.
*/

CREATE TABLE IF NOT EXISTS KIOSCO.USUARIOS (
  ID_USUARIO INT NOT NULL AUTO_INCREMENT,
  DOCUMENTO_IDENTIDAD INT NOT NULL,
  TIPO_DOCUMENTO_IDENTIDAD TINYINT(1) NOT NULL,
  NOMBRE_APELLIDO_USUARIO LONGTEXT NOT NULL,
  CORREO_ELECTRONICO VARCHAR(500) NOT NULL,
  NUMERO_CONTACTO INT NULL,
  SEXO TINYINT(1) NOT NULL,
  ID_ESTADO INT NOT NULL,
  ID_ROL INT NOT NULL,
  ULTIMA_SESION DATE NULL,
  FECHA_CREACION DATE NOT NULL,
  FECHA_ACTUALIZACION DATE NULL,
  FECHA_ELIMINACION DATE NULL,
  ESTADOS_ID_ESTADO INT NOT NULL,
  ROLES_ID_ROL INT NOT NULL,
  CONTACTO_PROVEEDOR_ID_PROVEEDOR INT NOT NULL,
  CONTACTO_PROVEEDOR_ID_USUARIO INT NOT NULL,
  PRIMARY KEY (ID_USUARIO, ESTADOS_ID_ESTADO, ROLES_ID_ROL, CONTACTO_PROVEEDOR_ID_PROVEEDOR, CONTACTO_PROVEEDOR_ID_USUARIO),
  UNIQUE INDEX CORREO_ELECTRONICO_UNIQUE (CORREO_ELECTRONICO ASC),
  UNIQUE INDEX CEDULA_IDENTIDAD_UNIQUE (DOCUMENTO_IDENTIDAD ASC),
  UNIQUE INDEX NUMERO_CONTACTO_UNIQUE (NUMERO_CONTACTO ASC),
  INDEX fk_USUARIOS_ESTADOS_idx (ESTADOS_ID_ESTADO ASC),
  INDEX fk_USUARIOS_ROLES1_idx (ROLES_ID_ROL ASC),
  INDEX fk_USUARIOS_CONTACTO_PROVEEDOR1_idx (CONTACTO_PROVEEDOR_ID_PROVEEDOR ASC, CONTACTO_PROVEEDOR_ID_USUARIO ASC),
  CONSTRAINT fk_USUARIOS_ESTADOS
    FOREIGN KEY (ESTADOS_ID_ESTADO)
    REFERENCES KIOSCO.ESTADOS (ID_ESTADO)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_USUARIOS_ROLES1
    FOREIGN KEY (ROLES_ID_ROL)
    REFERENCES KIOSCO.ROLES (ID_ROL)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_USUARIOS_CONTACTO_PROVEEDOR1
    FOREIGN KEY (CONTACTO_PROVEEDOR_ID_PROVEEDOR , CONTACTO_PROVEEDOR_ID_USUARIO)
    REFERENCES KIOSCO.CONTACTO_PROVEEDOR (ID_PROVEEDOR , ID_USUARIO)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;
/*COMMENT = 'TABLA: USUARIOS\nContiene información de todos los usuarios registrados en el sistema. Listado completo de los usuarios, se encuentran clientes, vendedores, empleados y administradores. La información registrada es vital para obtener los datos en caso de utilizar facturación.\n\nID_USUARIO: Es un valor autoincremental numérico, no debe ser NULL en ninguna ocasión, es único para identificar a cada usuario y es la clave primaria.\nDOCUMENTO_IDENTIDAD: Corresponde al número de cédula de cada usuario, debe ser ser un valor númerico y único de cada usuario, es obligatorio y tiene como longitud máxima 9 caracteres.\nTIPO_DOCUMENTO_IDENTIDAD: Identifica si el usuario es nacional o extranjero, es un valor booleano y obligatorio.\nNOMBRE_APELLIDO_USUARIO: Corresponde a los nombres y apellidos de cada usuario, contiene información de texto, no debe permitir caracteres especiales a excepción de acentos y diéresis, debe ser almacenados como Camel Case, es un dato obligatorio.\nCORREO_ELECTRONICO: Corresponde a la dirección de correo electrónico del usuario, debe ser un dato único y obligatorio, no debe permitir caracteres especiales, a excepción del caracter "@" y dominio.\nNUMERO_CONTACTO: Corresponde al número teléfonico principal del usuario, debe permitir agregar teléfono celular o local, no debe permitir caracteres especiales ni letras, longitud áxima de 12 caracteres, es un dato obligatorio y no es un valor único.\nSEXO: Identifica si el usuario es masculino o femenino, es un valor booleano y obligatorio.\nID_ESTADO: Valor relacionado con la tabla "ESTADOS", es un valor entero y obligatorio.\nID_ROL: Valor relacionado con la tabla "ROLES", es un valor entero y obligatorio.\nULTIMA_SESION: Es un valor de tipo fecha que debe contener la ocasión más reciente en la que se inició la sesión en el sistema, debe actualizarse en cada ocasión.\nFECHA_CREACION: Valor que corresponde al registro de la información en base de datos, es obligatorio, pero no debe ser actualizado en ninguna otra ocasión.\nFECHA_ACTUALIZACION: Valor que corresponde a cada ocasión que se realiza alguna actualización en la información del usuario, excepto cuando se elimina el usuario, es un valor opcional cuando se crea el usuario.\nFECHA_ELIMINACION: Valor que corresponde a la fecha en la que se realizó la eliminación lógica del usuario, es un valor que solo se actualiza una vez, no es obligatorio al crear el usuario.\n\nReglas USUARIOS:\n- El dato "TIPO_DOCUMENTO_IDENTIDAD" tiene valor "1" para usuarios nacionales y valor "0" para usuarios extranjeros.\n- El dato "SEXO" tiene valor "1" para usuarios masculinos y valor "0" para usuarios femeninos.\n- El dato "ID_ESTADO" depende de la tabla "ESTADOS".\n- El dato "ID_ROL" depende de la tabla "ROLES".\n- Cada usuario solo debe tener un "ID_ROL" de acuerdo a las reglas de negocio de la tabla "ROLES".';*/