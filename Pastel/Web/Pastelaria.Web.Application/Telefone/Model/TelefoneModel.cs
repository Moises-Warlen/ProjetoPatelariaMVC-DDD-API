using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pastelaria.Web.Application.Telefone.Model
{
   public class TelefoneModel
    {
        public int IdTelefone { get; set; }
        public string Telefone { get; set; }
        public string Tipo { get; set; }
        public int IdUsuario { get; set; }
    }
}
