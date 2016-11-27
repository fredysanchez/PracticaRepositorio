using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using epn.inventarios.core;
using epn.inventarios.message;
using System.Data.Entity;

namespace epn.inventarios.business
{
    public class ComponentesBusiness
    {

        internal static ComponenteMsg Save(csEpnInventario ctx, ComponenteMsg mes)
        {
            mes = (mes.Id == 0) ? New(ctx, mes) : Update(ctx, mes);
            return mes;
        }

        private static ComponenteMsg Update(csEpnInventario ctx, ComponenteMsg mes)
        {
            var componente = ctx.COMPONENTES.FirstOrDefault(p => p.id == mes.Id);
            Traductor(ref componente, mes);
            ctx.COMPONENTES.Attach(componente);
            
            return null;
        }

        private static ComponenteMsg New(csEpnInventario ctx, ComponenteMsg mes)
        {
            var componente=new COMPONENTES();
            Traductor(ref componente, mes);
            ctx.COMPONENTES.AddObject(componente);
            ctx.SaveChanges();
            mes.Id = componente.id;
            return mes;
        }

        private static void Traductor(ref COMPONENTES ms, ComponenteMsg me)
        {
            ms.id = me.Id;
            ms.idEquipo = me.IdEquipo;
            ms.idTipoComponente = me.IdTipoComponente;
            ms.descripcion = me.Descripcion;
        }

        internal static List<ComponenteMsg> GetListByIdEquipo(int IdEquipo)
        {

            using (var ctx = new csEpnInventario()) { 
                var ms=new List<ComponenteMsg>();
                var listaComponente = ctx.COMPONENTES
                    .Include(p=>p.TIPO_COMPONENTE)
                    .Where(p => p.idEquipo == IdEquipo);
                if (listaComponente != null) {
                    listaComponente.ToList().ForEach(componente => { 
                        ms.Add(new ComponenteMsg(componente.TIPO_COMPONENTE.nombre,componente.descripcion));
                    });
                }
                return ms;
            }
        }
    }
}
