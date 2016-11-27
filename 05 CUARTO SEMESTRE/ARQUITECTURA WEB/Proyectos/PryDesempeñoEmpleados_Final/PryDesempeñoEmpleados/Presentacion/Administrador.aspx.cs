using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PryDesempeñoEmpleados.Comun;

namespace PryDesempeñoEmpleados.Presentacion
{
    public partial class Administrador : System.Web.UI.Page
    {

        static Cm_ClsEmpleado cemp= new Cm_ClsEmpleado();

        protected void Page_Load(object sender, EventArgs e)
        {
           
           
            cemp = (Cm_ClsEmpleado)(Session["Empleado"]);
            
            if (!IsPostBack)
            {
                if (cemp != null)
                {
                    
                    ImageButton adm = (ImageButton)Master.FindControl("btnAdmin");
                    adm.Visible = true;
                    this.nombre.Text = cemp.Nombre;
                    this.apellido.Text = cemp.Apellido;
                    this.fecha.Text = cemp.FechaNacimiento.ToShortDateString();
                    this.cargo.Text = cemp.CargoNombre;
                    this.unidad.Text = cemp.UnidadNombre;
                    this.Image1.ImageUrl = "http://localhost:51731/Presentacion/imagen.aspx?ID=" + Convert.ToString(cemp.Id_Empleado);
                }
            }

        }

        protected void empleado_Click(object sender, ImageClickEventArgs e)
        {
            Server.Transfer("RegistroEmpleados.aspx");
        }

        protected void rgarco_Click(object sender, ImageClickEventArgs e)
        {
            Server.Transfer("Cargo.aspx");
        }

        protected void rsitio_Click(object sender, ImageClickEventArgs e)
        {
            Server.Transfer("Sitio.aspx");
        }

        protected void runidad_Click(object sender, ImageClickEventArgs e)
        {
            Server.Transfer("Unidad.aspx");
        }

        protected void renlace_Click(object sender, ImageClickEventArgs e)
        {
            Server.Transfer("EnlazarEmpleados.aspx");
        }
    }
}