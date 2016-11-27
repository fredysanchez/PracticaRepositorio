using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

using epn.inventarios.presentation.utilities;
using epn.inventarios.message;

namespace epn.inventarios.presentation
{
    public partial class FrmMantenimientos : Form
    {
        private int _IdTipoEquipo;
        public MantenimientoMSg Mantenimiento { get; set; }

        public FrmMantenimientos(int idTipoEquipo)
        {
            InitializeComponent();
            this._IdTipoEquipo = idTipoEquipo;
            Init();
            
        }
        private void Init()
        {
            TipoComponente_BS.DataSource =
                 CatalogoUtilities.GetCatalogo().ListaTipoComponentes
                 .Where(p => p.IdTipoEquipo == _IdTipoEquipo).ToList();
            Tecnico_BS.DataSource = CatalogoUtilities.GetCatalogo().ListaTecnico;
            TipoMantenimineto_BS.DataSource = CatalogoUtilities.GetCatalogo().ListaTipoMantenimiento;

            if (this.Mantenimiento == null)
                this.Mantenimiento = new MantenimientoMSg();
            Mantenimiento_BS.DataSource = this.Mantenimiento;

        }
        private bool FormaValida()
        {
            return true;
        }

        private void btnregresar_Click(object sender, EventArgs e)
        {
           Mantenimiento_BS.EndEdit();
            if (FormaValida())
            {
                this.Mantenimiento.Tecnico = idTecnicoComboBox.Text;
                this.Mantenimiento.TipoMantenimiento = idTipoMantenimientoComboBox.Text;
                this.Mantenimiento.FechaMantenimiento = fechaMantenimientoDateTimePicker.Value;
                this.DialogResult = DialogResult.OK;
            }
        }
    }
}
