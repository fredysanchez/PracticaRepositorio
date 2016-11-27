using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using presentation.utilities;
using epn_inventarios.messaje;

namespace epn_inventarios.presentation
{
    public class Equipoutilities
    {
        internal static void Save(messaje.EquipoMensaje _Equipo)
        {
            var jc = new JasonCall();
            jc.DataArrived += EquipoArrived;

            var url = "http://localhost:14180/EquipoServices.svc/Save";
            jc.GetData_ByPutRestMethodAsync(url, typeof(EquipoMensaje), _Equipo, typeof(EquipoMensaje));
        }

        static void EquipoArrived(object IAsyncResult, string erroMsg){ 
        
        }
    }
}
