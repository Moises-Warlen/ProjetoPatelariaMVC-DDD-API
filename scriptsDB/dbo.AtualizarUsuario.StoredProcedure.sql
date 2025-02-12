USE [Pastelaria]
GO
/****** Object:  StoredProcedure [dbo].[AtualizarUsuario]    Script Date: 09/09/2024 21:10:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[AtualizarUsuario]
    @IdUsuario INT,
    @Nome VARCHAR(100),
    @Email VARCHAR(100),
    @Senha VARCHAR(50),
    @DataNascimento DATE,
    @Ind_Ativo BIT,
    @IdPerfil INT,
    @IdGestor INT
AS
/*
Documentação
Arquivo Fonte.....: AtualizarUsuario.sql
Objetivo..........: Atualizar informações de um usuário na tabela Usuarios
Autor.............: [Moises]
Data..............: [04/07/2024]
Ex................: EXEC [dbo].[AtualizarUsuario] 
                        @IdUsuario = 1,
                        @Nome = 'Novo Nome',
                        @Email = 'novo.email@example.com',
                        @Senha = 'novasenha456',
                        @DataNascimento = '1990-01-01',
                        @Ind_Ativo = 1,
                        @IdPerfil = 2,
                        @IdGestor = NULL -- ou o ID do novo gestor, se aplicável
*/

BEGIN
    UPDATE Usuarios
    SET Nome = @Nome,
        Email = @Email,
        Senha = @Senha,
        DataNascimento = @DataNascimento,
        Ind_Ativo = @Ind_Ativo,
        IdPerfil = @IdPerfil,
        IdGestor = @IdGestor
    WHERE IdUsuario = @IdUsuario
END
GO
