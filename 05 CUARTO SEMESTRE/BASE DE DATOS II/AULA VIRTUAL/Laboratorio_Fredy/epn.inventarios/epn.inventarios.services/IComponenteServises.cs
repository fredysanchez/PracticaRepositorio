using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using epn.inventarios.message;
using System.ServiceModel.Web;
namespace epn.inventarios.services
{
    // NOTA: puede usar el comando "Rename" del menú "Refactorizar" para cambiar el nombre de interfaz "IComponenteServises" en el código y en el archivo de configuración a la vez.
    [ServiceContract]
    public interface IComponenteServises
    {
        [OperationContract]
        [WebInvoke(
            Method = "PUT",
            ResponseFormat = WebMessageFormat.Json,
            RequestFormat=WebMessageFormat.Json,
            UriTemplate = "save"
            )]
        ComponenteMsg save(ComponenteMsg me);

        [WebInvoke(
            Method = "GET",
            ResponseFormat = WebMessageFormat.Json,
            UriTemplate = "getById/{id}"
            )]
        ComponenteMsg GetById(string id);
    
    }
}
