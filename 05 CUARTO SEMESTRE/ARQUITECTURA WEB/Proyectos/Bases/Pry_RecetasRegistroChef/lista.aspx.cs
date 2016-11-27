using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class lista : System.Web.UI.Page
{
    static List<ClsChef> lstChef = new List<ClsChef>();
    protected void Page_Load(object sender, EventArgs e)
    {
        lstChef = (List<ClsChef>)(Session["ClsChef"]);

        if (!IsPostBack)
        {
            if (lstChef != null)
            {
                listar();
                drlChefD.AutoPostBack = true;
               //mostrarChef.InnerHtml = lstChef[0].escribirHTMLChef();
             
        
            }

        }
        listar();
    }

    private void listar()
    {

        drlChefD.DataSource = lstChef;
        drlChefD.DataValueField = "Id";
        drlChefD.DataTextField = "Nombre"; // tiene relacion con los setters y getter
        drlChefD.DataBind();
    }
   /* protected void drlproductos_TextChanged(object sender, EventArgs e)
    {
        Response.Write("evento");
        Response.Write(drlChefD.SelectedValue);
        Response.Write(lstChef[Convert.ToInt16(drlChefD.SelectedValue)].escribirHTMLChef());
        mostrarChef.InnerHtml = lstChef[Convert.ToInt16(drlChefD.SelectedValue)].escribirHTMLChef();
    }

  
    protected void drlChefD_SelectedIndexChanged(object sender, EventArgs e)
    {
        Response.Write("evento");
        Response.Write(drlChefD.SelectedValue);
        Response.Write(lstChef[Convert.ToInt16(drlChefD.SelectedValue)].escribirHTMLChef());
        mostrarChef.InnerHtml = lstChef[Convert.ToInt16(drlChefD.SelectedValue)].escribirHTMLChef();

    }*/

    protected void drlChefD_TextChanged(object sender, EventArgs e)
    {
       /* Response.Write("evento");
        Response.Write(drlChefD.SelectedValue);
        Response.Write(lstChef[Convert.ToInt16(drlChefD.SelectedValue)].escribirHTMLChef());
        mostrarChef.InnerHtml = lstChef[Convert.ToInt16(drlChefD.SelectedValue)].escribirHTMLChef();*/

      //  mostrarChef.InnerHtml = lstChef[1].escribirHTMLChef();
        int a = Convert.ToInt16(drlChefD.SelectedValue);
      
          
                 mostrarChef.InnerHtml = lstChef[a].escribirHTMLChef();
            
        
    }
}