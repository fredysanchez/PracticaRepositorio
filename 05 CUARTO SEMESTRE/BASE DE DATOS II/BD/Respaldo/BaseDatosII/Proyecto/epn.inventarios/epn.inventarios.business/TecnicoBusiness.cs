using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using epn.inventarios.core;
using epn.inventarios.message;

namespace epn.inventarios.business
{
    public class TecnicoBusiness
    {
        internal static List<message.ItemCombo> GetList()
        {
            var ms = new List<ItemCombo>();
            using (var ctx = new csEpnInventario())
            {
                var listTecnico = ctx.TECNICO;
                if (listTecnico != null)
                {
                    listTecnico.ToList().ForEach(item =>
                    {
                        ms.Add(new ItemCombo(item.id, string.Format(" {0} {1}", item.nombre, item.apellido)));
                    });
                }
                return ms;
            }
        }
    }
}
