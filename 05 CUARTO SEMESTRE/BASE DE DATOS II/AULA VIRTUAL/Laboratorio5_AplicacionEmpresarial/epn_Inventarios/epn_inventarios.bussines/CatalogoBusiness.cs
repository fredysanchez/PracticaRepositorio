using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using epn_inventarios.messaje;
using epn_inventarios.core;

namespace epn_inventarios.bussines
{
    public class CatalogoBusiness
    {
        public static CataLogMsg Get(){
            try {
                var ms = new CataLogMsg(
                    estadobusiness.GetList(),tipoequipoBusiness.GetList(),proveedorBusiness.GetList()
                    );
                return ms;
            }
            catch(Exception e) {
                var ms = new CataLogMsg();
                ms.error=e.Message;
                return ms;
            }
            
        }
    }
}
