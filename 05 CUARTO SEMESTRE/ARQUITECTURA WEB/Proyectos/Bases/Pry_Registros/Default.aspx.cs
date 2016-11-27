using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    static List<ClsProducto> lstproductos = new List<ClsProducto>();
    static int id = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        listarProducto();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        ClsProducto objproducto = new ClsProducto(id, this.txtnombre.Text, txturl.Text);
        lstproductos.Add(objproducto);
        id++;
        listarProducto();
        this.txtnombre.Text = "";
        this.txturl.Text = "";
    }

    public void listarProducto()
    {
        mostarprod.InnerHtml = " ";
        String lista = " ";
        foreach(ClsProducto producto in lstproductos){
            lista = lista + producto.escribirHTML();
        }
        mostarprod.InnerHtml = lista;
        grvProducto.DataSource = lstproductos;
        grvProducto.DataBind();

        if (grvProducto.HeaderRow != null && grvProducto.HeaderRow.Cells.Count > 0)
        {
            grvProducto.HeaderRow.Cells[1].Visible = false;
            grvProducto.HeaderRow.Cells[2].Visible = false;
        }
        foreach (GridViewRow row in grvProducto.Rows)
        {
            row.Cells[1].Visible = false;
            row.Cells[2].Visible = false;
        }
    }
    protected void btnmostrar_Click(object sender, ImageClickEventArgs e)
    {
        Session.Add("Productos", lstproductos);
        Server.Transfer("Lista.aspx");
    }
}