using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

using epn.inventarios.business;

namespace epn.inventarios.services
{
    // NOTA: puede usar el comando "Rename" del menú "Refactorizar" para cambiar el nombre de clase "CatalogosServises" en el código, en svc y en el archivo de configuración a la vez.
    public class CatalogosServises : ICatalogosServises
    {

        public message.CatalogMsg Get()
        {
            return CatalogoBusiness.Get();
        }
    }
}
