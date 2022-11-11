CREATE TABLE [dbo].[DATOS_PAGO] (
    [id]            INT          IDENTITY (1, 1) NOT NULL,
    [idRESERVAS]    INT          NOT NULL,
    [idFACTURAS]    INT          NOT NULL,
    [Fecha_Reserva] DATETIME     NULL,
    [Importe]       MONEY        NOT NULL,
    [Modo_Pago]     VARCHAR (15) NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [fk_facturas] FOREIGN KEY ([idFACTURAS]) REFERENCES [dbo].[FACTURAS] ([id]),
    CONSTRAINT [fk_reservas] FOREIGN KEY ([idRESERVAS]) REFERENCES [dbo].[RESERVAS] ([id])
);

