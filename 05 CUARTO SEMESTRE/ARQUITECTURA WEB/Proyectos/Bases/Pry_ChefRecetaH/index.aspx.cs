using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class index : System.Web.UI.Page
{
    static int id1 = 0;
    static int id2 = 0;
    static int idInst;
    static int idIngre;
    static int idChef;
    static int n = 0;
    static int n1 = 0;
    //static List<ClsIngredientes> lstingredientes1 = new List<ClsIngredientes>();
    //static List<ClsInstrucciones> lstinstrucciones1 = new List<ClsInstrucciones>();
    static ClsIngredientes lst;
    static ClsInstrucciones lst1;
    static List<String> lstingredientes = new List<String>();
    static List<String> lstinstrucciones = new List<String>();
    static List<ClsChef> lstchef = new List<ClsChef>();
    static List<ClsReceta> lstrecetas= new List<ClsReceta>();
   
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            llenar();
            dropResetas.AutoPostBack = true;
            dropResetas.Items.Clear();
            mostrar();
        }
        //mostrar();
        panelRecep.Visible = false;
    }

    protected void IngresoChef(object sender, EventArgs e)
    {
        ClsChef chef = new ClsChef(id1,txtnombre.Text,txtapel.Text,txtciu.Text);
        lstchef.Add(chef);
        mostrar();
        id1++;
    }

    public void mostrar()
    {
        dropResetas.DataSource = lstchef;
        dropResetas.DataValueField = "Id";
        dropResetas.DataTextField = "Nombre";
        dropResetas.DataBind();
    }
    protected void SeleccionChef(object sender, EventArgs e)
    {
        idChef = Convert.ToInt16(dropResetas.SelectedValue);
        panelRecep.Visible = true;
        //lstingredientes = new List<String>();
        //lstinstrucciones = new List<String>();
    }
    protected void CapturarNumeroInstrucciones(object sender, ImageClickEventArgs e)
    {
        idInst = Convert.ToInt16(txtinstrucN.Text);
        panelRecep.Visible = true;
    }
    protected void CapturarNumeroIngredientes(object sender, ImageClickEventArgs e)
    {
        idIngre = Convert.ToInt16(txtingredN.Text);
        panelRecep.Visible = true;
    }
    protected void IngresarIngrediente(object sender, EventArgs e)
    {
        panelRecep.Visible = true;
        if ( n < idIngre)
        {
            lstingredientes.Add(txtIngredP.Text);
            n++;
        }
        else
        {
            lst = new ClsIngredientes(lstingredientes);
            //lstingredientes1.Add(lst);
        }
        
    }
    protected void IngrearInstrucciones(object sender, EventArgs e)
    {
        panelRecep.Visible = true;
        if (n1 < idInst)
        {
            lstinstrucciones.Add(txtInstrucP.Text);
            n1++;
        }
        else
        {
             lst1 = new ClsInstrucciones(lstinstrucciones);
            //lstinstrucciones1.Add(lst1);
        }

    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        ClsReceta receta = new ClsReceta(id2,txtnombrePastel.Text,lst.Lstingredientes,lst1.Lstinstrucciones,idChef);
        lstrecetas.Add(receta);
        id2++;
        for (int i = 0; i < lstrecetas.Count; i++)
        {
            Response.Write(lstrecetas[i].Nombre + lstrecetas[i].impresioHtmlIngredientes() +
                lstrecetas[i].impresioHtmlInstrucciones() + lstrecetas[i].impresionChef(lstchef));
        }
        //lstingredientes1= new List<ClsIngredientes>();
        //lstinstrucciones1= new List<ClsInstrucciones>();
        
    }
    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        // lo que manda
        Session.Add("Chefs", lstchef);
        Session.Add("Recetas", lstrecetas);
        // a donde manda
        Server.Transfer("listar.aspx");

    }

    public void llenar()
    {
        ClsChef chef1 = new ClsChef(0, "Gabriel", "Perez", "Guayaquil");
        ClsChef chef2 = new ClsChef(1, "Juan", "Yepez", "Manta");
        ClsChef chef3 = new ClsChef(2, "Luis", "Nuñez", "Portoviejo");
        ClsChef chef4 = new ClsChef(3, "Omar", "Lopez", "Esmeraldas");
        ClsChef chef5 = new ClsChef(4, "Jim", "White", "Pastaza");
        String lingr1 = "2 tazas de azúcar estándar";
        String lingr2 = "1 3/4 tazas de harina";
        String lingr3 = "3/4 taza de cocoa en polvo";
        String lingr4 = "1 1/2 cucharaditas de polvo para hornear";
        String lingr5 = "1 1/2 cucharaditas de bicarbonato de sodio";
        String lingr6 = "1 cucharadita de sal";
        String lingr7 = "2 huevos";
        String lingr8 = "1 taza de leche";
        String lingr9 = "1/2 taza de aceite vegetal";
        String lingr10 = "2 cucharaditas de esecia de vainilla";
        String lingr11 = "1 taza de agua hirviendo";

        String Iinstr1 = "Precalienta el horno a 180 ºC. Engrasa y enharina 2 moldes redondos medianos.";
        String Iinstr2 = "En un tazón grande, mezcla el azúcar, harina, cocoa, polvo para hornear, bicarbonato de sodio y sal. Forma un pozo en el centro y agrega los huevos, leche, aceite y vainilla. Bate durante 2 minutos con batidora eléctrica a velocidad media. Incorpora la taza de agua hirviendo. La masa estará aguada, pero es normal.";
        String Iinstr3 = "Vierte dentro de los moldes y hornea de 30 a 35 minutos, o hasta que pasen la prueba del palillo. Deja enfriar durante 10 minutos dentro de los moldes, luego desmolda y coloca sobre una rejilla para que enfríen completamente.";
        lstingredientes.Add(lingr1);
        lstingredientes.Add(lingr2);
        lstingredientes.Add(lingr3);
        lstingredientes.Add(lingr4);
        lstingredientes.Add(lingr5);
        lstingredientes.Add(lingr6);
        lstingredientes.Add(lingr7);
        lstingredientes.Add(lingr8);
        lstingredientes.Add(lingr9);
        lstingredientes.Add(lingr10);
        lstingredientes.Add(lingr11);

        lstinstrucciones.Add(Iinstr1);
        lstinstrucciones.Add(Iinstr2);
        lstinstrucciones.Add(Iinstr3);

        lstchef.Add(chef1);
        lstchef.Add(chef2);
        lstchef.Add(chef3);
        lstchef.Add(chef4);
        lstchef.Add(chef5);
        ClsReceta recipe = new ClsReceta(0, "Cupcakes de chocolate", lstingredientes, lstinstrucciones, 0);
        lstrecetas.Add(recipe);
    }
}