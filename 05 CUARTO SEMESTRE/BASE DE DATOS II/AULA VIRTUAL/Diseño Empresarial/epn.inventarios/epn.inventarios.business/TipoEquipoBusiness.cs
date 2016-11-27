using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using epn.inventarios.core;
using epn.inventarios.message;

namespace epn.inventarios.business
{
    public class TipoEquipoBusiness
    {
        internal static List<ItemCombo> GetList()
        {
            var ms = new List<ItemCombo>();
            using (var ctx = new csEpnInventario())
            {
                var listEstado = ctx.TIPO_EQUIPO;
                if (listEstado != null)
                {
                    listEstado.ToList().ForEach(item =>
                    {
                        ms.Add(new ItemCombo(item.id, item.nombre));
                    });
                }
                return ms;
            }
        }
    }
}
