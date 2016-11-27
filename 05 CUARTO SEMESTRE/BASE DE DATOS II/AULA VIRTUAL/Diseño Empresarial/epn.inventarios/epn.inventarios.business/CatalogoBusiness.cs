using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using epn.inventarios.message;
using epn.inventarios.core;

namespace epn.inventarios.business
{
    public class CatalogoBusiness
    {
        public static CatalogMsg Get(){
            try
            {
                var ms = new CatalogMsg(
                        EstadoBusiness.GetList(),
                        TipoEquipoBusiness.GetList(),
                        ProveedorBusiness.GetList(),
                        TipoComponenteBusiness.GetList()
                    );
                return ms;
            }
            catch (Exception e)
            {
                var ms = new CatalogMsg();
                ms.Error = e.Message;
                return ms;
            }
            
        }
    }
}
