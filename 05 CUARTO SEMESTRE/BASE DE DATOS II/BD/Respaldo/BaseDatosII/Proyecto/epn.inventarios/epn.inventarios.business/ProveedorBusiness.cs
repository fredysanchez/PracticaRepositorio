using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using epn.inventarios.message;
using epn.inventarios.core;

namespace epn.inventarios.business
{
    public class ProveedorBusiness
    {
        internal static List<message.ItemCombo> GetList()
        {
            var ms = new List<ItemCombo>();
            using (var ctx = new csEpnInventario())
            {
                var listEstado = ctx.PROVEEDOR;
                if (listEstado != null)
                {
                    listEstado.ToList().ForEach(item =>
                    {
                        ms.Add(new ItemCombo(item.id, string.Format(" {0} {1}",item.nombre,item.apellido)));
                    });
                }
                return ms;
            }
        }
    }
}
