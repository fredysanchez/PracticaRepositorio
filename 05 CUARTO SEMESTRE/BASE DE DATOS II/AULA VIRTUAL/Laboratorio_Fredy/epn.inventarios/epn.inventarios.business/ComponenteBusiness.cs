using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;


using epn.inventarios.core;
using epn.inventarios.message;
using System.Transactions;

namespace epn.inventarios.business
{
   public class ComponenteBusiness
    {
        public static ComponenteMsg Save(ComponenteMsg me)
        {
            try
            {
                using (var tx = new TransactionScope())
                {
                    using (var ctx = new csEpnInventario())
                    {

                        var equipo = GetComponenteFromMsg(ctx, me);
                         if (me.Id > 0)
                             Update(ctx, equipo);
                         else
                             New(ctx, equipo);
                        ctx.SaveChanges();
                        tx.Complete();//hacer un commit de la transacción
                        me.Id = equipo.id;
                        return me;
                    }
                }
            }
            catch (Exception e)
            {
                var ms = new ComponenteMsg();
                ms.Error = e.Message;
                return ms;
            }
        }

        private static TIPO_COMPONENTE GetComponenteFromMsg(csEpnInventario ctx, ComponenteMsg me)
        {
            var ms =
                (me.Id == 0) ? new TIPO_COMPONENTE() : ctx.TIPO_COMPONENTE.FirstOrDefault(p => p.id == me.Id);

            //ms.id = me.Id;
            ms.nombre = me.Nombre;
            return ms;
        }
       private static void New(csEpnInventario ctx, TIPO_COMPONENTE componente)
        {
            ctx.TIPO_COMPONENTE.AddObject(componente);
        }
        private static void Update(csEpnInventario ctx, TIPO_COMPONENTE componente)
        {
            throw new NotImplementedException();
        }
        public static ComponenteMsg GetById(string id)
        {
            try
            {
                using (var ctx = new csEpnInventario())
                {
                    var idIntValue = GetIntValue(id);
                    if (idIntValue == 0)
                        return new ComponenteMsg();
                    var componente = ctx.TIPO_COMPONENTE.FirstOrDefault(p => p.id == idIntValue);
                    return GetComponenteMsgFromEntidad(componente);
                }
            }
            catch (Exception e)
            {
                var ms = new ComponenteMsg();
                ms.Error = e.Message;
                return ms;
            }

        }
        private static int GetIntValue(string id)
        {
            try
            {
                return Convert.ToInt32(id);
            }
            catch
            {
                return 0;
            }
        }
        private static ComponenteMsg GetComponenteMsgFromEntidad(TIPO_COMPONENTE componente)
        {
            var ms = new ComponenteMsg();
            if (componente != null)
            {
                ms.Id = componente.id;
                ms.Nombre = componente.nombre;
             
            }
            return ms;
        }
        
    }
}
