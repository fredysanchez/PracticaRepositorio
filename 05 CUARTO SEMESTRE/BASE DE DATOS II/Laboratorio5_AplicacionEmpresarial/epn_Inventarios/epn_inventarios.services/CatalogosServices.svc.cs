using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

using epn_inventarios.bussines;
using System.ServiceModel.Web;

namespace epn_inventarios.services
{
    public class CatalogosServices : ICatalogosServices
    {
        public messaje.CataLogMsg Get()
        {
            return CatalogoBusiness.Get();
        }
    }
}
