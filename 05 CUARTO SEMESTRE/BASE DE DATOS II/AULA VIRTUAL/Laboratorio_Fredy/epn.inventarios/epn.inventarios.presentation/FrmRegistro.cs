﻿using System;
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
    public partial class FrmRegistro : Form
    {
        public CatalogMsg _Catalogo { get; set; }
        public FrmRegistro()
        {
            InitializeComponent();
            Iniciar();
        }
        private EquipoMsg _Equipo;

        private void Iniciar()
        {
            PoblarCatalogos();
            InicializarEquipo();
        }
        private void InicializarEquipo()
        {
            if (_Equipo == null)
                _Equipo = new EquipoMsg();
            Equipo_BS.DataSource = _Equipo;
        }
        private void PoblarCatalogos()
        {
            _Catalogo = CatalogoUtilities.GetCatalogo();
            Estado_BS.DataSource = _Catalogo.ListEstado;
            Proveedores_BS.DataSource = _Catalogo.ListProveedor;
            TipoEquipo_BS.DataSource = _Catalogo.ListTipoEquipo;
            
        }
        private void FrmRegistro_Load(object sender, EventArgs e)
        {

        }
        private void cmdInsert_Click(object sender, EventArgs e)
        {
            Equipo_BS.EndEdit();
            if (ValidoParaGuardar()) {
                var eu = new EquipoUtilities();
                eu.EquipoGuardado += new EquipoUtilities.dEquipo(eu_EquipoGuardado);
                eu.ShowError += new EquipoUtilities.dError(eu_ShowError);
                eu.SaveAsync(_Equipo);
            }
                
        }
        void eu_ShowError(string error)
        {
            MessageBox.Show(error, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
        }
        void eu_EquipoGuardado(EquipoMsg me)
        {
            if (me != null) {
                MessageBox.Show(string.Format("Se guardó correctamente el equipo: {0} {1}", me.Modelo, me.Marca));
                PoblarControlesPorObjeto(me);
                this.Refresh();
            }
            
        }
        private bool ValidoParaGuardar()
        {
            if (!RegistroTipoEquipo()) {
                MessageBox.Show("Debe registrar el tipo de equipo!!");
                return false;
            }
            if (!RegistroEstadoEquipo())
            {
                MessageBox.Show("Debe registrar el estado del equipo!!");
                return false;
            }
            if (!RegistroProveedor())
            {
                MessageBox.Show("Debe registrar el Proveedor!!");
                return false;
            }
            if (!RegistroMarca())
            {
                MessageBox.Show("Debe registrar la marca del equipo!!");
                return false;
            }
            if (!RegistroModelo())
            {
                MessageBox.Show("Debe registrar el Modelo del equipo!!");
                return false;
            }
            if (!RegistroValorCompra())
            {
                MessageBox.Show("Debe registrar el valor de compra de equipo!!");
                return false;
            }
            return true;
        }
        private bool RegistroValorCompra()
        {
            return _Equipo.ValorCompra>0;
        }
        private bool RegistroModelo()
        {
            return !string.IsNullOrEmpty(_Equipo.Modelo);
        }
        private bool RegistroMarca()
        {
            return !string.IsNullOrEmpty(_Equipo.Marca);
        }
        private bool RegistroProveedor()
        {
            return _Equipo.IdProveedor > 0;
        }
        private bool RegistroEstadoEquipo()
        {
            return _Equipo.IdEstado > 0;
        }
        private bool RegistroTipoEquipo()
        {
            return _Equipo.IdTipoEquipo > 0;
        }
        private void cmdConsultar_Click(object sender, EventArgs e)
        {
            Consultar();
        }
        private void EncerarFormulario()
        {
            PoblarControlesPorObjeto(new EquipoMsg());
        }
        private void Consultar()
        {
            var eq = new EquipoUtilities();
            eq.LLegoEquipoConsultado += LlegoEquipoConsultado;
            eq.ConsultarEquipoPorCodigoActivoAsync(txtCodigoEquipo.Text);
        }
        private void LlegoEquipoConsultado(EquipoMsg equipoConsultado) {
            PoblarControlesPorObjeto(equipoConsultado);
            HabilitarConsulta(false);
        }
        private void PoblarControlesPorObjeto(EquipoMsg me)
        {
            _Equipo = me;
            Equipo_BS.DataSource = _Equipo;
        }
        private void cmdHabilitarConsulta_Click(object sender, EventArgs e)
        {
            HabilitarConsulta(true);
        }
        private void HabilitarConsulta(bool habilitar)
        {
            txtCodigoEquipo.Enabled = habilitar;
            cmdHabilitarConsulta.Visible = !habilitar;
            cmdConsultar.Visible = habilitar;
        }
        private void txtCodigoEquipo_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar==(char)Keys.Enter)
                Consultar();
        }

        private void idTipoEquipoComboBox_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void Equipo_BS_CurrentChanged(object sender, EventArgs e)
        {

        }

        private void btmagregar_Click(object sender, EventArgs e)
        {
            FrmComponentes c = new FrmComponentes();
            this.Hide();
            c.Show();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
