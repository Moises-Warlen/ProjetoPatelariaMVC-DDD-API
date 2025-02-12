USE [Pastelaria]
GO
/****** Object:  StoredProcedure [dbo].[AtualizarConcluirTarefa]    Script Date: 09/09/2024 21:10:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AtualizarConcluirTarefa]
    @IdTarefa INT,
    @Descricao VARCHAR(100) = NULL,
    @DataConclusao VARCHAR(20) = NULL,  -- Alterado para VARCHAR para permitir validação
    @Ind_Ativo BIT = NULL
AS
/*
Documentação
Arquivo Fonte.....: AtualizarConcluirTarefa.sql
Objetivo..........: Atualizar ou concluir uma tarefa na tabela Tarefas
Autor.............: Moises
Data..............: 04/07/2024
Ex................: EXEC [dbo].[AtualizarConcluirTarefa] 
                        @IdTarefa = 1,
                        @Descricao = 'Tarefa atualizada',
                        @DataConclusao = '2024-07-15',
                        @Ind_Ativo = 0
*/
BEGIN
    SET NOCOUNT ON;

    -- Validação e conversão de @DataConclusao para DATETIME
    DECLARE @DataConclusaoDT DATETIME;
    
    -- Tenta converter a string para DATETIME
    BEGIN TRY
        SET @DataConclusaoDT = CAST(@DataConclusao AS DATETIME);
    END TRY
    BEGIN CATCH
        -- Retorna mensagem de erro se a conversão falhar
        SELECT 'Formato de data inválido para @DataConclusao.' AS Mensagem;
        RETURN;
    END CATCH

    -- Verificar se a tarefa existe na tabela Tarefas
    IF EXISTS (SELECT 1 FROM Tarefas WHERE IdTarefa = @IdTarefa)
    BEGIN
        -- Atualizar os campos da tarefa com base nos parâmetros fornecidos
        UPDATE Tarefas
        SET Descricao = CASE 
                            WHEN @Descricao IS NOT NULL THEN @Descricao
                            ELSE Descricao 
                         END,
            DataConclusao = CASE 
                                WHEN @DataConclusao IS NOT NULL THEN @DataConclusaoDT
                                ELSE DataConclusao 
                             END,
            Ind_Ativo = CASE 
                            WHEN @Ind_Ativo IS NOT NULL THEN @Ind_Ativo
                            ELSE Ind_Ativo 
                         END
        WHERE IdTarefa = @IdTarefa;

        -- Retornar mensagem de sucesso
        SELECT 'Tarefa atualizada com sucesso.' AS Mensagem;
    END
    ELSE
    BEGIN
        -- Retornar mensagem de erro se a tarefa não for encontrada
        SELECT 'Tarefa não encontrada.' AS Mensagem;
    END
END




GO
