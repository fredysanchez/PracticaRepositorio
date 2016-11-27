using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    static ClsProdcuto[] listaProductos = new ClsProdcuto[10];
    static int i = 0;
    //protected void Page_Load(object sender, EventArgs e)
    //{
    //    ClsProdcuto objproducto = new ClsProdcuto("CheeseCake", "http://images.sweetauthoring.com/recipe/51_593.jpg", 20.00);
    //    //Response.Write(objproducto.escribirHTML());
    //    objproducto.PrecioCambio += objproducto.changeDetected;
    //    objproducto.Precio = objproducto.Precio * 2;
    //    Response.Write(objproducto.escribirHTML());
    //}
    protected void btningresar_Click(object sender, EventArgs e)
    {
        String nombre1 = txtnombre.Text;
        String imgUrl1 = txtimgUrl.Text;
        double precio1 = Convert.ToDouble(txtprecio.Text);

        ClsProdcuto objproducto = new ClsProdcuto(nombre1, imgUrl1, precio1);
        //Response.Write(objproducto.escribirHTML());
        //objproducto.PrecioCambio += objproducto.changeDetected;
        //objproducto.Precio = objproducto.Precio * 2;
        lblresultado.Text=objproducto.escribirHTML();
        listaProductos[i] = objproducto;
        imprimir(i);
        i++;
    }
    public void imprimir(int tamaño)
    {
        for (int j = 0; j < tamaño; j++)
        {
            Response.Write(listaProductos[j].escribirHTML());
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {

    }

   
}