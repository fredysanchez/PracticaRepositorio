using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

using epn_inventarios.presentation.utilities;
using epn_inventarios.messaje;

namespace epn_inventarios.presentation
{
    public partial class FrmRegistro : Form
    {
        public CataLogMsg Catalogo { get; set; }
        public FrmRegistro()
        {
            InitializeComponent();
            iniciar();
        }

        private void iniciar()
        {
            Catalogo = CatalogoUtilities.GetCatalogo();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }
    }
}
