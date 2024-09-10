using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pastelaria.Web.Application.Login.Model
{
  public  class LoginModel
    {

        [Required(ErrorMessage = " digite seu email")]

        public string Login { get; set; }

        [Required(ErrorMessage = " digite sua senha")]
        public string Senha { get; set; }


    }
}
