using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using epn.inventarios.message;
using epn.inventarios.business;
namespace epn.inventarios.services
{
    // NOTA: puede usar el comando "Rename" del menú "Refactorizar" para cambiar el nombre de clase "ComponenteServises" en el código, en svc y en el archivo de configuración a la vez.
    public class ComponenteServises : IComponenteServises
    {
        public ComponenteMsg save(message.ComponenteMsg me)
        {
            var ms = ComponenteBusiness.Save(me);
            return ms;
        }

        public ComponenteMsg GetById(string id)
        {
            var ms = ComponenteBusiness.GetById(id);
            return ms;
        }
    }
}
