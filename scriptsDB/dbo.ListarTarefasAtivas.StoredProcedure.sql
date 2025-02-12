USE [Pastelaria]
GO
/****** Object:  StoredProcedure [dbo].[ListarTarefasAtivas]    Script Date: 09/09/2024 21:10:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ListarTarefasAtivas]
AS
/*
Documentação
Arquivo Fonte.....: ListarTarefasAtivas.sql
Objetivo..........: Selecionar as primeiras 40 tarefas ativas da tabela Tarefas
Autor.............: Moises
Data..............: 04/07/2024
Ex................: EXEC [dbo].[ListarTarefasAtivas]
*/
BEGIN
    SET NOCOUNT ON;

    SELECT TOP 40 IdTarefa, IdUsuario, Descricao, DataAtribuicao, DataConclusao, CriadorId
    FROM Tarefas
    WHERE Ind_Ativo = 1
    ORDER BY DataAtribuicao DESC; -- Exemplo de ordenação, se desejado

    -- Não é necessário retornar o SCOPE_IDENTITY() aqui, pois estamos apenas fazendo uma consulta.
END
GO
