USE [Pastelaria]
GO
/****** Object:  Table [dbo].[Enderecos]    Script Date: 09/09/2024 21:21:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enderecos](
	[IdEndereco] [int] IDENTITY(1,1) NOT NULL,
	[Cep] [varchar](10) NULL,
	[Cidade] [varchar](100) NULL,
	[Bairro] [varchar](20) NULL,
	[Rua] [varchar](100) NULL,
	[Numero] [int] NULL,
	[Complemento] [varchar](100) NULL,
	[IdUsuario] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEndereco] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Perfis]    Script Date: 09/09/2024 21:21:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Perfis](
	[IdPerfil] [int] IDENTITY(1,1) NOT NULL,
	[Tipo] [varchar](14) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPerfil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tarefas]    Script Date: 09/09/2024 21:21:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tarefas](
	[IdTarefa] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[Descricao] [varchar](500) NULL,
	[DataAtribuicao] [datetime] NULL,
	[DataConclusao] [datetime] NULL,
	[CriadorId] [int] NULL,
	[Ind_Ativo] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdTarefa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Telefones]    Script Date: 09/09/2024 21:21:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Telefones](
	[IdTelefone] [int] IDENTITY(1,1) NOT NULL,
	[Telefone] [varchar](20) NULL,
	[Tipo] [varchar](50) NULL,
	[IdUsuario] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdTelefone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 09/09/2024 21:21:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](100) NULL,
	[Email] [varchar](100) NULL,
	[Senha] [varchar](50) NULL,
	[DataNascimento] [datetime] NULL,
	[IdGestor] [int] NULL,
	[IdPerfil] [int] NOT NULL,
	[Ind_Ativo] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Tarefas] ADD  DEFAULT ((1)) FOR [Ind_Ativo]
GO
ALTER TABLE [dbo].[Usuarios] ADD  DEFAULT ((1)) FOR [Ind_Ativo]
GO
ALTER TABLE [dbo].[Enderecos]  WITH CHECK ADD  CONSTRAINT [fk_Endereco_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuarios] ([IdUsuario])
GO
ALTER TABLE [dbo].[Enderecos] CHECK CONSTRAINT [fk_Endereco_Usuario]
GO
ALTER TABLE [dbo].[Tarefas]  WITH CHECK ADD  CONSTRAINT [fk_Tarefa_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuarios] ([IdUsuario])
GO
ALTER TABLE [dbo].[Tarefas] CHECK CONSTRAINT [fk_Tarefa_Usuario]
GO
ALTER TABLE [dbo].[Telefones]  WITH CHECK ADD  CONSTRAINT [fk_Telefones_Usuarios] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuarios] ([IdUsuario])
GO
ALTER TABLE [dbo].[Telefones] CHECK CONSTRAINT [fk_Telefones_Usuarios]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [fk_Usuario_Perfil] FOREIGN KEY([IdPerfil])
REFERENCES [dbo].[Perfis] ([IdPerfil])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [fk_Usuario_Perfil]
GO
/****** Object:  StoredProcedure [dbo].[AdicionarEnderecoUsuario]    Script Date: 09/09/2024 21:21:54 ******/
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
/****** Object:  StoredProcedure [dbo].[AdicionarTarefa]    Script Date: 09/09/2024 21:21:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AdicionarTarefa]
    @IdUsuario INT,
    @Descricao VARCHAR(100),
    @CriadorId INT
AS

/*
Documentação
Arquivo Fonte.....: AdicionarTarefa.sql
Objetivo..........: Inserir uma nova tarefa na tabela Tarefas com DataAtribuicao automática
Autor.............: Moises
Data..............: 04/09/2024
Ex................: EXEC [dbo].[AdicionarTarefa] 
                        @IdUsuario = 1,
                        @Descricao = 'Nova tarefa',
                        @CriadorId = 1
*/
BEGIN
    SET NOCOUNT ON;

    -- DataAtribuicao será a data e hora atuais
    DECLARE @DataAtribuicao DATETIME = GETDATE(); 

    INSERT INTO Tarefas (IdUsuario, Descricao, DataAtribuicao, CriadorId, Ind_Ativo)
    VALUES (@IdUsuario, @Descricao, @DataAtribuicao, @CriadorId, 1); -- Assume-se Ind_Ativo como verdadeiro (1)

    SELECT SCOPE_IDENTITY() AS IdTarefa; -- Retorna o ID da tarefa inserida
END
GO
/****** Object:  StoredProcedure [dbo].[AdicionarTelefoneUsuario]    Script Date: 09/09/2024 21:21:54 ******/
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
/****** Object:  StoredProcedure [dbo].[AdicionarUsuario]    Script Date: 09/09/2024 21:21:54 ******/
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
/****** Object:  StoredProcedure [dbo].[AtualizarConcluirTarefa]    Script Date: 09/09/2024 21:21:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AtualizarConcluirTarefa]
    @IdTarefa INT,
    @Descricao VARCHAR(100) = NULL,
    @DataConclusao VARCHAR(20) = NULL,  -- Alterado para VARCHAR para permitir validação
    @Ind_Ativo BIT = NULL
AS
/*
Documentação
Arquivo Fonte.....: AtualizarConcluirTarefa.sql
Objetivo..........: Atualizar ou concluir uma tarefa na tabela Tarefas
Autor.............: Moises
Data..............: 04/07/2024
Ex................: EXEC [dbo].[AtualizarConcluirTarefa] 
                        @IdTarefa = 1,
                        @Descricao = 'Tarefa atualizada',
                        @DataConclusao = '2024-07-15',
                        @Ind_Ativo = 0
*/
BEGIN
    SET NOCOUNT ON;

    -- Validação e conversão de @DataConclusao para DATETIME
    DECLARE @DataConclusaoDT DATETIME;
    
    -- Tenta converter a string para DATETIME
    BEGIN TRY
        SET @DataConclusaoDT = CAST(@DataConclusao AS DATETIME);
    END TRY
    BEGIN CATCH
        -- Retorna mensagem de erro se a conversão falhar
        SELECT 'Formato de data inválido para @DataConclusao.' AS Mensagem;
        RETURN;
    END CATCH

    -- Verificar se a tarefa existe na tabela Tarefas
    IF EXISTS (SELECT 1 FROM Tarefas WHERE IdTarefa = @IdTarefa)
    BEGIN
        -- Atualizar os campos da tarefa com base nos parâmetros fornecidos
        UPDATE Tarefas
        SET Descricao = CASE 
                            WHEN @Descricao IS NOT NULL THEN @Descricao
                            ELSE Descricao 
                         END,
            DataConclusao = CASE 
                                WHEN @DataConclusao IS NOT NULL THEN @DataConclusaoDT
                                ELSE DataConclusao 
                             END,
            Ind_Ativo = CASE 
                            WHEN @Ind_Ativo IS NOT NULL THEN @Ind_Ativo
                            ELSE Ind_Ativo 
                         END
        WHERE IdTarefa = @IdTarefa;

        -- Retornar mensagem de sucesso
        SELECT 'Tarefa atualizada com sucesso.' AS Mensagem;
    END
    ELSE
    BEGIN
        -- Retornar mensagem de erro se a tarefa não for encontrada
        SELECT 'Tarefa não encontrada.' AS Mensagem;
    END
END




GO
/****** Object:  StoredProcedure [dbo].[AtualizarUsuario]    Script Date: 09/09/2024 21:21:54 ******/
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
/****** Object:  StoredProcedure [dbo].[BuscarLogin]    Script Date: 09/09/2024 21:21:54 ******/
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
/****** Object:  StoredProcedure [dbo].[BuscarTarefaPorId]    Script Date: 09/09/2024 21:21:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create   PROCEDURE [dbo].[BuscarTarefaPorId]
    @IdTarefa INT
AS
/*
Documentação
Arquivo Fonte.....: BuscarTarefaPorId.sql
Objetivo..........: Selecionar uma tarefa completa, incluindo o email do criador da tarefa
Autor.............: Moises
Data..............: 06/09/2024
Ex................: EXEC [dbo].[BuscarTarefaPorId] @IdTarefa = 1
*/
BEGIN
    SET NOCOUNT ON;

    SELECT 
        T.IdTarefa, 
        T.IdUsuario, 
        T.Descricao, 
        T.DataAtribuicao, 
        T.DataConclusao, 
        T.CriadorId,
        U.Email AS CriadorEmail
    FROM Tarefas T
    INNER JOIN Usuarios U ON T.CriadorId = U.IdUsuario
    WHERE T.IdTarefa = @IdTarefa;
END
GO
/****** Object:  StoredProcedure [dbo].[ConcluirTarefaUsuario]    Script Date: 09/09/2024 21:21:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConcluirTarefaUsuario]
    @IdTarefa INT
AS
/*
Documentação
Arquivo Fonte.....: ConcluirTarefaUsuario.sql
Objetivo..........: Desativar uma tarefa específica e definir a DataConclusao como o momento atual com base no IdTarefa, 
                    e retornar o email do criador da tarefa.
Autor.............: [Seu Nome]
Data..............: [05/09/2024]

EXEC [dbo].[ConcluirTarefaUsuario] @IdTarefa = 1 -- Exemplo de execução
*/

BEGIN
    SET NOCOUNT ON;

    -- Atualiza a tarefa específica, desativando-a e definindo a DataConclusao como a data e hora atual
    UPDATE Tarefas
    SET Ind_Ativo = 0,
        DataConclusao = GETDATE()
    WHERE IdTarefa = @IdTarefa;

    -- Seleciona o email do criador da tarefa
    SELECT u.Email
    FROM Tarefas t
    JOIN Usuarios u ON t.CriadorId = u.IdUsuario
    WHERE t.IdTarefa = @IdTarefa;
END
GO
/****** Object:  StoredProcedure [dbo].[DeletarEndereco]    Script Date: 09/09/2024 21:21:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE     PROCEDURE [dbo].[DeletarEndereco]
    @IdEndereco INT
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
    DELETE FROM Enderecos
        WHERE IdEndereco = @IdEndereco;

END

GO
/****** Object:  StoredProcedure [dbo].[DeletarEnderecoUsuario]    Script Date: 09/09/2024 21:21:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[DeletarEnderecoUsuario]
    @IdUsuario INT
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
    DELETE FROM Enderecos
        WHERE IdUsuario = @IdUsuario;

END

GO
/****** Object:  StoredProcedure [dbo].[DeletarTarefa]    Script Date: 09/09/2024 21:21:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[DeletarTarefa]
    @IdTarefa INT
AS
/*
Documentação
Arquivo Fonte.....: DeletarTarefa.sql
Objetivo..........: Deletar uma tarefa da tabela Tarefas com base no IdTarefa
Autor.............: [Seu Nome]
Data..............: [04/09/2024]
Ex................: EXEC [dbo].[DeletarTarefa]
                        @IdTarefa = 10
*/

BEGIN
    -- Verifica se a tarefa existe antes de tentar deletar
    DELETE FROM Tarefas
    WHERE IdTarefa = @IdTarefa;

    -- Adicione qualquer lógica adicional se necessário
END
GO
/****** Object:  StoredProcedure [dbo].[DeletarTelefone]    Script Date: 09/09/2024 21:21:54 ******/
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
/****** Object:  StoredProcedure [dbo].[DeletarTelefoneUsuario]    Script Date: 09/09/2024 21:21:54 ******/
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
/****** Object:  StoredProcedure [dbo].[DesativarUsuarioAssociados]    Script Date: 09/09/2024 21:21:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[DesativarUsuarioAssociados]
    @IdUsuario INT
AS
/*
Documentação
Arquivo Fonte.....: DesativarUsuarioAssociados.sql
Objetivo..........: Desativar usuário e suas informações associadas (endereço, telefones, tarefas)
Autor.............: [Moises]
Data..............: [04/07/2024]

EXEC [dbo].[DesativarUsuarioAssociados] @IdUsuario = 1 -- Exemplo de execução
*/

BEGIN
    SET NOCOUNT ON;

    -- Desativa o usuário
    UPDATE Usuarios
    SET Ind_Ativo = 0
    WHERE IdUsuario = @IdUsuario;
  
    -- Desativa tarefas associadas ao usuário
    UPDATE Tarefas
    SET Ind_Ativo = 0
    WHERE IdUsuario = @IdUsuario;
END

GO
/****** Object:  StoredProcedure [dbo].[ListarEnderecos]    Script Date: 09/09/2024 21:21:54 ******/
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
/****** Object:  StoredProcedure [dbo].[ListarGestores]    Script Date: 09/09/2024 21:21:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ListarGestores]
AS
/*
Documentação:
Arquivo Fonte.....: [ListarGestores]sql
Objetivo..........: Listar todos os gestores da tabela Usuarios .
Autor.............: [Seu Nome]
Data..............: [Data Atual]

Exemplo de Uso:
EXEC [dbo].[ListarGestores] -- Para listar todos os gestores
*/

BEGIN
    SET NOCOUNT ON;

    -- Retorna todos os todos os gestores
    SELECT IdUsuario, Nome, Email 
    FROM Usuarios
    WHERE IdPerfil = 1 and Ind_Ativo=1;
END
GO
/****** Object:  StoredProcedure [dbo].[ListarTarefasAtivas]    Script Date: 09/09/2024 21:21:54 ******/
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
/****** Object:  StoredProcedure [dbo].[ListarTodosPerfil]    Script Date: 09/09/2024 21:21:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   PROCEDURE [dbo].[ListarTodosPerfil]
AS
/*
Documentação:
Arquivo Fonte.....: ListarTodosPerfil.sql
Objetivo..........: Listar todos os perfis disponíveis na tabela Perfis.
Autor.............: Moises
Data..............: 02/08/2024

Exemplo de Uso:
EXEC [dbo].[ListarTodosPerfil] -- Para listar todos os perfis
*/

BEGIN
    SET NOCOUNT ON;

    -- Retorna todos os perfis da tabela Perfis
    SELECT IdPerfil, Tipo
    FROM Perfis;
END
GO
/****** Object:  StoredProcedure [dbo].[ListarTodosTelefones]    Script Date: 09/09/2024 21:21:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   PROCEDURE [dbo].[ListarTodosTelefones]
    @IdUsuario INT = NULL  -- Parâmetro opcional
AS
/*
Documentação:
Arquivo Fonte.....: ListarTodosTelefones.sql
Objetivo..........: Listar todos os telefones ou os telefones de um usuário específico, se um ID for fornecido.
Autor.............: Moises
Data..............: 16/07/2024

Exemplos de Uso:
EXEC [dbo].[ListarTodosTelefones] @IdUsuario = 123 -- Para listar telefones de um usuário específico
EXEC [dbo].[ListarTodosTelefones] -- Para listar todos os telefones
*/

BEGIN
    SET NOCOUNT ON;

    -- Se @IdUsuario é NULL, retorna todos os telefones
    -- Caso contrário, retorna apenas os telefones do usuário específico
    SELECT IdTelefone, Telefone, Tipo
    FROM Telefones
    WHERE @IdUsuario IS NULL OR IdUsuario = @IdUsuario;
END
GO
/****** Object:  StoredProcedure [dbo].[ListarUsuariosAtivos]    Script Date: 09/09/2024 21:21:54 ******/
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
