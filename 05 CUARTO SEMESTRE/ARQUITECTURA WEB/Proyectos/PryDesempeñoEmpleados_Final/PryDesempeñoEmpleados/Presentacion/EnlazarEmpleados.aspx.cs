using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PryDesempeñoEmpleados.Negocio;

namespace PryDesempeñoEmpleados.Presentacion
{
    public partial class EnlazarEmpleados : System.Web.UI.Page
    {
        Ng_ClsEmpleadoJefe ngEmpleadoJefe = new Ng_ClsEmpleadoJefe();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            if (ngEmpleadoJefe.insertarEmpleadoJefe(Convert.ToInt32(this.djefe.SelectedItem.Value), Convert.ToInt32(this.dempleado.SelectedItem.Value)) > 0) { Response.Redirect("EnlazarEmpleados.aspx"); };
        }
    }
}