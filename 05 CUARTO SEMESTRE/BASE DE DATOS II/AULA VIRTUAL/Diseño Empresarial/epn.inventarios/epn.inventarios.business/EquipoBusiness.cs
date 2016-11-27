using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using epn.inventarios.core;
using epn.inventarios.message;
using System.Transactions;

namespace epn.inventarios.business
{
    public class EquipoBusiness
    {
        
        public static EquipoMsg Save(EquipoMsg me)
        {
            try
            {
                using (var tx = new TransactionScope()) {
                    using (var ctx = new csEpnInventario()) { 
                        
                        var equipo = GetEquipoFromMsg(ctx,me);
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
                var ms=new EquipoMsg();
                ms.Error = e.Message;
                return ms;
            }
        }
        private static EQUIPO GetEquipoFromMsg(csEpnInventario ctx, EquipoMsg me)
        {
            var ms = 
                (me.Id == 0) ? new EQUIPO() : ctx.EQUIPO.FirstOrDefault(p => p.id == me.Id);

            ms.idEstado = me.IdEstado;
            ms.idProveedor = me.IdProveedor;
            ms.idTipoEquipo = me.IdTipoEquipo;
            ms.marca = me.Marca;
            ms.modelo = me.Modelo;
            ms.fechaCompra = me.FechaCompra;
            ms.valorCompra = me.ValorCompra;
            return ms;
        }
        private static void New(csEpnInventario ctx, EQUIPO equipo)
        {
            equipo.fechaCompra = DateTime.Now;
            ctx.EQUIPO.AddObject(equipo);
        }
        private static void Update(csEpnInventario ctx, EQUIPO equipo)
        {
            throw new NotImplementedException();
        }
        public static EquipoMsg GetById(string id)
        {
            try
            {
                using (var ctx = new csEpnInventario())
                {
                    var idIntValue = GetIntValue(id);
                    if (idIntValue == 0)
                        return new EquipoMsg();
                    var equipo = ctx.EQUIPO.FirstOrDefault(p => p.id == idIntValue);
                    return GetEquipoMsgFromEntidad(equipo);
                }
            }
            catch (Exception e)
            {
                var ms=new EquipoMsg();
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
        private static EquipoMsg GetEquipoMsgFromEntidad(EQUIPO equipo)
        {
            var ms = new EquipoMsg();
            if (equipo != null) {
                ms.Id = equipo.id;
                ms.IdEstado = equipo.idEstado;
                ms.IdProveedor = equipo.idProveedor;
                ms.IdTipoEquipo = equipo.idTipoEquipo;
                ms.Marca = equipo.marca;
                ms.Modelo = equipo.modelo;
                ms.ValorCompra = equipo.valorCompra;
            }
            return ms;
        }
        
    }
}
