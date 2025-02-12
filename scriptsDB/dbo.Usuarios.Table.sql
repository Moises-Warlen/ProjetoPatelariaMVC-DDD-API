USE [Pastelaria]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 09/09/2024 21:10:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](100) NULL,
	[Email] [varchar](100) NULL,
	[Senha] [varchar](50) NULL,
	[DataNascimento] [datetime] NULL,
	[IdGestor] [int] NULL,
	[IdPerfil] [int] NOT NULL,
	[Ind_Ativo] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Usuarios] ADD  DEFAULT ((1)) FOR [Ind_Ativo]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [fk_Usuario_Perfil] FOREIGN KEY([IdPerfil])
REFERENCES [dbo].[Perfis] ([IdPerfil])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [fk_Usuario_Perfil]
GO
