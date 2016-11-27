using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PryDesempeñoEmpleados.Presentacion
{
    public partial class PaginaPrincipal : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                this.btnAdmin.Visible = false;
            }
        }


        protected void btnAdmi_Click(object sender, ImageClickEventArgs e)
        {
            Server.Transfer("Administrador.aspx");
        }
       
    }
}