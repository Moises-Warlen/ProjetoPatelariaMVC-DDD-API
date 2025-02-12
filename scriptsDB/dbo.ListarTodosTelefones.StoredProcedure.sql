USE [Pastelaria]
GO
/****** Object:  StoredProcedure [dbo].[ListarTodosTelefones]    Script Date: 09/09/2024 21:10:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   PROCEDURE [dbo].[ListarTodosTelefones]
    @IdUsuario INT = NULL  -- Parâmetro opcional
AS
/*
Documentação:
Arquivo Fonte.....: ListarTodosTelefones.sql
Objetivo..........: Listar todos os telefones ou os telefones de um usuário específico, se um ID for fornecido.
Autor.............: Moises
Data..............: 16/07/2024

Exemplos de Uso:
EXEC [dbo].[ListarTodosTelefones] @IdUsuario = 123 -- Para listar telefones de um usuário específico
EXEC [dbo].[ListarTodosTelefones] -- Para listar todos os telefones
*/

BEGIN
    SET NOCOUNT ON;

    -- Se @IdUsuario é NULL, retorna todos os telefones
    -- Caso contrário, retorna apenas os telefones do usuário específico
    SELECT IdTelefone, Telefone, Tipo
    FROM Telefones
    WHERE @IdUsuario IS NULL OR IdUsuario = @IdUsuario;
END
GO
