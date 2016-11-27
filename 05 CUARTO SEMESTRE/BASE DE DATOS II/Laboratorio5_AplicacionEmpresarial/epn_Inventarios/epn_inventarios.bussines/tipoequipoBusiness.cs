using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using epn_inventarios.core;
using epn_inventarios.messaje;

namespace epn_inventarios.bussines
{
    public class tipoequipoBusiness
    {


        internal static List<messaje.ItemCombo> GetList()
        {
            var ms = new List<ItemCombo>();
            using (var ctx = new csEpnInventario())
            {
                var ListEstado = ctx.TIPO_EQUIPO;
                if (ListEstado != null)
                {
                    ListEstado.ToList().ForEach(Item =>
                    {
                        ms.Add(new ItemCombo(Item.id, Item.nombre));
                    });
                }
                return ms;
            }
        }
    }
}
