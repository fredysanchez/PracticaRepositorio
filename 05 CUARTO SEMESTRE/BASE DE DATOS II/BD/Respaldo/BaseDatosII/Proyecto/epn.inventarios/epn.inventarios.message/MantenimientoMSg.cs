using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace epn.inventarios.message
{
    public class MantenimientoMSg
    {
        public int Id { get; set; }
        public int IdTipoMantenimiento { get; set; }
        public int IdEquipo { get; set; }
        public int IdTecnico { get; set; }
        public string TipoMantenimiento { get; set; }
        public string Tecnico { get; set; }
        public DateTime FechaMantenimiento { get; set; }
        public MantenimientoReemplazoComponentesMsg MantenimientoReemplazoComponentes { get; set; }

        public MantenimientoMSg(string tecnico, string tipoMantenimiento, DateTime fechamantenimiento)
        {
            this.Tecnico = tecnico;
            this.TipoMantenimiento = tipoMantenimiento;
            this.FechaMantenimiento = fechamantenimiento;       
         }
        public MantenimientoMSg() { }
    }
}
