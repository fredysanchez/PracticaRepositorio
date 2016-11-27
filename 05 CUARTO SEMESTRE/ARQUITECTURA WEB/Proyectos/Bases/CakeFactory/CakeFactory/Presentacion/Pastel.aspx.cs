using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using CakeFactory.Comun;
using System.Windows.Forms;
using CakeFactory.Negocio;

namespace CakeFactory.Presentacion
{
    public partial class Pastel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadGrid();
                loadDropDownList();
                drpPasteles.AutoPostBack = true;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if ((flufotoPastel.PostedFile!=null)&&(flufotoPastel.PostedFile.ContentLength > 0))
            {
                HttpPostedFile archivoImagen = flufotoPastel.PostedFile;
                Byte[] byteImage = new Byte [flufotoPastel.PostedFile.ContentLength];
                archivoImagen.InputStream.Read(byteImage,0,flufotoPastel.PostedFile.ContentLength);

                Ng_ClsPastel ng_pastel = new Ng_ClsPastel();
                if (ng_pastel.insertarPastel(txturl.Text, decimal.Parse(txtcosto.Text), txtdescrip.Text, byteImage) > 0)// ejecucion de manera correcta
                {
                    loadGrid();
                    loadDropDownList();
                    string script = @" <script type = 'text/javascript'>
                    alert ('Pastel Registrado! ');
                    </script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "Cake Factory", script, false);
                    clean();
                }
            }
            
        }

        private void loadGrid()
        {
            Ng_ClsPastel ng_pastel = new Ng_ClsPastel();
            grvpasteles.DataSource = ng_pastel.obtenerPasteles();
            grvpasteles.DataBind();
        }

        private void clean()
        {
            txturl.Text = null;
            txtcosto.Text = null;
            txtdescrip.Text = null;
        }

        private void loadDropDownList()
        {
            Ng_ClsPastel ng_pastel = new Ng_ClsPastel();
            drpPasteles.DataSource = ng_pastel.obtenerPasteles();
            drpPasteles.DataValueField ="id_pas";
            drpPasteles.DataTextField = "descripcion_pas";
            drpPasteles.DataBind();
        }

        protected void drpPasteles_TextChanged(object sender, EventArgs e)
        {
            Ng_ClsPastel ng_pastel = new Ng_ClsPastel();
            Cm_ClsPastel cm_pastel = ng_pastel.obtenerPastelPorId(Convert.ToInt16(drpPasteles.SelectedValue));

            mostrarDatos(cm_pastel);
        }

        private void mostrarDatos(Cm_ClsPastel cm_pastel)
        {
            txturl.Text = cm_pastel.Url_pas;
            txtcosto.Text = cm_pastel.Costo_pas.ToString();
            txtdescrip.Text = cm_pastel.Descripcion_pas;

            lblnombreP.Text = "Descripcion: " + cm_pastel.Descripcion_pas;
            lblcostoP.Text = "$ " + cm_pastel.Costo_pas.ToString();
            imagenP.ImageUrl = "http://localhost:50595/Presentacion/imagen.aspx?ID=" + drpPasteles.SelectedValue;

        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            Ng_ClsPastel ng_pastel = new Ng_ClsPastel();
            if (ng_pastel.actualizarPastel(Convert.ToInt16(drpPasteles.SelectedValue),txturl.Text, decimal.Parse(txtcosto.Text), txtdescrip.Text) > 0)// ejecucion de manera correcta
            {
                loadGrid();
                loadDropDownList();
                string script = @" <script type = 'text/javascript'>
                alert ('Pastel Actualizado! ');
                </script>";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Cake Factory", script,false);
                clean();
                
            }
        }
    }
}