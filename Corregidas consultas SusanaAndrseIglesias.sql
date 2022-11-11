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
-- obtiene todas las facturas por cliente (CON CORRECCIONES)

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
--el procedimiento devuelve la suma de las facturas de un cliente(CORREGIDO)

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

 