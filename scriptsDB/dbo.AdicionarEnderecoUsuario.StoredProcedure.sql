USE [Pastelaria]
GO
/****** Object:  StoredProcedure [dbo].[AdicionarEnderecoUsuario]    Script Date: 09/09/2024 21:10:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[AdicionarEnderecoUsuario]
    @Cep VARCHAR(10),
    @Cidade VARCHAR(100),
    @Bairro VARCHAR(100),
    @Rua VARCHAR(100),
    @Numero INT,
    @Complemento VARCHAR(100),
    @IdUsuario INT

AS
/*
Documentação
Arquivo Fonte.....: AdicionarEnderecoUsuario.sql
Objetivo..........: Inserir um novo endereço de usuário na tabela EnderecosUsuarios
Autor.............: [Seu Nome]
Data..............: [Data Atual]
Ex................: EXEC [dbo].[AdicionarEnderecoUsuario]
                        @Cep = '12345-678',
                        @Cidade = 'São Paulo',
                        @Bairro = 'Centro',
                        @Rua = 'Rua Principal',
                        @Numero = 100,
                        @Complemento = 'Ap 101',
                        @IdUsuario = 1,
                    
*/

BEGIN
    INSERT INTO Enderecos (Cep, Cidade, Bairro, Rua, Numero, Complemento, IdUsuario)
    VALUES (@Cep, @Cidade, @Bairro, @Rua, @Numero, @Complemento, @IdUsuario)
END
GO
