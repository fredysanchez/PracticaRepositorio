using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace epn.inventarios.message
{
    public class EquipoMsg
    {
        public int Id { get; set; }
        public int IdEstado { get; set; }
        public int IdProveedor { get; set; }
        public int IdTipoEquipo { get; set; }
        public string Marca { get; set; }
        public string Modelo { get; set; }
        public DateTime FechaCompra { get; set; }
        public decimal ValorCompra { get; set; }
        public string CodigoActivo {
            get {
                return GetCodigoActivo();
            }
        }

        private string GetCodigoActivo()
        {
            return string.Format("epn.act.{0}",this.Id);
        }
        public List<ComponenteMsg> ListaComponentes { get; set; }
        public List<MantenimientoMSg> ListaMantenimientos { get; set; }

        public EquipoMsg() { }
        public EquipoMsg(
            int id,
            int idEstado,
            int idProveedor,
            int idTipoEquipo,
            string marca,
            string modelo,
            DateTime fechaCompra,
            decimal valorCompra,
            List<ComponenteMsg> listaComponentes,
            List<MantenimientoMSg> listaMantenimientos
            ) {
                this.Id = id;
                this.IdEstado = idEstado;
                this.IdProveedor = idProveedor;
                this.IdTipoEquipo = idTipoEquipo;
                this.Marca = marca;
                this.Modelo = modelo;
                this.FechaCompra = fechaCompra;
                this.ValorCompra = valorCompra;
                this.ListaComponentes = listaComponentes;
                this.ListaMantenimientos = listaMantenimientos;
        }

        public string Error { get; set; }
    }
}
