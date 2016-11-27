using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class inicion : System.Web.UI.Page
{
    static List<ClsMedicamentos> lstmedicamentos = new List<ClsMedicamentos>();
    static int j = 5;

    static int var = 1;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (var.Equals(1))
        {
            Dtos();
            var++;
        }
        bloquear1();
        bloquear2();
        if (!IsPostBack)
        {
            if (lstmedicamentos != null)
            {
                this.ddl1.AutoPostBack = true;
                this.ddl2.AutoPostBack = true;
                Agregar1();
                Agregar2();
            }
        }
    }

    public void Agregar1()
    {
        this.ddl1.DataSource = lstmedicamentos;
        this.ddl1.DataValueField = "IdM";
        this.ddl1.DataTextField = "Nombre";
        this.ddl1.DataBind();
    }

    public void Agregar2()
    {
        this.ddl2.DataSource = lstmedicamentos;
        this.ddl2.DataValueField = "IdM";
        this.ddl2.DataTextField = "Nombre";
        this.ddl2.DataBind();
    }

    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {

    }
    protected void btnguardar_Click(object sender, EventArgs e)
    {
        Double  dosis= Convert.ToDouble(this.txtdosis.Text);
        Double  gramos=Convert.ToDouble(this.txtgramos.Text);
        Double  costo=Convert.ToDouble(this.txtcosto.Text);

        ClsMedicamentos objmedicamento = new ClsMedicamentos(j, this.txtnombre.Text, txturl.Text,dosis,gramos ,costo );
        lstmedicamentos.Add(objmedicamento);
        Agregar1();
        Agregar2();
       
        j++;
    }

    public void PasarDatos1()
    {
        this.txtnombre1.Text = lstmedicamentos[ddl1.SelectedIndex].Nombre;
        this.lblimg1.Text = lstmedicamentos[ddl1.SelectedIndex].recuperarImagen();
        this.txtdosis1.Text = Convert.ToString(lstmedicamentos[ddl1.SelectedIndex].Dosis);
        this.txtgramos1.Text = Convert.ToString(lstmedicamentos[ddl1.SelectedIndex].Gramos);
        this.txtcosto1.Text = Convert.ToString(lstmedicamentos[ddl1.SelectedIndex].Costo);
    }
    
        public void PasarDatos2()
    {
        this.txtnombre2.Text = lstmedicamentos[ddl2.SelectedIndex].Nombre;
        this.lblimg2.Text = lstmedicamentos[ddl2.SelectedIndex].recuperarImagen();
        this.txtdosis2.Text = Convert.ToString( lstmedicamentos[ddl2.SelectedIndex].Dosis);
        this.txtgramos2.Text = Convert.ToString(lstmedicamentos[ddl2.SelectedIndex].Gramos);
        this.txtcosto2.Text = Convert.ToString(lstmedicamentos[ddl2.SelectedIndex].Costo);
    }
        public void bloquear1()
        {
            this.txtnombre1.Enabled = false;
            this.lblimg1.Enabled = false;
            this.txtdosis1.Enabled = false;
            this.txtgramos1.Enabled = false;
            this.txtcosto1.Enabled = false;
        }

    public void bloquear2(){
        this.txtnombre2.Enabled = false;
        this.lblimg2.Enabled = false;
        this.txtdosis2.Enabled = false;
        this.txtgramos2.Enabled = false;
        this.txtcosto2.Enabled = false;
    }

    public Boolean validad(){
        Boolean ok = true;
        if (lstmedicamentos[ddl1.SelectedIndex].IdM.Equals(lstmedicamentos[ddl2.SelectedIndex].IdM)) {
            ok = false;
        }
        return ok;
    }
    protected void ddl1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (validad()) {
            PasarDatos1();
            PasarDatos2();
        }
        else
        {
            this.lblm1.Text = "No se compara mismos medicamentos";
        }
    }
    protected void ddl2_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (validad())
        {
            PasarDatos1();
            PasarDatos2();
        }
        else {
            this.lblm2.Text = "No se compara mismos medicamentos";
        }
    }
    protected void btncomparar_Click(object sender, EventArgs e)
    {
        Double cp = Convert.ToDouble( this.txtcatnp.Text);
        Double np = Convert.ToDouble(this.txtnuevom.Text);
        Double sol = 0;
        Double precio1 = lstmedicamentos[ddl1.SelectedIndex].Costo *cp;
        Double precio2 = lstmedicamentos[ddl2.SelectedIndex].Costo *cp;

        Double precio_1 = lstmedicamentos[ddl1.SelectedIndex].Costo *(cp- np);
        Double precio_2 = lstmedicamentos[ddl2.SelectedIndex].Costo * (cp - np);

        if (precio_1 > precio_2)
        {
            sol = precio_1 - precio_2;
        }
        else {
            sol = precio_2 - precio_1;
        }
        lblmsg.Text =Convert.ToString("Ahorro  ->> "+(sol)+"  %");
    }

    public void Dtos() {

        ClsMedicamentos objmedicamento1 = new ClsMedicamentos(0, "Finalin", "http://www.industriasomega.com/uploads/content/2014/02/finalin_forte_1392822005.jpg", 3, 12.5, 2.52);
        ClsMedicamentos objmedicamento2 = new ClsMedicamentos(1, "Aspirina", "http://cdn_recetas.s3.amazonaws.com/wp-content/uploads/2015/06/aspirina.jpg", 2, 10, 2.40);
        ClsMedicamentos objmedicamento3 = new ClsMedicamentos(2, "Vaporex", "http://pimg.tradeindia.com/00394386/b/3/Dr-ZEE-HERBAL-VAPOREX-.jpg", 4, 11.25, 4.25);
        ClsMedicamentos objmedicamento4 = new ClsMedicamentos(3, "Catflam", "https://www.rxstars.net/wp-content/uploads/2015/04/Cataflam-50mg.jpg", 5, 20, 3.2552);
        ClsMedicamentos objmedicamento5 = new ClsMedicamentos(4, "Bisolvon", "https://www.bik-bik.es/img/product/367/900/900/bisolvon-2mg40ml-gotas-para-los-nintildeos.jpg", 4, 10, 6.52);
        lstmedicamentos.Add(objmedicamento1);
        lstmedicamentos.Add(objmedicamento2);
        lstmedicamentos.Add(objmedicamento3);
        lstmedicamentos.Add(objmedicamento4);
        lstmedicamentos.Add(objmedicamento5);
    
    }
}