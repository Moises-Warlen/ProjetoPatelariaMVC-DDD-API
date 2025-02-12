USE [Pastelaria]
GO
/****** Object:  StoredProcedure [dbo].[BuscarLogin]    Script Date: 09/09/2024 21:10:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BuscarLogin]
    @Email VARCHAR(256),
    @Senha VARCHAR(256)
AS
BEGIN
    -- Evita a contagem de linhas afetadas (para melhorar a performance e evitar mensagens desnecessárias)
    SET NOCOUNT ON;

    -- Seleciona o primeiro usuário que corresponde ao e-mail e senha fornecidos
    SELECT TOP 1
        u.IdUsuario,  -- Identificador do usuário
        u.Email,      -- E-mail do usuário
        u.Senha,      -- Senha do usuário (normalmente, a senha deveria ser armazenada de forma segura, como um hash)
        u.Nome,       -- Nome do usuário
        u.IdPerfil    -- Perfil do usuário
    FROM 
        Usuarios u
    WHERE 
        u.Email = @Email
        AND u.Senha = @Senha;  -- Verifica a senha
END
GO
