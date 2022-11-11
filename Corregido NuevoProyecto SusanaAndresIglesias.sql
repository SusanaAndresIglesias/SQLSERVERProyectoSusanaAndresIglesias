create database SusanaAndresIglesias

use SusanaAndresIglesias

--CREO TABLA CLIENTES/TABLA RESERVAS/TABLA DATOS DE PAGO/TABLA FACTURA y RELACIONES

create table CLIENTES(
id int identity (1,1) primary key not null,
Nombre varchar (20) not null,
Apellidos varchar (30) not null,
DNI varchar (12) not null,
Fecha_Nacimiento datetime,
Domicilio text not null,
Codigo_Postal smallint,
Ciudad varchar (20),
Pais varchar (20),
Telefono integer not null,
Email varchar (40) not null
);

create table RESERVAS(
id int identity (1,1) primary key not null,
idCLIENTE int not null,
idDATOS_PAGO int not null,
Fecha_Reserva datetime not null,
Matricula varchar (10) not null,
Marca_vehiculo varchar (20)not null,
CONSTRAINT fk_cliente FOREIGN KEY (idcliente)REFERENCES clientes (id)
);

create table FACTURAS(
id int identity (1,1) primary key not null,
idDATOS_PAGO int not null,
Importe money not null,
Concepto varchar (40)not null);

create table DATOS_PAGO(
id int identity (1,1) primary key not null,
idRESERVAS int not null,
idFACTURAS int not null,
Fecha_Reserva datetime,
Importe money not null,
Modo_Pago varchar (15)not null,
CONSTRAINT fk_reservas FOREIGN KEY (idreservas)REFERENCES Reservas (id),
CONSTRAINT fk_facturas FOREIGN KEY (idfacturas)REFERENCES facturas (id)
);

--MODIFICO TIPO DATO

alter table CLIENTES alter column Codigo_Postal varchar (10)

USE SusanaAndresIglesias

-- INTRODUZCO DATOS TABLA CLIENTES

INSERT INTO CLIENTES VALUES ('Pedro','Fernandez','12123456','12/12/80','Calle Calvo Sotelo'
 ,'39014','Santander','España','942212121','pfer@gmail.com');
 
 SELECT * FROM CLIENTES

 INSERT INTO CLIENTES VALUES ('Angel','Garcia','12121212','12/12/77','Calle General Davila'
 ,'39024','Santander','España','942211212','agar@gmail.com')
 INSERT INTO CLIENTES VALUES ('Susana','Fernandez','12123455','12/12/76','Calle Marques de la Hermida'
 ,'39011','Santander','España','942121314','sfer@gmail.com')
 INSERT INTO CLIENTES VALUES ('David','Fuente','99883663','11/12/80','Paseo Pereda'
 ,'39041',NULL,NULL,'942323232','dafer@gmail.com')
 INSERT INTO CLIENTES VALUES ('Jorge','Perez','44444444','10/12/70','Calle Pesquera',
 NULL,'Torrelavega','España','942666666','jper@gmail.com')
 INSERT INTO CLIENTES VALUES ('Pablo','Fernandez','12123456','12/12/80','Calle Calvo Sotelo'
 ,'39024','Santander','España','942131344','pafer@gmail.com');

  INSERT INTO CLIENTES VALUES ('Jorge','Gracia','13256633','12/12/69','Calle Calvo Sotelo'
 ,'39014','Santander',NULL,'942154612','jorgra@gmail.com')
 INSERT INTO CLIENTES VALUES ('Ana','Fernandez','11556699','12/12/79','Calle Hernan Cortes'
 ,'39014','Bezana','España','942157896','anafer@gmail.com')
 INSERT INTO CLIENTES VALUES ('Marta','Bedia','12123456','12/12/80','Rampa Sotileza'
 ,NULL,NULL,NULL,'942137899','marbed@gmail.com')
 INSERT INTO CLIENTES VALUES ('Sara','Iglesias','48963321','12/12/77','Barrio San Jose'
 ,'39479','Pielagos','España','942997788','saigl@gmail.com')
 INSERT INTO CLIENTES VALUES ('Mayte','Suarez','09456321','10/12/60','Avda del Mar'
 ,NULL,'Santander','España','942298930','maysu@gmail.com');

 INSERT INTO CLIENTES VALUES ('Peter','Piedra','07123456','12/12/80','Rampa Sotileza'
 ,'39026','Santander',NULL,'942317899','peterpied@gmail.com')
 INSERT INTO CLIENTES VALUES ('Paloma','Piedra','11123456','12/08/80','Calle Hernan Cortes'
 ,'39026','Bezana',NULL,'942138799','palopied@gmail.com')
 INSERT INTO CLIENTES VALUES ('Diego','Salcedo','07123456','10/12/50','Rampa Sotileza'
 ,NULL,NULL,NULL,'941237899','diesalc@gmail.com')
 INSERT INTO CLIENTES VALUES ('Jorge','Piedra','01123456','12/08/75','Pasaje Peña'
 ,'39025','Null','NULL','942138799','jorgpied@gmail.com')
 INSERT INTO CLIENTES VALUES ('Angela','Salcedo','07133456','10/12/50','Rampa Sotileza'
 ,NULL,NULL,NULL,'941237399','sansalc@gmail.com');

 
 -- INTRODUZCO DATOS TABLA RESERVAS

 INSERT INTO RESERVAS VALUES ('1','1','12/12/99','2364BMN', 'Mercedes');

 SELECT * FROM RESERVAS

 INSERT INTO RESERVAS VALUES ('2','2','10/10/2014','2398ZXY', 'BMW')
 INSERT INTO RESERVAS VALUES ('3','4','12/11/2015','5463BMN', 'Audi')
 INSERT INTO RESERVAS VALUES ('3','3','12/11/2019','5463BMN', 'Audi')
 INSERT INTO RESERVAS VALUES ('10','11','12/11/2020','5463BMN', 'Audi')
 INSERT INTO RESERVAS VALUES ('5','9','10/11/2019','1313BXN', 'Audi')
 INSERT INTO RESERVAS VALUES ('12','6','12/11/2021','4114CTT', 'BMW')
 INSERT INTO RESERVAS VALUES ('1','7','12/11/2018','2398ZXY', 'BMW')
 INSERT INTO RESERVAS VALUES ('10','4','12/11/2021','5463BMN', 'Audi');

  -- INTRODUZCO DATOS TABLA FACTURAS

 INSERT INTO FACTURAS VALUES ('1','40.55','PARA EMPRESA');

 SELECT * FROM FACTURAS
 
 INSERT INTO FACTURAS VALUES ('3','90.55','PARTICULAR')
 INSERT INTO FACTURAS VALUES ('5','40.55','PARA EMPRESA')
 INSERT INTO FACTURAS VALUES ('7','140.55','PARA EMPRESA')
 INSERT INTO FACTURAS VALUES ('10','70.55','PARTICULAR')
 INSERT INTO FACTURAS VALUES ('4','340.55','PARA EMPRESA')
 INSERT INTO FACTURAS VALUES ('12','240.55','PARA EMPRESA')
 INSERT INTO FACTURAS VALUES ('12','100.55','EMPRESA')
 INSERT INTO FACTURAS VALUES ('11','80.65','PARA EMPRESA')
 INSERT INTO FACTURAS VALUES ('4','199.10','PARA EMPRESA')
 INSERT INTO FACTURAS VALUES ('8','50.55','PARTICULAR')
 INSERT INTO FACTURAS VALUES ('13','130.55','PARA EMPRESA')
 INSERT INTO FACTURAS VALUES ('14','180.55','PARTICULAR')
 INSERT INTO FACTURAS VALUES ('5','90.55','PARTICULAR')
 INSERT INTO FACTURAS VALUES ('12','40.55','PARA EMPRESA')
 INSERT INTO FACTURAS VALUES ('1','140.55','PARA EMPRESA')
 INSERT INTO FACTURAS VALUES ('3','70.55','PARTICULAR')
 INSERT INTO FACTURAS VALUES ('9','240.55','PARA EMPRESA');

  --INTRODUZCO DATOS TABLA DATOS_PAGO

 INSERT INTO DATOS_PAGO VALUES ('1','1','10/12/20','40.55','Efectivo'
);

SELECT * FROM DATOS_PAGO

INSERT INTO DATOS_PAGO VALUES ('2','3','10/12/19','40.55','Tarjeta')
INSERT INTO DATOS_PAGO VALUES ('3','4','10/12/21','92.55','Tarjeta')
INSERT INTO DATOS_PAGO VALUES ('2','3','10/12/20','90.55','Tarjeta')
INSERT INTO DATOS_PAGO VALUES ('4','3','10/11/17','102.55','Transferencia')
INSERT INTO DATOS_PAGO VALUES ('5','12','10/12/19','192.55','Tarjeta')
INSERT INTO DATOS_PAGO VALUES ('6','11','10/11/22','302.55','Bizum')
INSERT INTO DATOS_PAGO VALUES ('7','10','10/12/18','292.55','Tarjeta')
INSERT INTO DATOS_PAGO VALUES ('9','8','10/12/22','292.55','Tarjeta');

use SusanaAndresIglesias

-- EJEMPLOS CONSULTAS

-- Ordeno varias columnas por uno de los datos 

select id, nombre, apellidos from CLIENTES order by Apellidos

select id, nombre, apellidos, email from CLIENTES order by Fecha_Nacimiento

-- ejemplo consulta tablas Clientes y Reservas
-- creo consulta y obtengo la marca, matricula y fecha reserva de un cliente concreto con DNI

select marca_vehiculo, matricula, Nombre, Apellidos, Fecha_Reserva
from CLIENTES,RESERVAS
where CLIENTES.id = RESERVAS.idCLIENTE
and clientes.DNI = '12123456'


-- ejemplo consulta tablas Clientes y Reservas
-- creo consulta y agrupo datos por marca y matricula de las reservas hechas por un cliente
-- mostrando la fecha

select marca_vehiculo, matricula, Nombre, Apellidos, Fecha_Reserva
from CLIENTES,RESERVAS
where CLIENTES. id = RESERVAS.idCLIENTE


-- Ejemplo consultas con ORDER BY
--Ordenando ascendente y descendente

SELECT * FROM CLIENTES ORDER BY ciudad asc

SELECT * FROM CLIENTES ORDER BY ciudad desc


-- ejemplos consultas con where
-- añado una condicion

SELECT* FROM CLIENTES where ciudad='Santander'

SELECT* FROM facturas where Concepto='empresa'

SELECT* FROM DATOS_PAGO where Modo_Pago='transferencia'

SELECT* FROM RESERVAS where MARCA_VEHICULO='MERCEDES'
SELECT* FROM RESERVAS where MARCA_VEHICULO='AUDI'

--EJEMPLOS CONSULTAS (IS) NULL/NOT NULL

select nombre
from CLIENTES
where Ciudad IS NOT NULL

select id
from CLIENTES
where Ciudad IS NULL


 select * from clientes

--AGREGAR COLUMNA EN TABLA

--ALTER TABLE (nombre tabla)
--ADD (nombre nueva columna) VARCHAR(20) NULL ;

ALTER TABLE RESERVAS
ADD PRUEBA_AGREGAR VARCHAR(20) NULL ;

-- Actualizar un registro

--UPDATE agenda
  --SET telefono='662142223' , email='albesanch@mimail.com'
  --WHERE nombre='Alberto Sanchez'


UPDATE CLIENTES
  SET telefono='11223344' , email='pruebacambio@gmail.com'
  WHERE nombre='Pedro'


  UPDATE CLIENTES
  SET Pais='null'
  WHERE nombre='peter'

  select * from CLIENTES

  UPDATE CLIENTES
  SET Ciudad='null', Pais='null'
  WHERE nombre='paloma'

  UPDATE CLIENTES
  SET Ciudad='null', Pais='null'
  WHERE nombre='Jorge'

  -- Consultas con IN (busqueda de varios) 

   --SELECT * FROM discos
   --WHERE titulo IN ('Brothers in arms','Tubular Bells')
  
  SELECT * FROM CLIENTES
   WHERE nombre IN ('Pedro','Angel')

   -- UTILIZAR DELETE (BORRAR REGISTRO)
   --DELETE FROM agenda WHERE nombre='Juan Ruiz'
  
  DELETE FROM CLIENTES WHERE Apellidos='BEDIA'

  -- CONSULTA UTILIZANDO IS NOT NULL / IS NULL

select nombre
from CLIENTES
where Ciudad IS NOT NULL

select Nombre
from CLIENTES
where Ciudad IS NULL

select id
from CLIENTES
where Pais IS NULL

--CONSULTA PEDIDA POR PORFESOR UTILIZANDO JOIN (LEFT JOIN)
-- obtiene todas las facturas por cliente

SELECT CLIENTES.DNI, CLIENTES.Nombre, FACTURAS.Importe
FROM CLIENTES
LEFT JOIN RESERVAS ON CLIENTES.id = RESERVAS.idCLIENTE
left join DATOS_PAGO on RESERVAS.idDATOS_PAGO = DATOS_PAGO.id
left join FACTURAS on DATOS_PAGO.idFACTURAS = DATOS_PAGO.idFACTURAS
order by CLIENTES.Nombre

--obtiene la suma de todas las facturas por cliente
SELECT CLIENTES.DNI, CLIENTES.Nombre, sum(FACTURAS.Importe)
FROM CLIENTES
LEFT JOIN RESERVAS ON CLIENTES.id = RESERVAS.idCLIENTE
left join DATOS_PAGO on RESERVAS.idDATOS_PAGO = DATOS_PAGO.id
left join FACTURAS on DATOS_PAGO.idFACTURAS = DATOS_PAGO.idFACTURAS
group by CLIENTES.DNI, CLIENTES.Nombre

-- ME PIDE PROFESOR INTENTAR CREAR UN PROCEDIMIENTO ALMACENADO
--el procedimiento devuelve la suma de las facturas de un cliente

create procedure Procedimiento_SumaImporteCliente
  @pIdCliente int
 as
 Begin
	SELECT CLIENTES.DNI, CLIENTES.Nombre, sum(FACTURAS.Importe)
	FROM CLIENTES
	LEFT JOIN RESERVAS ON CLIENTES.id = RESERVAS.idCLIENTE
	left join DATOS_PAGO on RESERVAS.idDATOS_PAGO = DATOS_PAGO.id
	left join FACTURAS on DATOS_PAGO.idFACTURAS = DATOS_PAGO.idFACTURAS
	where CLIENTES.id = @pIdCliente
	group by CLIENTES.DNI, CLIENTES.Nombre
   END
 GO

 --Para ejecutar el procedimiento

 execute [dbo].[Procedimiento_SumaImporteCliente] 3;

 
