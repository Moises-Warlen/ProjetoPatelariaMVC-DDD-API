
using System;
using System.Collections.Generic;
using Pastelaria.Domain.Perfil.Dto;
using Pastelaria.Web.Application.Endereco.Model;
using Pastelaria.Web.Application.Perfil.Model;
using Pastelaria.Web.Application.Tarefa.Model;
using Pastelaria.Web.Application.Telefone.Model;

namespace Pastelaria.Web.Application.Usuario.Model
{

    public class UsuarioModel 
    {
        public int IdUsuario { get; set; }
        public string Nome { get; set; }
        public string Email { get; set; }
        public string Senha { get; set; }
        public DateTime DataNascimento { get; set; }
        public bool Ind_Ativo { get; set; }

        public PerfilModel Perfil { get; set; }
        public UsuarioModel Gestor { get; set; }
        public IEnumerable<TelefoneModel> Telefones { get; set; }
        public IEnumerable<EnderecoModel> Enderecos { get; set; }
        public List<TarefaModel> Tarefas { get; set; }

    }
}
