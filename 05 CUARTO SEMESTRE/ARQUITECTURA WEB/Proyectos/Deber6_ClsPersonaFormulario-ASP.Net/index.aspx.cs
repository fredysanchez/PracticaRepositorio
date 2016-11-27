using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class index : System.Web.UI.Page
{
    protected void btningresar_Click(object sender, EventArgs e)
    {
        string nombre = txtnombre.Text;
        string apellido = txtapellido.Text;
        string cedula = txtcedula.Text;
        string telefono = txttelefono.Text;
        string direccion = txtdireccion.Text;
        ClsPersona pr1 = new ClsPersona(cedula,nombre,apellido,direccion,telefono);

        lbldatos.Text = pr1.Imprimir();
    }
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void txtnombre_TextChanged(object sender, EventArgs e)
    {

    }
}