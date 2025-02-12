USE [Pastelaria]
GO
/****** Object:  StoredProcedure [dbo].[ListarEnderecos]    Script Date: 09/09/2024 21:10:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ListarEnderecos]
    @IdUsuario INT = NULL  -- Parâmetro opcional
AS
/*
Documentação
Arquivo Fonte.....: ListarEnderecos.sql
Objetivo..........: Listar todos os endereços de usuários, ou filtrar por um usuário específico
Autor.............: [Moises]
Data..............: [26/07/2024]
Ex................: EXEC [dbo].[ListarEnderecos] @IdUsuario = 1
                    EXEC [dbo].[ListarEnderecos]
*/

BEGIN
    -- Verifica se o parâmetro @IdUsuario foi fornecido
    IF @IdUsuario IS NOT NULL
    BEGIN
        -- Retorna endereços do usuário específico
        SELECT IdEndereco,Cep, Cidade, Bairro, Rua, Numero, Complemento,IdUsuario
        FROM Enderecos
        WHERE IdUsuario = @IdUsuario;
    END
   
END
GO
