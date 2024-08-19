/*comando para crear una base de datos*/
CREATE DATABASE bd_sistema;

/*SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";: Esta instrucción establece el modo de SQL para evitar que los valores de AUTO_INCREMENT se establezcan automáticamente en 0 si no se e<
specifica ningún valor explícito durante una inserción. En lugar de eso, se generará el siguiente valor de AUTO_INCREMENT disponible. Esto ayuda a evitar ambigüedades o errores en los datos.
START TRANSACTION;: Esta instrucción inicia una transacción en la base de datos. Una transacción agrupa un conjunto de operaciones de base de datos en una unidad lógica de trabajo que se 
ejecuta de manera coherente (todas las operaciones tienen éxito) o no se ejecuta en absoluto (todas las operaciones fallan). Es útil cuando necesitas asegurarte de que varias operacione 
se realicen de manera consistente.
SET time_zone = "+00:00";: Esta instrucción establece la zona horaria de la sesión actual en +00:00, que es la zona horaria UTC (Tiempo Universal Coordinado). Esto puede ser útil para
 garantizar la consistencia en las operaciones que involucran fechas y horas en diferentes zonas horarias.
*/
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";



/*CREATE TABLE es el comando para crea un tabla 'personas' es el nomnbre de la tabla (En este espacio ingresamos los atributos
    nombre de atributo     TIPO DE VARIABLE  (tamaño)  NOT NULL(no permite valores nulos o vacíos )separado por una coma ,
ej:     nombres                    INT         (20)         NOT NULL        , )
OTROS VALORES:
-TIMESTAMP: utilizamos esta sentencia para registrar la hora y fecha de creacion en la base de datos es decir una marca de tiempo
-DEFAULT CURRENT_TIMESTAMP: Cuando se inserta una nueva fila en la tabla y no se proporciona un valor para este campo, se estanlece automaticamente en la marca de tiempo actual.
ON UPDATE CURRENT TIMESTAMP: Cuando se actualiza la fila en la que se encuentra este campo,se actualiza automáticamente con la marca de tiempo actual.
PRIMARY KEY: Clave primaria o clave principal de la tabla.
FOREIGN KEY Clave foránea.
ENGINE=INNODB: Se refiere al motor de almacenamiento que utilizaremos en la base de datos
INSERT INTO: lo definiriamos como "insertar a"  nombre de la tabla'personas' VALUES(valores) (aqui ingresamos en orden los valores de los atributos de acuerdo a lo ingresado en 
la tabla) por ejemplo:
INSERT INTO personas VALUES(id_persona,ci,paterno,materno,nombres,celular,correo,fechanacimiento,direccion,genero,profesion,fechaCreacion,fechaModificacion,estado,ultimoUsuario)
*/

CREATE TABLE personas (
  id_persona INT NOT NULL AUTO_INCREMENT,
  ci VARCHAR(18) NOT NULL,
  paterno VARCHAR(15) NOT NULL,
  materno VARCHAR(15) NOT NULL,
  nombres VARCHAR(20) NOT NULL,
  celular VARCHAR(8) NOT NULL,
  correo VARCHAR(35) NOT NULL,
  rol VARCHAR(15) NOT NULL,
  /* se cambió profesion por rol porque de acuerdo a esto podemos dar privilegio al usuario que ingrese al sistema previa validación
     se propone un espacio de opción múltiple con tres opciones: ADMINISTRADOR, DOCENTE, ESTUDIANTE donde los dos primeros tendrán que validar su ingreso */
  /* dirección VARCHAR(15) NOT NULL; se eliminó para tener un formulario más liviano y esta información se considera de prioridad baja */
  fechaNacimiento DATE NOT NULL,
  fechaCreacion TIMESTAMP NOT NULL,
  fechaModificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  estado INT NOT NULL,
  ultimoUsuario INT NOT NULL,
  PRIMARY KEY (id_persona)
) ENGINE=INNODB;
-- Insertar datos en la tabla personas con id_persona especificados y fechaModificacion incluida
INSERT INTO personas (id_persona, ci, paterno, materno, nombres, celular, correo, rol, fechaNacimiento, fechaCreacion, fechaModificacion, estado, ultimoUsuario) 
VALUES 
-- DOCENTES
(1, '1234567', 'GARCIA', 'MORENO', 'JUAN PABLO', '77123456', 'juan.pablo@gmail.com', 'DOCENTE', '1985-06-15', NOW(), NOW(), 1, 1),
(2, '2345678', 'REYES', 'MARTINEZ', 'ANA MARIA', '77234567', 'ana.maria@edu.com', 'DOCENTE', '1978-11-22', NOW(), NOW(), 1, 2),
(3, '3456789', 'ALVAREZ', 'RODRIGUEZ', 'CARLOS', '77345678', 'carlos.alvarez@university.com', 'DOCENTE', '1983-04-10', NOW(), NOW(), 1, 3),

--  ADMINISTRADOR
(4, '4567890', 'MORALES', 'GUTIERREZ', 'PEDRO', '77456789', 'pedro.morales@admin.com', 'ADMINISTRADOR', '1980-08-30', NOW(), NOW(), 1, 4),

--  ESTUDIANTES
(5, '5678901', 'MORENO', 'CASTAÑO', 'VALERIA', '77567890', 'valeria.moreno@student.com', 'ESTUDIANTE', '2001-01-05', NOW(), NOW(), 1, 5),
(6, '6789012', 'CAMPO', 'FERNANDEZ', 'ANDREA', '77678901', 'andrea.campo@student.edu', 'ESTUDIANTE', '2000-12-17', NOW(), NOW(), 1, 6),
(7, '7890123', 'JIMENEZ', 'GALINDO', 'DANIEL', '77789012', 'daniel.jimenez@school.com', 'ESTUDIANTE', '2003-02-25', NOW(), NOW(), 1, 7),
(8, '8901234', 'URIBE', 'PANIAGUA', 'MARIA JOSE', '77890123', 'maria.jose@college.edu', 'ESTUDIANTE', '2002-10-30', NOW(), NOW(), 1, 8),
(9, '9012345', 'MENDOZA', 'TORO', 'SANTIAGO', '77901234', 'santiago.mendoza@student.net', 'ESTUDIANTE', '1999-09-12', NOW(), NOW(), 1, 9),
(10, '0123456', 'GUTIERREZ', 'GARCIA', 'LAURA', '78012345', 'laura.gutierrez@university.edu', 'ESTUDIANTE', '2001-07-22', NOW(), NOW(), 1, 10);


CREATE TABLE administrativo (
  id_administrativo INT NOT NULL AUTO_INCREMENT,
  id_persona INT NOT NULL,
  cargo VARCHAR(25) NOT NULL, /* se recomienda en esta opción crear una selección múltiple para dar privilegios de usuario entre los cargos administrativos */
  /* nivel VARCHAR NOT NULL; se eliminó este atributo debido a que el sistema es indiferente al nivel jerárquico de la institución */
  usuario VARCHAR(10) NOT NULL,
  contraseña VARCHAR(15) NOT NULL,
  PRIMARY KEY (id_administrativo),
  FOREIGN KEY (id_persona) REFERENCES personas(id_persona)
) ENGINE=INNODB;
INSERT INTO administrativo VALUES(1,4,'RECTOR','admin','password');

CREATE TABLE estudiante (
  id_estudiante INT NOT NULL AUTO_INCREMENT,
  id_persona INT NOT NULL,
  PRIMARY KEY (id_estudiante),
  FOREIGN KEY (id_persona) REFERENCES personas(id_persona)
) ENGINE=INNODB;
INSERT INTO estudiante VALUES(1,5);
INSERT INTO estudiante VALUES(2,6);
INSERT INTO estudiante VALUES(3,7);
INSERT INTO estudiante VALUES(4,8);
INSERT INTO estudiante VALUES(5,9);
INSERT INTO estudiante VALUES(6,10); 

CREATE TABLE docente (
  id_docente INT NOT NULL AUTO_INCREMENT,
  id_persona INT NOT NULL,
  usuario VARCHAR(20),
  contraseña VARCHAR(20),
  PRIMARY KEY (id_docente),
  FOREIGN KEY (id_persona) REFERENCES personas(id_persona)
) ENGINE=INNODB;
INSERT INTO docente VALUES(1,1,'DOCENTE1','CLAVEDOC1');
INSERT INTO docente VALUES(2,2,'DOCENTE2','CLAVEDOC2');
INSERT INTO docente VALUES(3,3,'DOCENTE3','CLAVODOC3');

CREATE TABLE curso (
  id_curso INT NOT NULL AUTO_INCREMENT,
  id_docente INT NOT NULL,
  id_persona INT NOT NULL,
  nombre_curso VARCHAR(20) NOT NULL,
  tipo VARCHAR(18) NOT NULL,
  precio FLOAT(8,2) NOT NULL,
  horario VARCHAR(8) NOT NULL,
  cargaHoraria VARCHAR(11) NOT NULL,
  /* ciDocente VARCHAR(10) NOT NULL; se considera innecesaria, esto debido a que contamos con id_docente como clave foránea */
  fechaInicio DATE NOT NULL,
  descripcion VARCHAR(35) NOT NULL,
  lugar VARCHAR(25) NOT NULL,
  cupo INT NOT NULL,
  fechaCreacion TIMESTAMP NOT NULL,
  fechaModificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  estado INT NOT NULL,
  ultimoUsuario INT NOT NULL,
  PRIMARY KEY (id_curso),
  FOREIGN KEY (id_docente) REFERENCES docente(id_docente),
  FOREIGN KEY (id_persona) REFERENCES personas(id_persona)
) ENGINE=INNODB;
INSERT INTO curso VALUES(1,1,1,'PROGRAMACION I','PRESENCIAL',200.0,'17:00','500','2024-06-08','INTRODUCCION A LA PROGRAMACIÓN Y LA LÓGICA FORMAL','ITBM',50,NOW(),NOW(),1,1);
INSERT INTO curso VALUES(2,2,2,'EXCEL MEDIO','VIRTUAL',100.0,'8:00','400','2024-06-08','EXCEL A UN NIVEL MAS AMBIGUO CON FORMULAS AVANZADAS','PLATAFORMA V',50,NOW(),NOW(),1,1);
INSERT INTO curso VALUES(3,3,3,'MARIA DB','PRESENCIAL',150.0,'14:00','300','2024-06-08','TODO LO QUE DEBES APRENDER PARA OPERAR MARIA DB','ITBM',50,NOW(),NOW(),1,1);



CREATE TABLE inscripcion (
  id_inscripcion INT NOT NULL AUTO_INCREMENT,
  id_curso INT NOT NULL,
  id_persona INT NOT NULL, /* se aumentó este atributo como clave foránea debido a que las personas que se inscriban al curso heredarán los atributos de la tabla personas */
  /* ci_administrativo VARCHAR(10) NOT NULL; se considera un dato innecesario, puesto que la persona que creará un curso debe ser un administrativo previamente validado con usuario y contraseña */
  /* fecha_hora DATETIME NOT NULL; se plantea que se tome en cuenta la fecha y hora de la inscripción en el momento en el que se registre en el sistema */
  nro_deposito VARCHAR(15) NOT NULL,
  pago VARCHAR(10) NOT NULL,
  saldo VARCHAR(10) NOT NULL,
  fechaCreacion TIMESTAMP NOT NULL,
  fechaModificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  estado INT NOT NULL,
  ultimoUsuario INT NOT NULL,
  PRIMARY KEY (id_inscripcion),
  FOREIGN KEY (id_curso) REFERENCES curso(id_curso),
  FOREIGN KEY (id_persona) REFERENCES personas(id_persona)
) ENGINE=INNODB;
INSERT INTO inscripcion VALUES(1,1,5,'28937463896','300 BS','0 BS',NOW(),NOW(),1,5);
INSERT INTO inscripcion VALUES(2,1,6,'28937463454','300 BS','0 BS',NOW(),NOW(),1,6);
INSERT INTO inscripcion VALUES(3,2,7,'28937463234','300 BS','0 BS',NOW(),NOW(),1,7);
INSERT INTO inscripcion VALUES(4,2,8,'28937463877','300 BS','0 BS',NOW(),NOW(),1,8);
INSERT INTO inscripcion VALUES(5,3,9,'28937463849','300 BS','0 BS',NOW(),NOW(),1,9);
INSERT INTO inscripcion VALUES(6,3,10,'28937463435','300 BS','0 BS',NOW(),NOW(),1,10);

CREATE TABLE material (
  id_material INT NOT NULL AUTO_INCREMENT,
  id_administrativo INT NOT NULL,
  nombreMaterial VARCHAR(15) NOT NULL,
  descripcion VARCHAR(40),
  fecha_insercion TIMESTAMP NOT NULL,
  fecha_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  estado INT NOT NULL,
  ultimoUsuario INT NOT NULL,
  PRIMARY KEY (id_material),
  FOREIGN KEY (id_administrativo) REFERENCES administrativo(id_administrativo)
) ENGINE=INNODB;
INSERT INTO material VALUES(1,1,'PROGRAMACION I','GUIA PARA LA PROGRAMACION A NIVEL PRINCIPIANTE',NOW(),NOW(),1,4);