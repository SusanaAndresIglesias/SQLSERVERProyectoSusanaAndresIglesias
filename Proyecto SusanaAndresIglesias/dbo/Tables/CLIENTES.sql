CREATE TABLE [dbo].[CLIENTES] (
    [id]               INT          IDENTITY (1, 1) NOT NULL,
    [Nombre]           VARCHAR (20) NOT NULL,
    [Apellidos]        VARCHAR (30) NOT NULL,
    [DNI]              VARCHAR (12) NOT NULL,
    [Fecha_Nacimiento] DATETIME     NULL,
    [Domicilio]        TEXT         NOT NULL,
    [Codigo_Postal]    VARCHAR (10) NULL,
    [Ciudad]           VARCHAR (20) NULL,
    [Pais]             VARCHAR (20) NULL,
    [Telefono]         INT          NOT NULL,
    [Email]            VARCHAR (40) NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

