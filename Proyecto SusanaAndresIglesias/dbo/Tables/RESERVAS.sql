CREATE TABLE [dbo].[RESERVAS] (
    [id]             INT          IDENTITY (1, 1) NOT NULL,
    [idCLIENTE]      INT          NOT NULL,
    [idDATOS_PAGO]   INT          NOT NULL,
    [Fecha_Reserva]  DATETIME     NOT NULL,
    [Matricula]      VARCHAR (10) NOT NULL,
    [Marca_vehiculo] VARCHAR (20) NOT NULL,
    [PRUEBA_AGREGAR] VARCHAR (20) NULL,
    PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [fk_cliente] FOREIGN KEY ([idCLIENTE]) REFERENCES [dbo].[CLIENTES] ([id])
);

