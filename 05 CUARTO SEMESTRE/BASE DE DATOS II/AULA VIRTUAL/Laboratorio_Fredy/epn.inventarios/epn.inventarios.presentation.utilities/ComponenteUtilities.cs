using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using presentation.utilities;
using epn.inventarios.message;

namespace epn.inventarios.presentation.utilities
{
    public class ComponenteUtilities
    {
        public delegate void dComponente(ComponenteMsg me);
        public event dComponente ComponenteGuardado;
        public event dComponente LLegoComponenteConsultado;

        public delegate void dError(string error);
        public event dError ShowError;

        public void SaveAsync(message.ComponenteMsg _Componente)
        {
            var jc = new JasonCall();
            jc.DataArrived += new JasonCall.dDataArrived(ComponenteArrived);
            var url = string.Format("{0}/save", config.Default.urlComponenteService);
            jc.GetData_ByPutRestMethodAsync(url, typeof(ComponenteMsg), _Componente, typeof(ComponenteMsg));
        }

        private void ComponenteArrived(object result, string errorMessage)
        {
            if (!string.IsNullOrEmpty(errorMessage))
            {
                ShowError(errorMessage);
                return;
            }
            if (result != null)
            {
                var componente = (ComponenteMsg)result;
                if (string.IsNullOrEmpty(componente.Error))
                    ComponenteGuardado(componente);
                else
                    ShowError(componente.Error);
            }
        }


        public void ConsultarEquipoPorCodigoActivoAsync(string codigo)//epn.act.18
        {
            var id = GetIdByCodigo(codigo);
            if (id > 0)
            {
                var jc = new JasonCall();
                jc.DataArrived += LlegoComponenteConsultadoSrv;
                var url = string.Format("{0}/getById/{1}", config.Default.urlComponenteService, id.ToString());
                jc.GetData_ByGetRestMethodAsync(url, typeof(ComponenteMsg));
            }

        }

        void LlegoComponenteConsultadoSrv(object result, string errorMessage)
        {
            if (!string.IsNullOrEmpty(errorMessage))
            {
                ShowError(errorMessage);
                return;
            }
            if (result != null)
            {
                var componente = (ComponenteMsg)result;
                if (string.IsNullOrEmpty(componente.Error))
                    LLegoComponenteConsultado(componente);
                else
                    ShowError(componente.Error);
            }
        }
        public static int GetIdByCodigo(string codigo)
        {
            //formato del codigo: epn.act.[id]
            var matrix = codigo.Split(new char[] { '.' });
            if (matrix.Length == 3)
                return Convert.ToInt32(matrix[2]);
            return 0;
        }
    }
}
