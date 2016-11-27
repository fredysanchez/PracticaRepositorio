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
        private EquipoMensaje _Equipo;
        public FrmRegistro()
        {
            InitializeComponent();
            iniciar();
        }
        private void iniciar()
        {
            poblarCtalogos();
            inicializarEquipo();
        }
        private void inicializarEquipo()
        {
            if (_Equipo == null)
                _Equipo = new EquipoMensaje();
            EquipoBS.DataSource = _Equipo;
        }
        private void poblarCtalogos()
        {
            Catalogo = CatalogoUtilities.GetCatalogo();
            EstadoBS.DataSource = Catalogo.Listestado;
            ProveedorBS.DataSource = Catalogo.ListProveedor;
            TipoEquipoBS.DataSource = Catalogo.ListTipoEquipo;
        }
        private void label1_Click(object sender, EventArgs e)
        {

        }
        private void ProveedorBS_CurrentChanged(object sender, EventArgs e)
        {

        }
        private void etado_Click(object sender, EventArgs e)
        {

        }
        private void FrmRegistro_Load(object sender, EventArgs e)
        {

        }
        private void btminsertar_Click(object sender, EventArgs e)
        {
            EquipoBS.EndEdit();
            if(Validar())
            Equipoutilities.Save(_Equipo);
        }
        private bool Validar()
        {
            return true;
            //Todo: Realizar codigo de validación.
        }
    }
}
