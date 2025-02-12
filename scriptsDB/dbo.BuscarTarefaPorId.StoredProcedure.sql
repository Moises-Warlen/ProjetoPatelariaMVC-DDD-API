USE [Pastelaria]
GO
/****** Object:  StoredProcedure [dbo].[BuscarTarefaPorId]    Script Date: 09/09/2024 21:10:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create   PROCEDURE [dbo].[BuscarTarefaPorId]
    @IdTarefa INT
AS
/*
Documentação
Arquivo Fonte.....: BuscarTarefaPorId.sql
Objetivo..........: Selecionar uma tarefa completa, incluindo o email do criador da tarefa
Autor.............: Moises
Data..............: 06/09/2024
Ex................: EXEC [dbo].[BuscarTarefaPorId] @IdTarefa = 1
*/
BEGIN
    SET NOCOUNT ON;

    SELECT 
        T.IdTarefa, 
        T.IdUsuario, 
        T.Descricao, 
        T.DataAtribuicao, 
        T.DataConclusao, 
        T.CriadorId,
        U.Email AS CriadorEmail
    FROM Tarefas T
    INNER JOIN Usuarios U ON T.CriadorId = U.IdUsuario
    WHERE T.IdTarefa = @IdTarefa;
END
GO
