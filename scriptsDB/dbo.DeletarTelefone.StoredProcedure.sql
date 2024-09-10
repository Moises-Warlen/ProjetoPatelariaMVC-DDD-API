USE [Pastelaria]
GO
/****** Object:  StoredProcedure [dbo].[DeletarTelefone]    Script Date: 09/09/2024 21:10:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE     PROCEDURE [dbo].[DeletarTelefone]
    @IdTelefone INT
AS
/*
Documentação
Arquivo Fonte.....: DeletarEnderecoUsuario.sql
Objetivo..........: Deletar um endereço da tabela Enderecos com base no IdEndereco
Autor.............: [Seu Nome]
Data..............: [06/08/2024]
Ex................: EXEC [dbo].[DeletarEnderecoUsuario]
                        @IdEndereco = 10
*/

BEGIN
    -- Verifica se o telefone existe antes de tentar deletar
    DELETE FROM Telefones
        WHERE IdTelefone = @IdTelefone;

END

GO
