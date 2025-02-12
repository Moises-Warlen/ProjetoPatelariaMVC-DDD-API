USE [Pastelaria]
GO
/****** Object:  StoredProcedure [dbo].[AdicionarUsuario]    Script Date: 09/09/2024 21:10:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE     PROCEDURE [dbo].[AdicionarUsuario]
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
Arquivo Fonte.....: AdicionarUsuario.sql
Objetivo..........: Inserir um novo usuário na tabela Usuarios
Autor.............: [Moises]
Data..............: [04/07/2024]
Ex................: EXEC [dbo].[AdicionarUsuario] 
                        @Nome = 'Novo Usuário',
                        @Email = 'novo.usuario@example.com',
                        @Senha = 'senha123',
                        @DataNascimento = '1990-01-01',
                        @Ind_Ativo = 1,
                        @IdPerfil = 1,
                        @IdGestor = NULL -- ou o ID do gestor, se aplicável
*/

BEGIN
    INSERT INTO Usuarios (Nome, Email, Senha, DataNascimento, Ind_Ativo, IdPerfil, IdGestor)
    VALUES (@Nome, @Email, @Senha, @DataNascimento, @Ind_Ativo, @IdPerfil, @IdGestor)

	RETURN SCOPE_IDENTITY()
END
GO
