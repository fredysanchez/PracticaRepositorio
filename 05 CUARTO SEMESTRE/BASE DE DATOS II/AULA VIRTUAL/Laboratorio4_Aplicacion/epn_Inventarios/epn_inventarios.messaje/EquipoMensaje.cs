using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace epn_inventarios.messaje
{
    public class EquipoMensaje
    {
        public int Id { get; set; }
        public int IdEstado { get; set; }
        public int IdProveedor { get; set; }
        public int IdTipoEquipo { get; set; }
        public string Marca { get; set; }
        public string Modelo { get; set; }
        public DateTime FechaCompra { get; set; }
        public decimal ValorCompra { get; set; }

        public EquipoMensaje(){}

        public EquipoMensaje(
            int id, 
            int idestado, 
            int idProveedor,
            int idTipoEquipo,
            string marca,
            string modelo,
            DateTime fechaCompra,
            decimal valorCompra 
            )
            {
                this.Id = id;
                this.IdEstado = idestado;
                this.IdProveedor = idProveedor;
                this.IdTipoEquipo = idTipoEquipo;
                this.Marca = marca;
                this.Modelo = modelo;
                this.FechaCompra = fechaCompra;
                this.ValorCompra = valorCompra;
            }
    }
}
