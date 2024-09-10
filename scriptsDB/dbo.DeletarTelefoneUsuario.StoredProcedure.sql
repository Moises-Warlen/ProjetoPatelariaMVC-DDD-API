USE [Pastelaria]
GO
/****** Object:  StoredProcedure [dbo].[DeletarTelefoneUsuario]    Script Date: 09/09/2024 21:10:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeletarTelefoneUsuario]
    @IdUsuario INT
AS
BEGIN

    DELETE FROM Telefones
        WHERE IdUsuario = @IdUsuario;

END
GO
