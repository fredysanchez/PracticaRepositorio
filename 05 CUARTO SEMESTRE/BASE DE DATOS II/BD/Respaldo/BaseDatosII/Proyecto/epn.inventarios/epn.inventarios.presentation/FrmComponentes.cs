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
    public partial class FrmComponentes : Form
    {
        public ComponenteMsg Componente { get; set; }
        private int _IdTipoEquipo;

        public FrmComponentes(int idTipoEquipo)
        {
            InitializeComponent();
            this._IdTipoEquipo = idTipoEquipo;
            Init();
        }
        private void Init()
        {
            TipoComponente_BS.DataSource = 
                CatalogoUtilities.GetCatalogo().ListaTipoComponentes
                .Where(p=>p.IdTipoEquipo==_IdTipoEquipo).ToList();
            if (this.Componente == null)
                this.Componente = new ComponenteMsg();
            componenteMsg_BS.DataSource = this.Componente;
        }
        private void cmdRegresar_Click(object sender, EventArgs e)
        {
            componenteMsg_BS.EndEdit();
            if (FormaValida()) {
                this.Componente.TextoComponente = comboBoxTipoComponente.Text;
                this.DialogResult = DialogResult.OK;
            }
        }

        private bool FormaValida()
        {
            //TODO: Implementar FormaValida de componente
            return true;
        }
    }
}
