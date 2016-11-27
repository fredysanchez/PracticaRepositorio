using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using CakeFactory.Comun;
using CakeFactory.Negocio;

namespace CakeFactory.Presentasion
{
    public partial class Pastel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnregistrar_Click(object sender, EventArgs e)
        {
            Ng_ClsPastel ngPastel = new Ng_ClsPastel();
            if (ngPastel.insertarPastel(txturl.Text,Decimal.Parse(txtcosto.Text),txtdes.Text)>0){
               
            }
        }
    }
}