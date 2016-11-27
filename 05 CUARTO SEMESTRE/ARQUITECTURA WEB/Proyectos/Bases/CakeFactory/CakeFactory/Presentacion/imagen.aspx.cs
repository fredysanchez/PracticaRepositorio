﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CakeFactory.Comun;
using CakeFactory.Negocio;

namespace CakeFactory.Presentacion
{
    public partial class imagen : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Ng_ClsPastel ng_pastel = new Ng_ClsPastel();
            Cm_ClsPastel cm_pastel = ng_pastel.obtenerPastelPorId(Convert.ToInt16(Request.QueryString["Id"]));
            if (cm_pastel.ByteImage != null)
            {
                Response.ContentType = "image/jpeg";
                Response.Expires = 0;
                Response.Buffer = true;
                Response.Clear();
                Response.BinaryWrite(cm_pastel.ByteImage);
                Response.End();
            }
        }
    }
}