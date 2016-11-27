using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using PryDesempeñoEmpleados.Negocio;
using PryDesempeñoEmpleados.Comun;

namespace PryDesempeñoEmpleados.Presentacion
{
    public partial class Perfiles : System.Web.UI.Page
    {
        Ng_ClsUnidad ng_unidad = new Ng_ClsUnidad();
        Ng_ClsEmpleado ng_empleado = new Ng_ClsEmpleado();
        protected void Page_Load(object sender, EventArgs e)
        {
            ocultarPerfil(false);
           
        }

        private void mostrarDatos(Cm_ClsEmpleado cm_empleado)
        {
            Nombre.Text =        "       Nombre:  "+ cm_empleado.Nombre;
            apellido.Text =      "  " + cm_empleado.Apellido;
            fecha.Text =         "  Fecha de Nacimiento:  " + cm_empleado.FechaNacimiento.ToShortDateString();
            instruccion.Text =   "  Instruccion:  " + cm_empleado.Instruccion;
            telefono.Text =      "     Telefono:  " + cm_empleado.Telefono;
            descripcion.Text =   "  Descripcion:  " + cm_empleado.Descripcion;
            cargo.Text =         "        Cargo:  " + cm_empleado.CargoNombre;
            unidad.Text =        "       Unidad:  " + cm_empleado.UnidadNombre;
            lblnota.Text =Convert.ToString( cm_empleado.Nota);
            cal.Text = "Calificacion: ";
            
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
           
        }

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {
            Ng_ClsEmpleado ng_empleado = new Ng_ClsEmpleado();
            ocultarPerfil(true);
            int index = this.GridView1.SelectedIndex;
            Cm_ClsEmpleado cm_empleado = ng_empleado.ListarPorId(int.Parse(GridView1.DataKeys[index].Value.ToString()));
            Image1.ImageUrl = "http://localhost:51731/Presentacion/imagen.aspx?ID=" + (GridView1.DataKeys[index].Value);
            mostrarDatos(cm_empleado);

        }
        public void ocultarPerfil(bool estado)
        {
            this.Image1.Visible = estado;
            Image1.Visible = estado;

            Nombre.Text = null;
            apellido.Text = null;
            fecha.Text = null;
            instruccion.Text = null;
            telefono.Text =  null;
            descripcion.Text =  null;
            cargo.Text =  null;
            unidad.Text = null;
            lblnota.Text = null;
            cal.Text = null;
        }       
    }
}