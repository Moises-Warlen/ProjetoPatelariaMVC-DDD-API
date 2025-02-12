USE [Pastelaria]
GO
/****** Object:  StoredProcedure [dbo].[ListarTodosPerfil]    Script Date: 09/09/2024 21:10:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   PROCEDURE [dbo].[ListarTodosPerfil]
AS
/*
Documentação:
Arquivo Fonte.....: ListarTodosPerfil.sql
Objetivo..........: Listar todos os perfis disponíveis na tabela Perfis.
Autor.............: Moises
Data..............: 02/08/2024

Exemplo de Uso:
EXEC [dbo].[ListarTodosPerfil] -- Para listar todos os perfis
*/

BEGIN
    SET NOCOUNT ON;

    -- Retorna todos os perfis da tabela Perfis
    SELECT IdPerfil, Tipo
    FROM Perfis;
END
GO
