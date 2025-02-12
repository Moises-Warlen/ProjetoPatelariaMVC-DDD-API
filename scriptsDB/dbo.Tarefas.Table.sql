USE [Pastelaria]
GO
/****** Object:  Table [dbo].[Tarefas]    Script Date: 09/09/2024 21:10:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tarefas](
	[IdTarefa] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[Descricao] [varchar](500) NULL,
	[DataAtribuicao] [datetime] NULL,
	[DataConclusao] [datetime] NULL,
	[CriadorId] [int] NULL,
	[Ind_Ativo] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdTarefa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Tarefas] ADD  DEFAULT ((1)) FOR [Ind_Ativo]
GO
ALTER TABLE [dbo].[Tarefas]  WITH CHECK ADD  CONSTRAINT [fk_Tarefa_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuarios] ([IdUsuario])
GO
ALTER TABLE [dbo].[Tarefas] CHECK CONSTRAINT [fk_Tarefa_Usuario]
GO
