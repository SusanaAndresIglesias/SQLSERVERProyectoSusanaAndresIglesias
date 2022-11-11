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
