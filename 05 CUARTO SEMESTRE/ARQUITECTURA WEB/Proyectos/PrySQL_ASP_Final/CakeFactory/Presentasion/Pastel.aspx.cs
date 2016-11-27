using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Windows.Forms;
using CakeFactory.Comun;
using CakeFactory.Negocio;

namespace CakeFactory.Presentasion
{
    public partial class Pastel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                loadGrid();
                loadDrp();
                Ng_ClsPastel ngPastel = new Ng_ClsPastel();
                Cm_ClsPastel cmPastel = ngPastel.obtenerPastelporId(Convert.ToInt16(drpPastel.SelectedValue));
                Mostrar(cmPastel);
                drpPastel.AutoPostBack = true;
            }
        }

        protected void btnregistrar_Click(object sender, EventArgs e)
        {
            Ng_ClsPastel ngPastel = new Ng_ClsPastel();
            if (ngPastel.insertarPastel(txturl.Text,Decimal.Parse(txtcosto.Text),txtdes.Text)>0){
                loadGrid();
                Clear();
                loadDrp();
                string script = @"<script type='text/javascript'>
                alert('Pastel registrado. ');
                </script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Cake Factory", script, false);
            }
        }

        private void loadGrid() {
            Ng_ClsPastel ngPastel = new Ng_ClsPastel();
            gridPasteles.DataSource = ngPastel.Obtenerpastel();
            gridPasteles.DataBind();
        }

        private void Clear() {
            txtcosto.Text = null;
            txtdes.Text = null;
            txturl.Text=null;
        }

        private void loadDrp() {
            Ng_ClsPastel ngPastel = new Ng_ClsPastel();
            drpPastel.DataSource = ngPastel.Obtenerpastel();
            this.drpPastel.DataValueField = "id_pas";
            this.drpPastel.DataTextField = "descripcion_pas";
            this.drpPastel.DataBind();
        }

        protected void drpPastel_TextChanged(object sender, EventArgs e)
        {
            Ng_ClsPastel ngPastel = new Ng_ClsPastel();
            Cm_ClsPastel cmPastel = ngPastel.obtenerPastelporId(Convert.ToInt16(drpPastel.SelectedValue));
            Mostrar(cmPastel);
        }

        private void Mostrar(Cm_ClsPastel cmPastel)
        {
            txtcosto.Text = Convert.ToString(cmPastel.Costo_pas);
            txtdes.Text = cmPastel.Descripcion_pas;
            txturl.Text = cmPastel.Url_pass;

            lblnombre.Text = "Descripcion: " + cmPastel.Descripcion_pas;
            lblcosto.Text = "Costo: $ " + Convert.ToString(cmPastel.Costo_pas);
            Imurl.ImageUrl = cmPastel.Url_pass;
        }

        protected void btnactualizar_Click(object sender, EventArgs e)
        {
            Ng_ClsPastel ngPastel = new Ng_ClsPastel();
            if (ngPastel.ActualizarPastel(Convert.ToInt16(drpPastel.SelectedValue),txturl.Text, Decimal.Parse(txtcosto.Text), txtdes.Text) > 0)
            {
                loadGrid();
                Clear();
                loadDrp();
                string script = @"<script type='text/javascript'>
                alert('Actualizacion ejecutada. ');
                </script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Cake Factory",script,false);
            }
        }

        protected void drpPastel_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}