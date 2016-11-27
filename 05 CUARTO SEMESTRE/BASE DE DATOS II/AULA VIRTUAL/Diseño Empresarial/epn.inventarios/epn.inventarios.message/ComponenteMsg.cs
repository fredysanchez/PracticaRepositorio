using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace epn.inventarios.message
{
    public class ComponenteMsg
    {
        public int Id { get; set; }
        public int IdEquipo { get; set; }
        public int IdTipoComponente  { get; set; }
        public string TextoComponente { get; set; }
        public string Descripcion { get; set; }

        public ComponenteMsg() { }
    }
}
