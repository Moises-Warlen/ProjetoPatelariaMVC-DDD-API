USE [Pastelaria]
GO
/****** Object:  StoredProcedure [dbo].[ConcluirTarefaUsuario]    Script Date: 09/09/2024 21:10:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConcluirTarefaUsuario]
    @IdTarefa INT
AS
/*
Documentação
Arquivo Fonte.....: ConcluirTarefaUsuario.sql
Objetivo..........: Desativar uma tarefa específica e definir a DataConclusao como o momento atual com base no IdTarefa, 
                    e retornar o email do criador da tarefa.
Autor.............: [Seu Nome]
Data..............: [05/09/2024]

EXEC [dbo].[ConcluirTarefaUsuario] @IdTarefa = 1 -- Exemplo de execução
*/

BEGIN
    SET NOCOUNT ON;

    -- Atualiza a tarefa específica, desativando-a e definindo a DataConclusao como a data e hora atual
    UPDATE Tarefas
    SET Ind_Ativo = 0,
        DataConclusao = GETDATE()
    WHERE IdTarefa = @IdTarefa;

    -- Seleciona o email do criador da tarefa
    SELECT u.Email
    FROM Tarefas t
    JOIN Usuarios u ON t.CriadorId = u.IdUsuario
    WHERE t.IdTarefa = @IdTarefa;
END
GO
