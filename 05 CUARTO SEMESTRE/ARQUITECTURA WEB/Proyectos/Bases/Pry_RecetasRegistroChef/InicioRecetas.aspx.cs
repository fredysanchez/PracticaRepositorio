using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class InicioRecetas : System.Web.UI.Page

{

    static List<ClsChef> lstChef = new List<ClsChef>();
    static List<ClsReceta> lstReceta = new List<ClsReceta>();
    static int contadorChef = 0; 

    //CHEF
    static int id =5;
    String nombre;
    String correo;

    //RECETA    
   static  int idR =5;
    String nombreR;
    String url;
    String ingredientes;
    String preparacion;
    int idChef;


    protected void Page_Load(object sender, EventArgs e)
    {



        if (!IsPostBack)
        { // ESTA CONDICION ES PARA QUE QUEME LOS DATOS UNA SOLO VEZ

            //Chef
            nombre = "Pepito";
            correo = "pepito@hotmail.com";

            //RECETAS
            nombreR = "Pastel de chocolate";
            url = "http://cdn2.recetasgratis.net/es/images/7/7/6/img_pastel_de_chocolate_esponjoso_10677_600.jpg";
            ingredientes = "2 huevos \n 1 libra de azucar \n 3 libras de harina";
            preparacion = " mezclar todo \n meter al horno \n disfrutarlo ";
            idChef = id;
            ClsChef chef1 = new ClsChef(id, nombre, correo);
            ClsReceta receta1 = new ClsReceta(idR, nombreR, url, ingredientes, preparacion, idChef);
            lstChef.Add(chef1);
            lstReceta.Add(receta1);


            //Chef
            nombre = "Juanito";
            correo = "pepito@hotmail.com";

            //RECETAS
           
            nombreR = "Pastel de chocolate";
            url = "http://cdn2.recetasgratis.net/es/images/7/7/6/img_pastel_de_chocolate_esponjoso_10677_600.jpg";
            ingredientes = "2 huevos \n 1 libra de azucar \n 3 libras de harina";
            preparacion = " mezclar todo \n meter al horno \n disfrutarlo ";
            idChef = id;
            ClsChef chef2 = new ClsChef(id, nombre, correo);
            ClsReceta receta2 = new ClsReceta(idR, nombreR, url, ingredientes, preparacion, idChef);
            lstChef.Add(chef2);
            lstReceta.Add(receta2);

            id = generarIdChef();
            idR = generarIdReceta();
        }
        else {

            idR = generarIdReceta();
        }

        listar();
        
        
    }

    protected void BtnRegistrar_Click(object sender, EventArgs e)
    {
        contadorChef = 0;
        id = generarIdChef();
        limpiarCamposChef();
        limpiarCamposReceta();
        desbloquearCampos();
    }

    protected void BtnGuardarReceta_Click(object sender, EventArgs e)
    {
        if (contadorChef == 0)
        {

            //CHEF
            nombre = txtNombreC.Text;
            correo = txtNombreC.Text;

            //RECETAS
            nombreR = txtNombreR.Text;
            url = txtUrl.Text;
            ingredientes = TextArea1.Value;
            preparacion = TextArea2.Value;

            ClsChef chef = new ClsChef(id, nombre, correo);
            ClsReceta receta = new ClsReceta(idR, nombreR, url, ingredientes, preparacion, id);
            lstChef.Add(chef);
            lstReceta.Add(receta);
            listar();
            bloquearCampos();
            limpiarCamposReceta();
            contadorChef++;
        }
        else {


            //RECETAS
 
            nombreR = txtNombreR.Text;
            url = txtUrl.Text;
            ingredientes = TextArea1.Value;
            preparacion = TextArea2.Value;

            ClsReceta receta = new ClsReceta(idR, nombreR, url, ingredientes, preparacion, id);
            lstReceta.Add(receta);
            limpiarCamposReceta();
        }
       

    }


    private void listar(){

        drlChef.DataSource=lstChef;
        drlChef.DataValueField="Id"; 
        drlChef.DataTextField="Nombre"; // tiene relacion con los setters y getter
        drlChef.DataBind();
    }

    private void limpiarCamposChef(){
        //CHEF
        txtNombreC.Text = "";
        txtCorreoC.Text = "";
    }

    private void limpiarCamposReceta() {

        //RECETA 
        txtNombreR.Text = "";
        txtUrl.Text = "";
        TextArea1.Value = "";
        TextArea2.Value = "";
    
    }

    private void bloquearCampos() {

        txtNombreC.Enabled = false;
        txtCorreoC.Enabled = false;
        txtIdC.Enabled = false;
    }

    private void desbloquearCampos() {

        txtNombreC.Enabled = true;
        txtCorreoC.Enabled = true;
       
    
    }


    public int generarIdChef() {
        id++;
        txtIdC.Text = Convert.ToString(id);
        txtIdC.Enabled = false;
        return id; 
    }

    public  int generarIdReceta()
    {
        idR++;
        txtIdR.Text = Convert.ToString(idR);
        txtIdR.Enabled = false;
        return idR;
    }


    protected void BtnListar_Click(object sender, EventArgs e)
    {
        Session.Add("ClsChef", lstChef);
        Server.Transfer("lista.aspx");
    }
}