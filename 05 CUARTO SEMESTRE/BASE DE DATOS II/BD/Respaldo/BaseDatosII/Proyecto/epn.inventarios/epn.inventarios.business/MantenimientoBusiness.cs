using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using epn.inventarios.core;
using epn.inventarios.message;
using System.Data.Entity;


namespace epn.inventarios.business
{
    public class MantenimientoBusiness
    {
        internal static MantenimientoMSg Save(csEpnInventario ctx, MantenimientoMSg mes)
        {
            mes = (mes.Id == 0) ? New(ctx, mes) : Update(ctx, mes);
            return mes;
        }

        private static MantenimientoMSg Update(csEpnInventario ctx, MantenimientoMSg mes)
        {
            var componente = ctx.MANTENIMIENTO.FirstOrDefault(p => p.id == mes.Id);
            Traductor(ref componente, mes);
            ctx.MANTENIMIENTO.Attach(componente);

            return null;
        }

        private static MantenimientoMSg New(csEpnInventario ctx, MantenimientoMSg mes)
        {
            var componente = new MANTENIMIENTO();
            Traductor(ref componente, mes);
            ctx.MANTENIMIENTO.AddObject(componente);
            ctx.SaveChanges();
            mes.Id = componente.id;
            return mes;
        }

        private static void Traductor(ref MANTENIMIENTO ms, MantenimientoMSg me)
        {
            ms.id = me.Id;
            ms.idEquipo = me.IdEquipo;
            ms.idTecnico= me.IdTecnico;
            ms.idTipoMantenimiento = me.IdTipoMantenimiento;
            ms.fechaMantenimiento = me.FechaMantenimiento;
        }

        internal static List<MantenimientoMSg> GetListByIdEquipo(int IdEquipo)
        {

            using (var ctx = new csEpnInventario())
            {
                var ms = new List<MantenimientoMSg>();
                var listaMantenimiento = ctx.MANTENIMIENTO
                    .Include(p => p.MANTENIMIENTO_REEPLAZO_COMPONENTES)
                    .Where(p => p.idEquipo == IdEquipo);
                if (listaMantenimiento != null)
                {
                    listaMantenimiento.ToList().ForEach(mantenimiento =>
                    {
                        ms.Add(new MantenimientoMSg(mantenimiento.TECNICO.nombre, mantenimiento.TIPO_MANTENIMIENTO.nombre,mantenimiento.fechaMantenimiento));
                    });
                }
                return ms;
            }
        }
    }
}
