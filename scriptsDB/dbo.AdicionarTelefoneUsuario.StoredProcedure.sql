USE [Pastelaria]
GO
/****** Object:  StoredProcedure [dbo].[AdicionarTelefoneUsuario]    Script Date: 09/09/2024 21:10:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[AdicionarTelefoneUsuario]
    @Telefone VARCHAR(20),
    @Tipo VARCHAR(50),
    @IdUsuario INT
   
AS
/*
Documentação
Arquivo Fonte.....: AdicionarTelefoneUsuario.sql
Objetivo..........: Inserir um novo telefone de usuário na tabela TelefonesUsuarios
Autor.............: [Moises]
Data..............: [04/07/2024]
Ex................: EXEC [dbo].[AdicionarTelefoneUsuario]
                        @Telefone = '(11) 98765-4321',
                        @Tipo = 'Celular',
                        @IdUsuario = 1,
                      
*/

BEGIN
    INSERT INTO Telefones (Telefone, Tipo, IdUsuario)
    VALUES (@Telefone, @Tipo, @IdUsuario)
END
GO
