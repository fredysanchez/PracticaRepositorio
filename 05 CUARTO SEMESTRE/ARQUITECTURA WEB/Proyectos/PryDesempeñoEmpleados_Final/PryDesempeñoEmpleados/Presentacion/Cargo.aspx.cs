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
    public partial class Cargo : System.Web.UI.Page
    {
        Ng_ClsCargo ngCargo = new Ng_ClsCargo();
        Cm_ClsCargo cmCargo = new Cm_ClsCargo();
        protected void Page_Load(object sender, EventArgs e)
        {
            ValoresDefecto();
            if (actualizar.Checked == false)
            {
                modidicar.Visible = false;
                DropDownList1.Visible = false;
                estadoC.Visible = false;
                lbestado.Visible = false;
                guardar.Visible = true;
            }
        }
        private void Mostrar(Cm_ClsCargo cmcargo)
        {

            this.nombre.Text = cmcargo.Nombre;
            this.descripcion.Text = cmcargo.Descripcion;
            this.fecha.Text = Convert.ToString(cmcargo.FechaCreacion.ToShortDateString());


        }
        protected void ingresar_Click(object sender, ImageClickEventArgs e)
        {
            if (Validar())
            {
                if (ngCargo.insertarCargo(nombre.Text, this.fecha.Text, descripcion.Text, "Activo") > 0 ) { Response.Redirect("Cargo.aspx"); };
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
        public void ValoresDefecto()
        {
            this.fecha.Text = DateTime.Now.ToShortDateString();
        }

        protected void fecha_TextChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Ng_ClsCargo ngcargo = new Ng_ClsCargo();
            Cm_ClsCargo cmcargo = ngcargo.obtenerporId(Convert.ToInt16(this.DropDownList1.SelectedValue));
            Mostrar(cmcargo);
        }

        protected void modidicar_Click(object sender, ImageClickEventArgs e)
        {
            
            Ng_ClsCargo ngcargo = new Ng_ClsCargo();
            this.DropDownList1.Visible = true;
            if (ngcargo.ActualizarCargo(Convert.ToInt16(this.DropDownList1.SelectedValue), nombre.Text, this.fecha.Text, this.descripcion.Text, this.estadoC.SelectedItem.ToString()) > 0)
            {
                string script = @"<script type='text/javascript'>
                alert('Registro Guardado!!. ');
                </script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "PryDesempeño", script, false);
                Clear();
                Response.Redirect("Cargo.aspx");
                actualizar.Checked = false;
                
            }
        }
        public void Clear()
        {
            nombre.Text = null;

            descripcion.Text = null;
        }


        protected void actualizar_CheckedChanged(object sender, EventArgs e)
        {
            if (actualizar.Checked==true)
            {
                this.DropDownList1.Visible = true;
                this.estadoC.Visible = true;
                lbestado.Visible = true;
                modidicar.Visible = true;
                guardar.Visible = false;
            }
            else
            {
                this.DropDownList1.Visible = false;
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