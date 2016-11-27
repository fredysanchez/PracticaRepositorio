using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class listar : System.Web.UI.Page
{
    static List<ClsChef> lstchef = new List<ClsChef>();
    static List<ClsReceta> lstrecetas = new List<ClsReceta>();

    protected void Page_Load(object sender, EventArgs e)
    {
        lstchef = (List<ClsChef>)(Session["Chefs"]);
        lstrecetas = (List<ClsReceta>)(Session["Recetas"]);
        if (!IsPostBack)
        {
            if (lstchef != null && lstrecetas != null)
            {
                mostrar();
                dropChefs.AutoPostBack = true;
            }
        }
        
    }
    protected void dropChefs_TextChanged(object sender, EventArgs e)
    {
        for (int i = 0; i < lstrecetas.Count; i++)
        {
            if (lstrecetas[i].IdChef.Equals(Convert.ToInt16(dropChefs.SelectedValue)))
            {
                MostrarRecetas.InnerHtml = lstrecetas[i].Nombre + lstrecetas[i].impresioHtmlIngredientes() +
                    lstrecetas[i].impresioHtmlInstrucciones() + lstrecetas[i].impresionChef(lstchef);
            }
        }
    }
    public void mostrar()
    {
        dropChefs.DataSource = lstchef;
        dropChefs.DataValueField = "Id";
        dropChefs.DataTextField = "Nombre";
        dropChefs.DataBind();
    }

}