using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page{

    //Conexion a Base de datos.
    SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=F:\ \WebSite2\App_Data\Database.mdf;Integrated Security=True;User Instance=True");
    //Instancia de la lista del productos de 10 elementos.
    static ClsProducto[] listaProductos = new ClsProducto[10];
    static int i = 0;

    protected void Page_Load(object sender, EventArgs e){
        /*
        ClsProducto objproducto = new ClsProducto("Torta", "http://img.fiesta101.com.s3.amazonaws.com/wp-content/uploads/2011/08/torta1.jpg", 20.00);
        Response.Write(objproducto.escribirHTML());
        objproducto.PrecioCambio += objproducto.changeDetected; //liga el evento al delegate
        objproducto.Precio = objproducto.Precio * 2;
        Response.Write(objproducto.escribirHTML());
        */
    }
              
    protected void  btnIngresar_Click(object sender, EventArgs e){
        //Alamcenamiento del los valores de los txt.
        String nombreList=txtNombre.Text;
        String urlList=txtUrl.Text;
        Double precioList=Convert.ToDouble(txtPrecio.Text);
        //Creacion de un objeto producto.
        ClsProducto objproducto = new ClsProducto(nombreList,urlList,precioList);
        lblnombre.Text = objproducto.Nombre;
        lblprecio.Text = "Precio: $ "+objproducto.Precio.ToString();
        imgpastel.ImageUrl = objproducto.Imgurl;
        
        listaProductos[i] = objproducto;
        imprimirProductos(i);
        i++;
    }

    public void imprimirProductos(int tamaño){
        for (int j = 0; j <= tamaño; j ++ )
            Response.Write(listaProductos[j].escribirHTML());  
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
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    #endregion

   
    protected void B1_Click(object sender, EventArgs e){
        //Almacenamiento en la base de datos.
        con.Open();
        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "insert into table5 values('" + T1.Text + "','" + T2.Text + "')";
        cmd.ExecuteNonQuery();
        con.Close();
        Response.Redirect("Default.aspx");
    }
   
    public DataTable GrViewPasteles(){
        //Creacion de la gridView
        DataTable gridview = new DataTable();
        gridview.Columns.Add("Pastel", typeof(String));
        gridview.Columns.Add("Nombre", typeof(String));
        gridview.Columns.Add("Precio", typeof(String));

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
    }

}