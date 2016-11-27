using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using epn.inventarios.core;
using epn.inventarios.message;

namespace epn.inventarios.business
{
    public class TipoComponenteBusiness
    {
        internal static List<message.ItemCombo> GetList()
        {
            var ms = new List<ItemCombo>();
            using (var ctx = new csEpnInventario())
            {
                var list = ctx.TIPO_COMPONENTE;
                if (list != null)
                {
                    list.ToList().ForEach(item =>
                    {
                        ms.Add(new ItemCombo(item.id, item.nombre));
                    });
                }
                return ms;
            }
        }
    }
}
