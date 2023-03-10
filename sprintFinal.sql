create database sprintfinal;
use sprintfinal;
CREATE TABLE cliente (
   rutcliente int NOT NULL primary key,
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
CREATE TABLE profesional (
	idprofesional int(100) not null primary key auto_increment,
    rutprofesional int(100) NOT NULL  ,
    tituloProf varchar(100)  ,
    nombreproyecto varchar(50),
    telefono varchar(20)
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

alter table usuario add  foreign key (cliente_rutcliente) references cliente (rutcliente);
alter table usuario add  foreign key (profresional_id) references profesional (idprofesional);
alter table usuario add  foreign key (Administrativo_id) references administrativo (idadmin);


CREATE TABLE visita (
idvisita int(9) primary key auto_increment,
visfecha date,
vishora date,
vislugar varchar(50),
viscomentario varchar(250),
cliente_rutcliente int(5)
);
alter table visita modify vishora time;
CREATE TABLE accidente (
accidenteid int(9) NOT NULL primary key auto_increment,
   dia date  ,
   hora date,
   lugar varchar(50) ,
   origen varchar(100) ,
   consecuencia varchar(100) ,
   Cliente_rutcliente  int(9) 
);
alter table accidente modify hora time;
CREATE TABLE capacitacion (
  idcapacitacion int(9) NOT NULL primary key auto_increment,
  fecha date  ,
  hora date,
  lugar varchar(50) ,
  duracion int(3) ,
  cantidadasistente int(5) ,
  Cliente_rutcliente  int(9) 
);
alter table capacitacion modify hora time;
CREATE TABLE asistente (
  idasistente int(9) NOT NULL primary key auto_increment,
  nombres varchar(100)  ,
  edad int(9),
  telefono_asistente varchar(20),
  Capacitacion_idcapacitacion int(9) 
);
alter table asistente add correo_asistente varchar(50);
alter table capacitacion add constraint cliente_capacitacion_fk foreign key (cliente_rutcliente) references cliente (rutcliente);
alter table visita add constraint visita_cliente_fk foreign key (cliente_rutcliente) references cliente (rutcliente);
alter table accidente add constraint cliente_accidente_fk foreign key (cliente_rutcliente) references cliente (rutcliente);
alter table asistente add constraint capacitacion_asistente_fk foreign key (capacitacion_idcapacitacion) references capacitacion (idcapacitacion);
/*-------------------------------------------------------------------------------------------------------------------*/
-- 
insert into administrativo (rutadmin, correoadmin, areaadmin) 
values
(1111111, 'admin1@gmail', "aseo"),
(222222, 'admin2@gmail', "bodega"),
(333333, 'admin3@gmail', "seguridad");

-- 
insert into cliente (rutcliente, nombres, apellidos, telefono, afp,sistemasalud, direccion, comuna,edad) 
values
(1111111, 'cliente1', "apellido1", 123456, "modelo",1,"cataratas","valpo", 19),
(2222222, 'cliente2', "apellido2",1234567, "capital",2,"los lagos", "vi??a", 20),
(3333333, 'cliente3', "apellido3",12345678, "modelo",3, "los rios", "metropoloitana",32);


-- 
insert into pagos ( fechapago, monto, mespagando, aniopagando,cliente_rutcliente) 
values
("2020-01-12", 1000, "enero", "2013",  1111111),
("2020-02-13", 2000, "febrero","2023",  2222222),
("2020-04-14", 3000, "marzo","2021",3333333);

describe accidente;
-- 
insert into accidente ( dia, hora,lugar,origen,consecuencia, cliente_rutcliente ) 
values
("2023-01-13", "12:00",   "valparaiso","casa","mal uso", 1111111 ),
("2023-02-15", "13:00",   "vi??a", "departamento","seguridad",2222222),
("2023-02-21", "15:00", "santiago","oficina","piso resbaladizo",3333333 );

describe chequeo;
-- 
insert into chequeo ( nombrechequeo, estado_chequeo,nombre_empresa,cliente_rutcliente ) 
values
("chequeo1", 1,   "empresa1", 1111111 ),
("chequeo2", 2,   "empresa2",2222222),
("chequeo3", 3, "empresa3",3333333 );

describe capacitacion;
-- 
insert into capacitacion ( fecha, hora,lugar,duracion,cantidadasistente, cliente_rutcliente ) 
values
("2023-01-13", "12:00",   "valparaiso",3,10, 1111111 ),
("2023-02-15", "13:00",   "vi??a", 2,20,2222222),
("2023-02-21", "15:00", "santiago",5,24,3333333 );

describe asistente;
-- 
insert into asistente ( nombres, edad,telefono_asistente,Capacitacion_idcapacitacion, correo_asistente) 
values
("pedro", 19,933333333,1,'pedro@hmail.com'),
("juan", 23,9444444, 2,'juan@gmail.com'),
("diago", 32, 9555555,3, 'diego@gmail.com' );

describe visita;
-- 
insert into visita ( visfecha, vishora, vislugar, viscomentario,cliente_rutcliente) 
values
("2020-01-12", '20:00', "planta A", "suciedad",  1111111),
("2020-02-13", '12:00', "planta B","todo limpio",  2222222),
("2020-04-14", '13:00', "planta C","electrico",3333333),
("2020-01-12", '20:00', "Valparaiso", "cambio de ropa", 1111111 );
describe profesional;
-- 
insert into profesional (rutprofesional, tituloprof, nombreproyecto, telefono) 
values
(4444444, 'contador', "revision contable", 123456),
(555555, 'segudidad industrial', "seguridad de bodegas",7891234),
(666666, 'riesgos', "riesgos de elaboracion",5678901);
select * from profesional;
describe usuario;
-- 
insert into usuario ( usunombre, usuapellidos,usufechanac,cliente_rutcliente, administrativo_id, profresional_id) 
values
("usuario1", "usuarioapellido1",   "1995-10-13", 1111111 , 1, 1),
("usuario2", "usuarioapellido2",   "1965-11-13",2222222, 2, 2),
("usuario3", "usuarioapellido3", "1985-12-15",3333333,3, 3 );

describe asesoria;
-- 
insert into asesoria (fecha_asesoria, motivo_asesoria,cliente_rutcliente, idprofesional) 
values
("2020-05-14", "solicitud",   1111111, 1 ),
("2020-01-23", "emergencia",   2222222,2),
("2020-12-24", "riesgos", 3333333,3);

describe mejoras;
-- 
insert into mejoras ( titulo_mejora, descripcion_mejora,id_asesoria) 
values
("mejora1", "mejorarequipos1", 1),
("mejora2", "mejorarequipos2",2),
("mejora3", "mejorarequipos3",3 );

/*----------------------------------------------------------------------------------------------------------------*/


/*a) Realice una consulta que permita listar todas las capacitaciones de un cliente en 
particular, indicando el nombre completo, la edad y el correo electr??nico de los 
asistentes.
*/
describe asistente;
select  idcapacitacion, cliente.nombres , asistente.nombres, asistente.edad, asistente.correo_asistente
from cliente
inner join capacitacion on Cliente_rutcliente = rutcliente
inner join asistente on Capacitacion_idcapacitacion = idcapacitacion
where cliente.rutcliente like '%1111111%' ;

/*b) Realice una consulta que permita desplegar todas las visitas en terreno realizadas a los 
clientes que sean de la comuna de Valpara??so. Por cada visita debe indicar todos los 
chequeos que se hicieron en ella, junto con el estado de cumplimiento de cada uno*/
select cliente.nombres, visita.idvisita, estado_chequeo, visita.vislugar
from cliente
inner join visita on visita.Cliente_rutcliente = rutcliente
inner join chequeo on chequeo.Cliente_rutcliente = rutcliente
where visita.vislugar = "Valparaiso";
/*c) Realice una consulta que despliegue los accidentes registrados para todos los clientes, 
indicando los datos de detalle del accidente, y el nombre, apellido, RUT y tel??fono del 
cliente al que se asocia dicha situaci??n*/

select cliente.nombres as nombre_cliente,cliente.apellidos as apellido_cliente, cliente.rutcliente as rut_cliente, cliente.telefono as telefono_cliente, accidente.consecuencia as consecuencia_accidente
from cliente
inner join accidente on accidente.Cliente_rutcliente = rutcliente;
