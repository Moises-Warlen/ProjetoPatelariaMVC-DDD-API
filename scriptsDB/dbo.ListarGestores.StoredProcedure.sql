USE [Pastelaria]
GO
/****** Object:  StoredProcedure [dbo].[ListarGestores]    Script Date: 09/09/2024 21:10:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ListarGestores]
AS
/*
Documentação:
Arquivo Fonte.....: [ListarGestores]sql
Objetivo..........: Listar todos os gestores da tabela Usuarios .
Autor.............: [Seu Nome]
Data..............: [Data Atual]

Exemplo de Uso:
EXEC [dbo].[ListarGestores] -- Para listar todos os gestores
*/

BEGIN
    SET NOCOUNT ON;

    -- Retorna todos os todos os gestores
    SELECT IdUsuario, Nome, Email 
    FROM Usuarios
    WHERE IdPerfil = 1 and Ind_Ativo=1;
END
GO
