using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Entity;

using epn_inventarios.core;
using epn_inventarios.messaje;


namespace epn_inventarios.bussines
{
    public class estadobusiness
    {
        internal static List<ItemCombo> GetList()
        {
            var ms = new List<ItemCombo>();
            using (var ctx = new csEpnInventario())
            {
                var ListEstado = ctx.ESTADO_EQUIPO;
                if (ListEstado != null)
                {
                    ListEstado.ToList().ForEach(estado =>{
                        ms.Add(new ItemCombo(estado.id, estado.nombre));
                    });
                }
                return ms;
            }
        }
    }
}
