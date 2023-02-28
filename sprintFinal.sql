create database sprintfinal;
create database sprintfinal;
use sprintfinal;
CREATE TABLE cliente (
   rutcliente varchar(9) NOT NULL primary key,
   nombres varchar(30)  ,
   apellidos varchar(30)  ,
   telefono varchar(20) ,
   afp varchar(30) ,
   sistemasalud int(2) ,
   direccion  varchar(70) ,
   comuna  varchar(50) ,
   edad int (3) 
);
CREATE TABLE pagos (
   idpago int(100) NOT NULL primary key auto_increment ,
   fechapago date,
   monto int,
   mespagando varchar(20),
   aniopagando varchar(30),
   cliente_rutcliente int
);
alter table pagos add foreign key (cliente_rutcliente) references cliente (rutcliente);
CREATE TABLE asesoria (
   id_asesoria int NOT NULL primary key auto_increment ,
  fecha_asesoria date,
  motivo_asesoria varchar(100),
  cliente_rutcliente int,
  idprofesional int
);
alter table asesoria add foreign key (cliente_rutcliente) references cliente (rutcliente);
alter table asesoria add foreign key (idprofesional) references profesional (idprofesional);
CREATE TABLE mejoras (
   id_mejoras int NOT NULL primary key auto_increment ,
  titulo_mejora varchar(100),
  descripcion_mejora varchar(100),
  id_asesoria int
);
alter table mejoras add foreign key (id_asesoria) references asesoria (id_asesoria);
CREATE TABLE chequeo (
   idchequeo int(100) NOT NULL primary key auto_increment ,
   nombrechequeo varchar(100)  ,
   estado_chequeo int  ,
   nombre_empresa varchar(45),
   cliente_rutcliente int
);
alter table chequeo add CONSTRAINT cliente_rutcliente_PK foreign key (cliente_rutcliente) references cliente (rutcliente);

CREATE TABLE usuario (
   idusuario int(100) NOT NULL primary key auto_increment ,
   usunombre varchar(100)  ,
   usuapellidos varchar(50)  ,
   usufechanac date ,
   cliente_rutcliente int,
   Administrativo_id int,
   profresional_id int
);
CREATE TABLE administrativo (
	idadmin int not null primary key auto_increment,
    rutadmin int,
    correoadmin varchar(100)  ,
    areaadmin varchar(50)
);
CREATE TABLE profesional (
	idprofesional int(100) not null primary key auto_increment,
    rutprofesional int(100) NOT NULL  ,
    tituloProf varchar(100)  ,
    nombreproyecto varchar(50),
    telefono int(20)
);
alter table usuario add  foreign key (cliente_rutcliente) references cliente (rutcliente);
alter table usuario add  foreign key (profresional_rut) references profesional (idprofesional);
alter table usuario add  foreign key (Administrativo_rutadmin) references administrativo (idadmin);


CREATE TABLE visita (
idvisita int(9) primary key auto_increment,
visfecha date,
vishora date,
vislugar varchar(50),
viscomentario varchar(250),
cliente_rutcliente int(5)
);
CREATE TABLE accidente (
accidenteid int(9) NOT NULL primary key auto_increment,
   dia date  ,
   hora date,
   lugar varchar(50) ,
   origen varchar(100) ,
   consecuencia varchar(100) ,
   Cliente_rutcliente  int(9) 
);

CREATE TABLE capacitacion (
  idcapacitacion int(9) NOT NULL primary key auto_increment,
  fecha date  ,
  hora date,
  lugar varchar(50) ,
  duracion int(3) ,
  cantidadasistente int(5) ,
  Cliente_rutcliente  int(9) 
);
CREATE TABLE asistente (
  idasistente int(9) NOT NULL primary key auto_increment,
  nombres varchar(100)  ,
  edad int(9),
  telefono_asistente int(20),
  Capacitacion_idcapacitacion int(9) 
);
alter table capacitacion add constraint cliente_capacitacion_fk foreign key (cliente_rutcliente) references cliente (rutcliente);
alter table visita add constraint visita_cliente_fk foreign key (cliente_rutcliente) references cliente (rutcliente);
alter table accidente add constraint cliente_accidente_fk foreign key (cliente_rutcliente) references cliente (rutcliente);
alter table asistente add constraint capacitacion_asistente_fk foreign key (capacitacion_idcapacitacion) references capacitacion (idcapacitacion);
