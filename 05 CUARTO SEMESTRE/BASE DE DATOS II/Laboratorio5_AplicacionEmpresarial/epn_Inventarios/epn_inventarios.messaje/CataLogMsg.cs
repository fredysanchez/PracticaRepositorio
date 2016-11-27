using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace epn_inventarios.messaje
{
    public class CataLogMsg
    {
        public List<ItemCombo> Listestado { get; set; }
        public List<ItemCombo> ListTipoEquipo { get; set; }
        public List<ItemCombo> ListProveedor { get; set; }

        public string error { get; set; }

        public CataLogMsg() { }

        public CataLogMsg(List<ItemCombo> listEstado,List<ItemCombo> listatipoequipo,List<ItemCombo> listaproveedor) {
            this.Listestado = listEstado;
            this.ListTipoEquipo = listatipoequipo;
            this.ListProveedor = listaproveedor;
        }
    }
}
