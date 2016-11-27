using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

using System.ServiceModel.Web;
using epn_inventarios.messaje;

namespace epn_inventarios.services
{
    [ServiceContract]
    public interface ICatalogosServices
    {
        [OperationContract]
        [WebInvoke(
            Method="GET",
            ResponseFormat=WebMessageFormat.Json,
            UriTemplate="get"
            )]
        CataLogMsg Get();
    }
}
