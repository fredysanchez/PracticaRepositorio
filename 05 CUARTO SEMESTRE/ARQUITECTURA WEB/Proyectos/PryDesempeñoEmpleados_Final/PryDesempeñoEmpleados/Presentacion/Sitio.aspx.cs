using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PryDesempeñoEmpleados.Comun;
using PryDesempeñoEmpleados.Negocio;

namespace PryDesempeñoEmpleados.Presentacion
{
    public partial class Sitio : System.Web.UI.Page
    {
        Ng_ClsSitio ngSitio = new Ng_ClsSitio();
        Cm_ClsSitio cmSitio = new Cm_ClsSitio();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (actualizar.Checked == false)
            {
                modidicar.Visible = false;
                ddlsitio.Visible = false;
                estadoC.Visible = false;
                lbestado.Visible = false;
                guardar.Visible = true;
            }
        }
        private void Mostrar(Cm_ClsSitio cmSitio)
        {

            this.nombre.Text = cmSitio.Nombre;
            this.descripcion.Text = cmSitio.Descripcion;
            this.ubicacion.Text = cmSitio.Ubicacion;


        }
        protected void ingresar_Click(object sender, ImageClickEventArgs e)
        {
            if (Validar())
            {
                if (ngSitio.insertarSitio(nombre.Text,ubicacion.Text,descripcion.Text, "Activo") > 0) { Response.Redirect("Sitio.aspx"); };
            }
        }

        private bool Validar()
        {
            return true;
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void descripcion_TextChanged(object sender, EventArgs e)
        {

        }


        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Ng_ClsSitio ngSitio = new Ng_ClsSitio();
            Cm_ClsSitio cmSitio = ngSitio.obtenerporId(Convert.ToInt16(this.ddlsitio.SelectedValue));
            Mostrar(cmSitio);
        }

        protected void modidicar_Click(object sender, ImageClickEventArgs e)
        {

            Ng_ClsSitio ngsitio = new Ng_ClsSitio();
            this.ddlsitio.Visible = true;
            if (ngsitio.ActualizarSitio(Convert.ToInt16(this.ddlsitio.SelectedValue), nombre.Text,ubicacion.Text, this.descripcion.Text, this.estadoC.SelectedItem.ToString()) > 0)
            {
                string script = @"<script type='text/javascript'>
                alert('Registro Guardado!!. ');
                </script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "PryDesempeño", script, false);
                Clear();
                Response.Redirect("Sitio.aspx");
                actualizar.Checked = false;

            }
        }
        public void Clear()
        {
            nombre.Text = null;
            ubicacion.Text = null;
            descripcion.Text = null;
        }


        protected void actualizar_CheckedChanged(object sender, EventArgs e)
        {
            if (actualizar.Checked == true)
            {
                this.ddlsitio.Visible = true;
                this.estadoC.Visible = true;
                lbestado.Visible = true;
                modidicar.Visible = true;
                guardar.Visible = false;
            }
            else
            {
                this.ddlsitio.Visible = false;
                this.estadoC.Visible = false;
                lbestado.Visible = false;
                modidicar.Visible = false;
                guardar.Visible = true;
            }

        }

        protected void grvcargos_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void regresar_Click(object sender, ImageClickEventArgs e)
        {
            Server.Transfer("Administrador.aspx");
        }
    }
}