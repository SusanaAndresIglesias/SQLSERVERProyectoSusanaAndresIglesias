CREATE TABLE [dbo].[FACTURAS] (
    [id]           INT          IDENTITY (1, 1) NOT NULL,
    [idDATOS_PAGO] INT          NOT NULL,
    [Importe]      MONEY        NOT NULL,
    [Concepto]     VARCHAR (40) NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

