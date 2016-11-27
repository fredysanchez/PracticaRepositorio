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
    public partial class Actividades : System.Web.UI.Page
    {
        Ng_ClsActividad ngActividad = new Ng_ClsActividad();
        Cm_ClsActividad cmActividad = new Cm_ClsActividad();
        static Cm_ClsEmpleado cmempleado = new Cm_ClsEmpleado();
        Cm_ClsSitio cmsitio = new Cm_ClsSitio();
        protected void Page_Load(object sender, EventArgs e)
        {
            cmempleado = (Cm_ClsEmpleado)(Session["Empleado"]);
            ValoresDefecto();
            if (!IsPostBack)
            {
                txtidemp.Text = Convert.ToString(cmempleado.Id_Empleado);
            }    
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            if (ngActividad.insertarActividades(this.nombre.Text, this.descripcion.Text,Convert.ToDateTime(fecha.Text),
                Convert.ToDouble(Convert.ToInt16(dhoras.SelectedItem.ToString()) + "," + Convert.ToInt16(dminutos.SelectedItem.ToString())),
                Convert.ToInt16(this.ddificultad.SelectedValue),
                this.destado.SelectedItem.ToString(),Convert.ToInt16( txtidemp.Text),
                Convert.ToInt16(this.dsitio.SelectedValue)) > 0 )
            { Response.Redirect("Actividades.aspx"); };
        }
        public void ValoresDefecto()
        {
            this.fecha.Text = DateTime.Now.ToShortDateString();
        }

        protected void ddificultad_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void regresar_Click(object sender, ImageClickEventArgs e)
        {
            Session.Add("Empleado", cmempleado);
            Server.Transfer("Sesion.aspx");
        }


    }
}