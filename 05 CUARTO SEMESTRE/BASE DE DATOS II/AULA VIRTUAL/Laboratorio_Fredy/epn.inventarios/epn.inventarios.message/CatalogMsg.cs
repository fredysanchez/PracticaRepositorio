using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace epn.inventarios.message
{
    public class CatalogMsg
    {
        public List<ItemCombo> ListEstado { get; set; }
        public List<ItemCombo> ListTipoEquipo { get; set; }
        public List<ItemCombo> ListProveedor { get; set; }
        public List<ItemCombo> ListTipoComponente { get; set; }

        public string Error { get; set; }
        public CatalogMsg() { }
        public CatalogMsg(List<ItemCombo> listEstado, List<ItemCombo> listTipoEquipo, List<ItemCombo> listProveedor, List<ItemCombo> listComponente)
        {
            this.ListEstado = listEstado;
            this.ListTipoEquipo = listTipoEquipo;
            this.ListProveedor = listProveedor;
            this.ListTipoComponente = listComponente;
        }
    }
}
