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
    public partial class EmpleadosNota : System.Web.UI.Page
    {
      
        Ng_ClsActividad ngActividad = new Ng_ClsActividad();
        Cm_ClsActividad cmActividad = new Cm_ClsActividad();
        static Cm_ClsEmpleado cmempleado = new Cm_ClsEmpleado();
        Cm_ClsSitio cmsitio = new Cm_ClsSitio();
        protected void Page_Load(object sender, EventArgs e)
        {
            cmempleado = (Cm_ClsEmpleado)(Session["Empleado"]);
            this.txtidJ.Text = Convert.ToString(cmempleado.Id_Empleado);
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.panel1.Visible = true;
            this.txtidA.Text = this.GridView1.SelectedRow.Cells[1].Text;
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            if (ngActividad.Evaluacion(Convert.ToInt16(this.txtidA.Text), Convert.ToDouble(dnota.SelectedValue)) > 0)
            {
                ngActividad.regreso(Convert.ToInt16(this.DropDownList1.SelectedValue), Convert.ToInt16(this.txtidA.Text));


                Response.Redirect("EmpleadosNota.aspx");
            };
        }
    }
}