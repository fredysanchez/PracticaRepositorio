using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using presentation.utilities;
using epn.inventarios.message;

namespace epn.inventarios.presentation.utilities
{
    public class EquipoUtilities
    {
        public delegate void dEquipo(EquipoMsg me);
        public event dEquipo EquipoGuardado;
        public event dEquipo LLegoEquipoConsultado;

        public delegate void dError(string error);
        public event dError ShowError;
        public void SaveAsync(message.EquipoMsg _Equipo)
        {
            var jc = new JasonCall();
            jc.DataArrived += new JasonCall.dDataArrived(EquipoArrived);
            var url = string.Format("{0}/save",config.Default.urlEquipoService);
            jc.GetData_ByPutRestMethodAsync(url, typeof(EquipoMsg), _Equipo, typeof(EquipoMsg));
        }
        private void EquipoArrived(object result, string errorMessage)
        {
            if (!string.IsNullOrEmpty(errorMessage)) {
                ShowError(errorMessage);
                return;
            }
            if (result != null) {
                var equipo = (EquipoMsg)result;
                if (string.IsNullOrEmpty(equipo.Error))
                    EquipoGuardado(equipo);
                else
                    ShowError(equipo.Error);
            }
        }
        public void ConsultarEquipoPorCodigoActivoAsync(string codigo)//epn.act.18
        {
            var id = GetIdByCodigo(codigo);
            if (id > 0) {
                var jc = new JasonCall();
                jc.DataArrived += LlegoEquipoConsultadoSrv;
                var url = string.Format("{0}/getById/{1}", config.Default.urlEquipoService, id.ToString());
                jc.GetData_ByGetRestMethodAsync(url, typeof(EquipoMsg));
            }
            
        }
        void LlegoEquipoConsultadoSrv(object result, string errorMessage)
        {
            if (!string.IsNullOrEmpty(errorMessage))
            {
                ShowError(errorMessage);
                return;
            }
            if (result != null)
            {
                var equipo = (EquipoMsg)result;
                if (string.IsNullOrEmpty(equipo.Error))
                    LLegoEquipoConsultado(equipo);
                else
                    ShowError(equipo.Error);
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
