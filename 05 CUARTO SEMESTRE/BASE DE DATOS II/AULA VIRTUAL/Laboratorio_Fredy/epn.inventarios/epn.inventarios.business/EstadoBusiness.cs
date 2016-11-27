using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using epn.inventarios.core;
using epn.inventarios.message;
using System.Data.Entity;

namespace epn.inventarios.business
{
    public class EstadoBusiness
    {
        internal static List<ItemCombo> GetList()
        {
            var ms = new List<ItemCombo>();
            using (var ctx = new csEpnInventario()) {
                var listEstado = ctx.ESTADO_EQUIPO;
                if (listEstado != null) {
                    listEstado.ToList().ForEach(estado => {
                        ms.Add(new ItemCombo(estado.id, estado.nombre));
                    });
                }
                return ms;
            }
        }
    }
}
