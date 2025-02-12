USE [Pastelaria]
GO
/****** Object:  Table [dbo].[Enderecos]    Script Date: 09/09/2024 21:10:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enderecos](
	[IdEndereco] [int] IDENTITY(1,1) NOT NULL,
	[Cep] [varchar](10) NULL,
	[Cidade] [varchar](100) NULL,
	[Bairro] [varchar](20) NULL,
	[Rua] [varchar](100) NULL,
	[Numero] [int] NULL,
	[Complemento] [varchar](100) NULL,
	[IdUsuario] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEndereco] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Enderecos]  WITH CHECK ADD  CONSTRAINT [fk_Endereco_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuarios] ([IdUsuario])
GO
ALTER TABLE [dbo].[Enderecos] CHECK CONSTRAINT [fk_Endereco_Usuario]
GO
