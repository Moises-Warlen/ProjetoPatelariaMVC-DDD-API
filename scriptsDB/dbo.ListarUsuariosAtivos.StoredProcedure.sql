USE [Pastelaria]
GO
/****** Object:  StoredProcedure [dbo].[ListarUsuariosAtivos]    Script Date: 09/09/2024 21:10:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ListarUsuariosAtivos]
    @IdUsuario INT = NULL,
    @Nome NVARCHAR(100) = NULL
AS
/*
Documentação
Arquivo Fonte.....: ListarUsuariosAtivos.sql
Objetivo..........: Listar os usuários ativos com filtragem opcional por ID ou nome
Autor.............: Moises
Data..............: 08/07/2024

Exemplos de Uso:
EXEC [dbo].[ListarUsuariosAtivos]
EXEC [dbo].[ListarUsuariosAtivos] @IdUsuario = 123
EXEC [dbo].[ListarUsuariosAtivos] @Nome = 'João'
EXEC [dbo].[ListarUsuariosAtivos] @IdUsuario = 123, @Nome = 'João'
*/

BEGIN
    SET NOCOUNT ON;

    -- Seleciona os usuários ativos com filtragem opcional por ID ou nome
    SELECT
        u.IdUsuario,
        u.Nome,
        u.Email,
        u.DataNascimento,
        u.IdPerfil,
        u.IdGestor,
	    u.Ind_Ativo,
		u.IdUsuario AS IdUsuarioGestor,
		ug.Nome as NomeGestor,
		p.IdPerfil,
		p.Tipo as NomePerfil
    FROM
        dbo.Usuarios u
			INNER JOIN dbo.Usuarios ug
				on ug.IdUsuario = u.IdGestor
			INNER JOIN dbo.Perfis p
				on p.IdPerfil = u.IdPerfil
    WHERE
        u.Ind_Ativo = 1 -- Somente usuários ativos
        AND (@IdUsuario IS NULL OR u.IdUsuario = @IdUsuario)
        AND (@Nome IS NULL OR u.Nome LIKE '%' + @Nome + '%')
    ORDER BY
        u.IdUsuario; -- ou qualquer outro critério desejado
END
GO
