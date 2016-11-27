using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using presentation.utilities;
using epn.inventarios.message;

namespace epn.inventarios.presentation.utilities
{
    public class CatalogoUtilities
    {
        /// <summary>
        /// Esta función se conecta al servicio web para traer los catálogos
        /// </summary>
        /// <returns></returns>
        public static CatalogMsg GetCatalogo(){
            var ms = new CatalogMsg();
            var urlService = "http://localhost:1262/CatalogosServises.svc/get";
            var jc = new JasonCall();
            ms = (CatalogMsg)jc.GetData_ByGetRestMethod(urlService, typeof(CatalogMsg));
            return ms;
        }
    }
}
