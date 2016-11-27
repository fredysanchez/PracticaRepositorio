using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PryDesempeñoEmpleados.Presentacion;
using PryDesempeñoEmpleados.Comun;
using PryDesempeñoEmpleados.Negocio;

namespace PryDesempeñoEmpleados.Presentacion
{
    public partial class imagen : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Ng_ClsEmpleado ng_empleado = new Ng_ClsEmpleado();
            Cm_ClsEmpleado cm_empleado = ng_empleado.ListarPorId(Convert.ToInt16(Request.QueryString["Id"]));
            if (cm_empleado.Fotografia != null)
            {
               
                Response.ContentType = "image/jpeg";
                Response.Expires = 0;
                Response.Buffer = true;
                Response.Clear();
                Response.BinaryWrite(cm_empleado.Fotografia);
                string Foto = Convert.ToBase64String(cm_empleado.Fotografia);
                Image1.ImageUrl = "image/jpeg" + Foto;
                Response.End();
            }

        }
    }
}