using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class listar : System.Web.UI.Page
{
    static List<ClsRecetas> lstrecetas = new List<ClsRecetas>();
    static List<ClsChef> lstChef = new List<ClsChef>();
    protected void Page_Load(object sender, EventArgs e)
    {
        lstrecetas = (List<ClsRecetas>)(Session["Recetas"]);
        lstChef = (List<ClsChef>)(Session["Chefs"]);

        if (!IsPostBack)
        {
            if (lstrecetas != null)
            {
                Mostrar();
                ddlchef.AutoPostBack = true;
                Imprimir();
            }
        }
    }
    public void Mostrar()
    {
        this.ddlchef.DataSource = lstrecetas;
        this.ddlchef.DataValueField = "Id";
        this.ddlchef.DataSource = lstChef;
        this.ddlchef.DataTextField = "Nombre";
        this.ddlchef.DataBind();
    }
    protected void btmProd_SelectedIndexChanged(object sender, EventArgs e)
    {
        Imprimir();
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Server.Transfer("inicio.aspx");
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Server.Transfer("registrar.aspx");
    }
    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        Server.Transfer("listar.aspx");
    }
    public void Imprimir()
    {
        mostrarreceta.InnerHtml = " ";
        String lista = " ";
        foreach (ClsRecetas recetas in lstrecetas)
        {
            if (recetas.IdChef.Equals(ddlchef.SelectedIndex))
            {
                lista = lista + recetas.mostrarReceta();
            }
        }
        mostrarreceta.InnerHtml = lista;
    }
}