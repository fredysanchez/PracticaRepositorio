using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class _Default : System.Web.UI.Page{
    protected void Page_Load(object sender, EventArgs e){
        GrViewPasteles();
    }

    #region AdicionalBTN
    protected void gv_RowCommand(object sender, GridViewCommandEventArgs e){

    }
    protected void ln1_Click(object sender, EventArgs e){

    }
    protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e){

    }
    protected void gr2_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e){

    }
    protected void txtUrl_TextChanged(object sender, EventArgs e){

    }
    protected void txtNombre_TextChanged(object sender, EventArgs e){

    }
    #endregion

    public DataTable GrViewPasteles(){
        //Creacion de la gridView
        DataTable gridview = new DataTable();

        gridview.Columns.Add("Pastel", typeof(String));
        gridview.Columns.Add("Nombre", typeof(String));
        gridview.Columns.Add("Precio", typeof(double));

        DataRow Fila1;
        DataRow Fila2;
        DataRow Fila3;

        Fila1 = gridview.NewRow();
        Fila2 = gridview.NewRow();
        Fila3 = gridview.NewRow();

        //Datos quemados
        Fila1["Pastel"] = "<img width=200 heigth=200 src=" + "http://orig12.deviantart.net/1926/f/2012/289/4/2/choco_cake_by_kurodot-d5e7mxv.jpg" + ">";
        Fila1["Nombre"] = "Chococake";
        Fila1["Precio"] = 25.65;
        Fila2["Pastel"] = "<img width=200 heigth=200 src=" + "https://s-media-cache-ak0.pinimg.com/originals/0e/1a/8d/0e1a8d8d0423173da0ab853f83dac33a.jpg" + ">";
        Fila2["Nombre"] = "Pay de Manzana";
        Fila2["Precio"] = 14.95;
        Fila3["Pastel"] = "<img width=200 heigth=200 src=" + "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRul1nlGvg6fL26nmOELYHgIaQpnuFRWfNccffPeWoD4MXSUxp0bQ" + ">";
        Fila3["Nombre"] = "Galletas";
        Fila3["Precio"] = 11.65;

        gridview.Rows.Add(Fila1);
        gridview.Rows.Add(Fila2);
        gridview.Rows.Add(Fila3);

        gr2.DataSource = gridview;
        gr2.DataBind();

        return gridview;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        String nombreGr = txtNombre.Text;
        String urlGr = txtUrl.Text;
        Double precioGr = Convert.ToDouble(txtPrecio.Text);

        ClsProducto objproducto2 = new ClsProducto(nombreGr, urlGr, precioGr);
        if (Session["gridview"] == null)
        {
            DataTable gridview = GrViewPasteles();
            DataRow Row1;
            Row1 = gridview.NewRow();
            Row1["Pastel"] = objproducto2.recuperarImagen();
            Row1["Nombre"] = objproducto2.Nombre;
            Row1["Precio"] = objproducto2.Precio;
            gridview.Rows.Add(Row1);
            gr2.DataSource = gridview;
            gr2.DataBind();
            Session["gridview"] = gridview;
        }
        else
        {
            DataTable gridview = (Session["gridview"]) as DataTable;
            DataRow Row1;
            Row1 = gridview.NewRow();
            Row1["Pastel"] = objproducto2.recuperarImagen();
            Row1["Nombre"] = objproducto2.Nombre;
            Row1["Precio"] = objproducto2.Precio;
            gridview.Rows.Add(Row1);
            gr2.DataSource = gridview;
            gr2.DataBind();
            Session["gridview"] = gridview;
        }

        Limpiar();
    }

    public void Limpiar()
    {
        this.txtNombre.Text = "";
        this.txtPrecio.Text = "";
        this.txtUrl.Text = "";
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "AddToCart")
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = gr2.Rows[index];
        }

    }
    
}