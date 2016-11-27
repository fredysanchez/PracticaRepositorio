using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

using System.ServiceModel.Web;
using epn.inventarios.message;

namespace epn.inventarios.services
{
    // NOTA: puede usar el comando "Rename" del menú "Refactorizar" para cambiar el nombre de interfaz "ICatalogosServises" en el código y en el archivo de configuración a la vez.
    [ServiceContract]
    public interface ICatalogosServises
    {
        [OperationContract]
        [WebInvoke(
            Method="GET",
            ResponseFormat=WebMessageFormat.Json,
            UriTemplate="get"
            )]
        CatalogMsg Get();
    }
}
