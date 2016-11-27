using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Lista : System.Web.UI.Page
{
    static List<ClsProducto> lstproductos = new List<ClsProducto>();

    protected void Page_Load(object sender, EventArgs e)
    {
        lstproductos = (List<ClsProducto>)(Session["Productos"]);
        
            if (!IsPostBack) {
                if (lstproductos != null) {
                    Mostrar();
                    drlproductos.AutoPostBack=true;
                    mostrarproducto.InnerHtml = lstproductos[0].escribirHTML();
                }
            }
    }
    public void Mostrar() { 
        this.drlproductos.DataSource=lstproductos;
         this.drlproductos.DataValueField="IdRecetas";
         this.drlproductos.DataTextField = "IdChef";
         this.drlproductos.DataBind();

    }
    protected void btmProd_SelectedIndexChanged(object sender, EventArgs e)
    {
        mostrarproducto.InnerHtml = lstproductos[Convert.ToInt16(drlproductos.SelectedValue)].escribirHTML();
    }
}