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

        private ComponenteMsg _Componente;
        public CatalogMsg _Catalogo { get; set; }
        public FrmComponentes()
        {
            InitializeComponent();
            PoblarCatalogos();
            InicializarComponente();
        }


   
        private void InicializarComponente()
        {
            if (_Componente == null)
                _Componente = new ComponenteMsg();
            EQ_Componentes_BS.DataSource = _Componente;
        }
        private void PoblarCatalogos()
        {
            _Catalogo = CatalogoUtilities.GetCatalogo();
            Componente_BS.DataSource = _Catalogo.ListTipoComponente;
          

        }
        private void FrmComponentes_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            FrmRegistro a = new FrmRegistro();
            this.Hide();
            a.Show();
        }

        private void btmGuar_Click(object sender, EventArgs e)
        {
            EQ_Componentes_BS.EndEdit();
            if (Validar())
            {
                var eu = new ComponenteUtilities();
                eu.ComponenteGuardado += new ComponenteUtilities.dComponente(eu_EquipoGuardado);
                eu.ShowError += new ComponenteUtilities.dError(eu_ShowError);
                eu.SaveAsync(_Componente);

            }
        }

        private void Refrescar()
        {
            FrmComponentes a = new FrmComponentes();
            this.Close();
            a.Show();
        }

        private bool Validar()
        {
            return true;
        }
        void eu_ShowError(string error)
        {
            MessageBox.Show(error, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
        }
        void eu_EquipoGuardado(ComponenteMsg me)
        {
            if (me != null)
            {
                MessageBox.Show(string.Format("Se guardó correctamente el equipo:  {0}", me.Nombre));
                PoblarControlesPorObjeto(me);
                Refrescar();
            }

        }
        private void PoblarControlesPorObjeto(ComponenteMsg me)
        {
            _Componente = me;
            EQ_Componentes_BS.DataSource = _Componente;
        }
    }
}
