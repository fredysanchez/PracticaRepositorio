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
    // NOTA: puede usar el comando "Rename" del menú "Refactorizar" para cambiar el nombre de clase "EquipoServises" en el código, en svc y en el archivo de configuración a la vez.
    public class EquipoServises : IEquipoServises
    {
        public EquipoMsg save(message.EquipoMsg me)
        {
            var ms= EquipoBusiness.Save(me);
            return ms;
        }
        
        public EquipoMsg GetById(string id)
        {
            var ms = EquipoBusiness.GetById(id);
            return ms;
        }
    }
}
