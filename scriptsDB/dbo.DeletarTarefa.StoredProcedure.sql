USE [Pastelaria]
GO
/****** Object:  StoredProcedure [dbo].[DeletarTarefa]    Script Date: 09/09/2024 21:10:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[DeletarTarefa]
    @IdTarefa INT
AS
/*
Documentação
Arquivo Fonte.....: DeletarTarefa.sql
Objetivo..........: Deletar uma tarefa da tabela Tarefas com base no IdTarefa
Autor.............: [Seu Nome]
Data..............: [04/09/2024]
Ex................: EXEC [dbo].[DeletarTarefa]
                        @IdTarefa = 10
*/

BEGIN
    -- Verifica se a tarefa existe antes de tentar deletar
    DELETE FROM Tarefas
    WHERE IdTarefa = @IdTarefa;

    -- Adicione qualquer lógica adicional se necessário
END
GO
