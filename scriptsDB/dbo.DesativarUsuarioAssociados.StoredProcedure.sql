USE [Pastelaria]
GO
/****** Object:  StoredProcedure [dbo].[DesativarUsuarioAssociados]    Script Date: 09/09/2024 21:10:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[DesativarUsuarioAssociados]
    @IdUsuario INT
AS
/*
Documentação
Arquivo Fonte.....: DesativarUsuarioAssociados.sql
Objetivo..........: Desativar usuário e suas informações associadas (endereço, telefones, tarefas)
Autor.............: [Moises]
Data..............: [04/07/2024]

EXEC [dbo].[DesativarUsuarioAssociados] @IdUsuario = 1 -- Exemplo de execução
*/

BEGIN
    SET NOCOUNT ON;

    -- Desativa o usuário
    UPDATE Usuarios
    SET Ind_Ativo = 0
    WHERE IdUsuario = @IdUsuario;
  
    -- Desativa tarefas associadas ao usuário
    UPDATE Tarefas
    SET Ind_Ativo = 0
    WHERE IdUsuario = @IdUsuario;
END

GO
