USE [Pastelaria]
GO
/****** Object:  StoredProcedure [dbo].[AdicionarTarefa]    Script Date: 09/09/2024 21:10:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AdicionarTarefa]
    @IdUsuario INT,
    @Descricao VARCHAR(100),
    @CriadorId INT
AS

/*
Documentação
Arquivo Fonte.....: AdicionarTarefa.sql
Objetivo..........: Inserir uma nova tarefa na tabela Tarefas com DataAtribuicao automática
Autor.............: Moises
Data..............: 04/09/2024
Ex................: EXEC [dbo].[AdicionarTarefa] 
                        @IdUsuario = 1,
                        @Descricao = 'Nova tarefa',
                        @CriadorId = 1
*/
BEGIN
    SET NOCOUNT ON;

    -- DataAtribuicao será a data e hora atuais
    DECLARE @DataAtribuicao DATETIME = GETDATE(); 

    INSERT INTO Tarefas (IdUsuario, Descricao, DataAtribuicao, CriadorId, Ind_Ativo)
    VALUES (@IdUsuario, @Descricao, @DataAtribuicao, @CriadorId, 1); -- Assume-se Ind_Ativo como verdadeiro (1)

    SELECT SCOPE_IDENTITY() AS IdTarefa; -- Retorna o ID da tarefa inserida
END
GO
