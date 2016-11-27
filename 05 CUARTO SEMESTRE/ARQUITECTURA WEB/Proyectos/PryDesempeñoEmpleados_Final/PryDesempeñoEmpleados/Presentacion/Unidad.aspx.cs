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
    public partial class Unidad : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (actualizar.Checked == false)
            {
                modidicar.Visible = false;
                ddlunidad.Visible = false;
                estadoC.Visible = false;
                lbestado.Visible = false;
                guardar.Visible = true;
            }
        }
        private void Mostrar(Cm_ClsUnidad cmUnidad)
        {
            
            this.nombre.Text = cmUnidad.Nombre;
            this.descripcion.Text = cmUnidad.Descripcion;
            this.telefono.Text = cmUnidad.Telefono;
            this.ubicacion.Text = cmUnidad.Ubicacion;
        }
        protected void ingresar_Click(object sender, ImageClickEventArgs e)
        {
            Ng_ClsUnidad ngUnidad = new Ng_ClsUnidad();
            if (Validar())
            {
                if (ngUnidad.insertarUnidad(nombre.Text, ubicacion.Text,telefono.Text, descripcion.Text, "Activo") > 0) { Response.Redirect("Unidad.aspx"); };
            }
        }

        private bool Validar()
        {
            return true;
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Ng_ClsUnidad ngUnidad = new Ng_ClsUnidad();
            Cm_ClsUnidad cmUnidad = ngUnidad.obtenerporId(Convert.ToInt16(ddlunidad.SelectedValue));
            Mostrar(cmUnidad);
        }

        protected void modidicar_Click(object sender, ImageClickEventArgs e)
        {

            Ng_ClsUnidad ngUnidad = new Ng_ClsUnidad();
            this.ddlunidad.Visible = true;
            if (ngUnidad.ActualizarUnidad(Convert.ToInt16(this.ddlunidad.SelectedValue), nombre.Text, this.ubicacion.Text, this.telefono.Text, this.descripcion.Text, this.estadoC.SelectedItem.ToString()) > 0)
            {
                string script = @"<script type='text/javascript'>
                alert('Registro Guardado!!. ');
                </script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "PryDesempeño", script, false);
                Clear();
                Response.Redirect("Unidad.aspx");
                actualizar.Checked = false;

            }
        }
        public void Clear()
        {
            nombre.Text = null;
            ubicacion.Text = null;
            telefono.Text = null;
            descripcion.Text = null;
            ubicacion.Text = null;
        }


        protected void actualizar_CheckedChanged(object sender, EventArgs e)
        {
            if (actualizar.Checked == true)
            {
                this.ddlunidad.Visible = true;
                this.estadoC.Visible = true;
                lbestado.Visible = true;
                modidicar.Visible = true;
                guardar.Visible = false;
            }
            else
            {
                this.ddlunidad.Visible = false;
                this.estadoC.Visible = false;
                lbestado.Visible = false;
                modidicar.Visible = false;
                guardar.Visible = true;
            }

        }

        protected void regresar_Click(object sender, ImageClickEventArgs e)
        {
            Server.Transfer("Administrador.aspx");
        }

    }
}