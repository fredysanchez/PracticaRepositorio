using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using presentation.utilities;
using epn_inventarios.messaje;

namespace epn_inventarios.presentation.utilities
{
    public class CatalogoUtilities
    {
        //esta funcion se conecta al servicio web para traer los catalogos
        public static CataLogMsg GetCatalogo(){
            var ms = new CataLogMsg();
            var urlservice = "http://localhost:14180/CatalogosServices.svc/get";
            var jc = new JasonCall();
            ms = (CataLogMsg)jc.GetData_ByGetRestMethod(urlservice, typeof(CataLogMsg));
            return ms;
        }
    }
}
