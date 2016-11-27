using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;

public partial class recetas : System.Web.UI.Page
{
    static List<ClsChef> lstchef = new List<ClsChef>();
    static List<ClsRecetas> lstreceta = new List<ClsRecetas>();

    static int i = 6;
    static int j = 8;
    static int var = 1;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (var.Equals(1)) {
            IngresoDatosQuemados();
            var++;
        }
        
        if (!IsPostBack)
        {
            if (lstchef != null)
            {
                this.ddlchef.AutoPostBack = true;
                Agregar();
                PasarDatos();
            }
        }
    }

    public void Agregar()
    {
        this.ddlchef.DataSource = lstchef;
        this.ddlchef.DataValueField = "Id";
        this.ddlchef.DataTextField = "Nombre";
        this.ddlchef.DataBind();
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Server.Transfer("inicio.aspx");
    }
    protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
    {
       
    }
  
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Server.Transfer("registrar.aspx");
    }
    protected void ddlchef_SelectedIndexChanged(object sender, EventArgs e)
    {
        PasarDatos();
    }
    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        Session.Add("Recetas", lstreceta);
        Session.Add("Chefs", lstchef);
        Server.Transfer("listar.aspx");
    }
    protected void btnreceta_Click(object sender, EventArgs e)
    {
        if (ValidadReceta())
        {
            ClsRecetas objreceta = new ClsRecetas(j, txtreceta.Text, txturl.Text, txta1.Value, txta2.Value, ddlchef.SelectedIndex);
            lstreceta.Add(objreceta);
            j++;
            LimpiarReceta();
        }
    }
    protected void txtreceta_TextChanged(object sender, EventArgs e)
    {

    }
    protected void btningresarchef_Click(object sender, EventArgs e)
    {
        if(ValidadChef()){
            ClsChef objchef = new ClsChef(i, txtnombre.Text, txtcorreo.Text);
            lstchef.Add(objchef);
            i++;
            Agregar();
            PasarDatos();
            LimpiarChef();
        }

    }
    protected void txtnombre_TextChanged(object sender, EventArgs e)
    {

    }
    protected void txtcorreo_TextChanged(object sender, EventArgs e)
    {

    }
    public void IngresoDatosQuemados()
    {
        ClsChef chef1 = new ClsChef(0, "Carlo Cevallos", "Carlos@gmail.com");
        ClsChef chef2 = new ClsChef(1, "Esteban Castro", "Esteban@hotmail.com");
        ClsChef chef3 = new ClsChef(2, "Mariana Estrada", "Marian@yahoo.com");
        ClsChef chef4 = new ClsChef(3, "Estefania Lopez", "teffa@yahoo.com");
        ClsChef chef5 = new ClsChef(4, "Carolina Herrera", "Carolina@gmail.com");
        ClsChef chef6 = new ClsChef(5, "Fredy Sanchez", "Fredy@gmail.com");

        String Ingredientes1 = "2 tazas de azúcar estándar<br>1 3/4 tazas de harina <br>3/4 taza de cocoa en polvo <br> 1 1/2 cucharaditas de polvo para hornear <br>1 1/2 cucharaditas de bicarbonato de sodio<br>1 cucharadita de sal<br>2 huevos";
        String Instrucciones1 = "Precalienta el horno a 180 ºC. Engrasa y enharina 2 moldes redondos medianos. <br>En un tazón grande, mezcla el azúcar, harina, cocoa, polvo para hornear, bicarbonato de sodio y sal. Forma un pozo en el centro y agrega los huevos, leche, aceite y vainilla. Bate durante 2 minutos con batidora eléctrica a velocidad media. Incorpora la taza de agua hirviendo. La masa estará aguada, pero es normal.<br>Vierte dentro de los moldes y hornea de 30 a 35 minutos, o hasta que pasen la prueba del palillo. Deja enfriar durante 10 minutos dentro de los moldes, luego desmolda y coloca sobre una rejilla para que enfríen completamente.";

        String Ingredientes2 = "1 3/4 tazas de harina <br>3/4 taza de cocoa en polvo <br> 1 1/2 cucharaditas de polvo para hornear <br>1 1/2 cucharaditas de bicarbonato de sodio <br>1 cucharadita de sal<br>2 huevos";
        String Instrucciones2 = "Engrasa y enharina 2 moldes redondos medianos. <br>En un tazón grande, mezcla el azúcar, harina, cocoa, polvo para hornear, bicarbonato de sodio y sal. Forma un pozo en el centro y agrega los huevos, leche, aceite y vainilla. Bate durante 2 minutos con batidora eléctrica a velocidad media. Incorpora la taza de agua hirviendo. La masa estará aguada, pero es normal.<br>Vierte dentro de los moldes y hornea de 30 a 35 minutos, o hasta que pasen la prueba del palillo. Deja enfriar durante 10 minutos dentro de los moldes, luego desmolda y coloca sobre una rejilla para que enfríen completamente.";

        String Ingredientes3 = "1 libra de harina castilla<br>1 3/4 tazas de harina <br>3/4 taza de cocoa en polvo <br> 1 1/2 cucharaditas de polvo para hornear <br>1 1/2 cucharaditas de bicarbonato de sodio,<br>1 cucharadita de sal<br>2 huevos";
        String Instrucciones3 = "Batir y mezclar<br> Engrasa y enharina 2 moldes redondos medianos. <br>En un tazón grande, mezcla el azúcar, harina, cocoa, polvo para hornear, bicarbonato de sodio y sal. Forma un pozo en el centro y agrega los huevos, leche, aceite y vainilla. Bate durante 2 minutos con batidora eléctrica a velocidad media. Incorpora la taza de agua hirviendo. La masa estará aguada, pero es normal.<br>Vierte dentro de los moldes y hornea de 30 a 35 minutos, o hasta que pasen la prueba del palillo. Deja enfriar durante 10 minutos dentro de los moldes, luego desmolda y coloca sobre una rejilla para que enfríen completamente.";

        String Ingredientes4 = "2 litros de leche<br>1 3/4 tazas de harina <br>3/4 taza de cocoa en polvo <br> 1 1/2 cucharaditas de polvo para hornear <br>1 1/2 cucharaditas de bicarbonato de sodio <br>1 cucharadita de sal<br>2 huevos";
        String Instrucciones4 = "Horno a 180 ºC.<br> Engrasa y enharina 2 moldes redondos medianos. <br>En un tazón grande, mezcla el azúcar, harina, cocoa, polvo para hornear, bicarbonato de sodio y sal. Forma un pozo en el centro y agrega los huevos, leche, aceite y vainilla. Bate durante 2 minutos con batidora eléctrica a velocidad media. Incorpora la taza de agua hirviendo. La masa estará aguada, pero es normal.<br>Vierte dentro de los moldes y hornea de 30 a 35 minutos, o hasta que pasen la prueba del palillo. Deja enfriar durante 10 minutos dentro de los moldes, luego desmolda y coloca sobre una rejilla para que enfríen completamente.";

        String Ingredientes5 = "1 taza azúcar estándar<br>1 3/4 tazas de harina <br>3/4 taza de cocoa en polvo <br> 1 1/2 cucharaditas de polvo para hornear <br>1 1/2 cucharaditas de bicarbonato de sodio <br>1 cucharadita de sal<br>2 huevos";
        String Instrucciones5 = "Enharina 2 moldes redondos medianos. <br>En un tazón grande, mezcla el azúcar, harina, cocoa, polvo para hornear, bicarbonato de sodio y sal. Forma un pozo en el centro y agrega los huevos, leche, aceite y vainilla. Bate durante 2 minutos con batidora eléctrica a velocidad media. Incorpora la taza de agua hirviendo. La masa estará aguada, pero es normal.<br>Vierte dentro de los moldes y hornea de 30 a 35 minutos, o hasta que pasen la prueba del palillo. Deja enfriar durante 10 minutos dentro de los moldes, luego desmolda y coloca sobre una rejilla para que enfríen completamente.";

        String Ingredientes6 = "3/4 tazas de mantequilla <br>3/4 taza de cocoa en polvo <br> 1 1/2 cucharaditas de polvo para hornear <br>1 1/2 cucharaditas de bicarbonato de sodio,<br>1 cucharadita de sal<br>2 huevos";
        String Instrucciones6 = "Espesar los recipientes<br> Engrasa y enharina 2 moldes redondos medianos. <br>En un tazón grande, mezcla el azúcar, harina, cocoa, polvo para hornear, bicarbonato de sodio y sal. Forma un pozo en el centro y agrega los huevos, leche, aceite y vainilla. Bate durante 2 minutos con batidora eléctrica a velocidad media. Incorpora la taza de agua hirviendo. La masa estará aguada, pero es normal.<br>Vierte dentro de los moldes y hornea de 30 a 35 minutos, o hasta que pasen la prueba del palillo. Deja enfriar durante 10 minutos dentro de los moldes, luego desmolda y coloca sobre una rejilla para que enfríen completamente.";

        String Ingredientes7 = "6 Huevo de pavo<br>1 3/4 tazas de harina <br>3/4 taza de cocoa en polvo <br> 1 1/2 cucharaditas de polvo para hornear <br>1 1/2 cucharaditas de bicarbonato de sodio, <br>1 cucharadita de sal<br>2 huevos";
        String Instrucciones7 = "Preparar cocina 180 ºC. Engrasa y enharina 2 moldes redondos medianos. <br>En un tazón grande, mezcla el azúcar, harina, cocoa, polvo para hornear, bicarbonato de sodio y sal. Forma un pozo en el centro y agrega los huevos, leche, aceite y vainilla. Bate durante 2 minutos con batidora eléctrica a velocidad media. Incorpora la taza de agua hirviendo. La masa estará aguada, pero es normal.<br>Vierte dentro de los moldes y hornea de 30 a 35 minutos, o hasta que pasen la prueba del palillo. Deja enfriar durante 10 minutos dentro de los moldes, luego desmolda y coloca sobre una rejilla para que enfríen completamente.";

        String Ingredientes8 = "1 Panela<br>1 3/4 tazas de harina <br>3/4 taza de cocoa en polvo <br> 1 1/2 cucharaditas de polvo para hornear <br>1 1/2 cucharaditas de bicarbonato de sodio <br>1 cucharadita de sal<br>2 huevos";
        String Instrucciones8 = "Precalienta el horno a 180 ºC. Engrasa y enharina 2 moldes redondos medianos. <br>En un tazón grande, mezcla el azúcar, harina, cocoa, polvo para hornear, bicarbonato de sodio y sal. Forma un pozo en el centro y agrega los huevos, leche, aceite y vainilla. Bate durante 2 minutos con batidora eléctrica a velocidad media. Incorpora la taza de agua hirviendo. La masa estará aguada, pero es normal.<br>Vierte dentro de los moldes y hornea de 30 a 35 minutos, o hasta que pasen la prueba del palillo. Deja enfriar durante 10 minutos dentro de los moldes, luego desmolda y coloca sobre una rejilla para que enfríen completamente.";


        lstchef.Add(chef1);
        lstchef.Add(chef2);
        lstchef.Add(chef3);
        lstchef.Add(chef4);
        lstchef.Add(chef5);
        lstchef.Add(chef6);

        ClsRecetas receta1 = new ClsRecetas(0, "CheeseCaKe", "http://1.bp.blogspot.com/-hHfnWel0ekQ/UZMdBfGiadI/AAAAAAAAAF8/qUVX7huRpdI/s1600/Untitled-18.png", Ingredientes1, Instrucciones1, 0);
        ClsRecetas receta2 = new ClsRecetas(1, "Tarta de Mora", "http://2.bp.blogspot.com/_wpJUcPU80-U/TFMK8n_yjPI/AAAAAAAAAyg/Up8cBYdsHbE/s1600/food2.png", Ingredientes2, Instrucciones2, 0);
        ClsRecetas receta3 = new ClsRecetas(2, "Pastel de Maracuya", "http://1.bp.blogspot.com/_wpJUcPU80-U/TFMK85eEjXI/AAAAAAAAAyo/TACnAOz_ZuE/s200/food3.png", Ingredientes3, Instrucciones3, 1);
        ClsRecetas receta4 = new ClsRecetas(3, "Pay de Sandia", "http://1.bp.blogspot.com/-nNSifO2vkEQ/VXdNPZM6SzI/AAAAAAAA9a8/v38L3o3jk6U/s1600/NBW.png", Ingredientes4, Instrucciones4, 1);
        ClsRecetas receta5 = new ClsRecetas(4, "Ponkey", "http://4.bp.blogspot.com/-WIDl4ixPs7k/Tiwd-DpaEnI/AAAAAAAAAG0/0wTySUgxQCU/s1600/cake3.png", Ingredientes5, Instrucciones5, 2);
        ClsRecetas receta6 = new ClsRecetas(5, "Torta Mora", "http://4.bp.blogspot.com/-ioYdB-6L3Q0/T5i3oCj80iI/AAAAAAAAAAw/IcR9Qu8RDlY/s1600/moka+2.png", Ingredientes6, Instrucciones6, 3);
        ClsRecetas receta7 = new ClsRecetas(6, "Pastel Uva", "http://2.bp.blogspot.com/-pTE0L89CgBw/VZE9HATVrxI/AAAAAAABCiE/bX5-ivVzz8s/s1600/choco%2B1.png", Ingredientes7, Instrucciones7, 4);
        ClsRecetas receta8 = new ClsRecetas(7, "Empanadas", "http://vignette2.wikia.nocookie.net/chefville/images/b/b1/Recipe-Empanadas.png/revision/latest?cb=20121223073103", Ingredientes8, Instrucciones8, 5);

        lstreceta.Add(receta1);
        lstreceta.Add(receta2);
        lstreceta.Add(receta3);
        lstreceta.Add(receta4);
        lstreceta.Add(receta5);
        lstreceta.Add(receta6);
        lstreceta.Add(receta7);
        lstreceta.Add(receta8);
    }

    public void PasarDatos() {
        lblemail.Text = lstchef[ddlchef.SelectedIndex].Email;
        lblnombre.Text = lstchef[ddlchef.SelectedIndex].Nombre;
    }
    public Boolean  ValidadChef() {
        Boolean ok = true;
        if(this.txtnombre.Text.Equals("")||this.txtcorreo.Text.Equals("")){
            this.lblerror.Text = "Revisar el ingreso de datos";
            ok = false;
        }
        return ok;
    }

    public Boolean ValidadReceta()
    {
        Boolean ok = true;
        if (this.txta1.Value.Equals("") || this.txta2.Value.Equals("")||this.txtreceta.Text.Equals("")||this.txturl.Text.Equals(""))
        {
            this.lblerroreceta.Text = "Revisar el ingreso de la receta";
            ok = false;
        }
        return ok;
    }

    public void LimpiarChef()
    {
        this.txtnombre.Text = "";
        this.txtcorreo.Text = "";
    }
        public void LimpiarReceta(){
            this.txta1.Value="";
            this.txta2.Value="";
            this.txtreceta.Text="";
            this.txturl.Text = "";
        }
}