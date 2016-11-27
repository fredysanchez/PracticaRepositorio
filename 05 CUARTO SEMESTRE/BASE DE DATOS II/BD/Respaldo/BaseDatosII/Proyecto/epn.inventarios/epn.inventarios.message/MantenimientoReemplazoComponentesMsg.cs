using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace epn.inventarios.message
{
    public class MantenimientoReemplazoComponentesMsg
    {
        public int IdMantenimiento { get; set; }
        public int IdComponenteReeplazado { get; set; }
        public string Observaciones { get; set; }
    }
}
