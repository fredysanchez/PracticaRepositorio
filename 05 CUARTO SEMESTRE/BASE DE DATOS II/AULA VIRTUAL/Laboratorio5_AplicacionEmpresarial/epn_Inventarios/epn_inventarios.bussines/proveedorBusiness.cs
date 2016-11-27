using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using epn_inventarios.core;
using epn_inventarios.messaje;

namespace epn_inventarios.bussines
{
    public class proveedorBusiness
    {

        internal static List<messaje.ItemCombo> GetList()
        {
            var ms = new List<ItemCombo>();
            using (var ctx = new csEpnInventario())
            {
                var ListEstado = ctx.PROVEEDOR;
                if (ListEstado != null)
                {
                    ListEstado.ToList().ForEach(Item =>
                    {
                        ms.Add(new ItemCombo(Item.id, string.Format("{0}{1}",Item.nombre,Item.apellido)));
                    });
                }
                return ms;
            }
        }
    }
}
