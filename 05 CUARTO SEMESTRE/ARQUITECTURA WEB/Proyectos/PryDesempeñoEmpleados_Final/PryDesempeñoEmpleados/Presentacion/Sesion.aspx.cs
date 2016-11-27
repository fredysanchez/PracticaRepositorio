using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using PryDesempeñoEmpleados.Negocio;
using PryDesempeñoEmpleados.Datos;
using PryDesempeñoEmpleados.Comun;

namespace PryDesempeñoEmpleados.Presentacion
{
    public partial class Sesion : System.Web.UI.Page
    {
        Ng_ClsEmpleado ngEmpleado = new Ng_ClsEmpleado();
        Ng_ClsCargo ngcargo = new Ng_ClsCargo();
        Ng_ClsUnidad ngunidad = new Ng_ClsUnidad();
        Ng_ClsActividad ngactividad = new Ng_ClsActividad();
        static Cm_ClsEmpleado cmempleado = new Cm_ClsEmpleado();
        static Cm_ClsEmpleado cmemplSesion = new Cm_ClsEmpleado();

        string script = "";
        static bool salirSesion;

        protected void Page_Load(object sender, EventArgs e)
        {
            actualizar.Visible = false;
            baja.Visible = false;
            panelinfo.Visible = false;
            if (!salirSesion)
                cmemplSesion = (Cm_ClsEmpleado)(Session["Empleado"]);

            if (!IsPostBack)
            {

                ocultarDdls(false);
                salirSesion = false;

                if (cmemplSesion != null)
                {
                    this.panelinfo.Visible = true;
                    panelsesion.Visible = false;
                    mostrarDatos(cmemplSesion);
                   
                    if (cmemplSesion.CargoNombre.Equals("Administrador"))
                    {
                        ImageButton adm = (ImageButton)Master.FindControl("btnAdmin");
                        adm.Visible = true;
                        this.Administracion.Visible = true;
                        this.chek.Visible = false;
                        this.actualizar.Visible = false;
                    }
                    else
                    {
                        ImageButton adm = (ImageButton)Master.FindControl("btnAdmin");
                        adm.Visible = false;
                    }
                }
            }
        }

        private void mostrarDatos(Cm_ClsEmpleado cmempleado)
        {
           
            this.txtNombre.Text = cmempleado.Nombre;
            this.txtApellido.Text = cmempleado.Apellido;
            this.txtDescripcion.Text = cmempleado.Descripcion;
            this.txtFechaNaci.Text = Convert.ToString(cmempleado.FechaNacimiento.ToShortDateString());
            this.txtTelefono.Text = cmempleado.Telefono;
            this.txtuser.Text = cmempleado.Usuario;
            this.txtpas.Text = cmempleado.Contraseña;
            this.txtInstruccion.Text = cmempleado.Instruccion;
            this.txtidEmpleado.Text = Convert.ToString(cmempleado.Id_Empleado);
            txtCargo.Text = cmempleado.CargoNombre;
            txtUnidad.Text = cmempleado.UnidadNombre;
            img1.ImageUrl = "http://localhost:51731/Presentacion/imagen.aspx?ID=" + Convert.ToString(cmempleado.Id_Empleado);
            lblnota.Text = Convert.ToString(cmempleado.Nota);            
        }

      
        protected void btnentrar_Click(object sender, ImageClickEventArgs e)
        {
            cmempleado = ngEmpleado.RecuperarSesion(this.txtusuario.Text, this.txtpass.Text, "Activo");
            
            if (cmempleado.Id_Empleado > 0)
            {
                if (cmempleado.CargoNombre.Equals("Administrador"))
                {
                    ImageButton adm = (ImageButton)Master.FindControl("btnAdmin");
                    adm.Visible = true;
                    this.Administracion.Visible = true;
                    this.chek.Visible = false;
                    this.actualizar.Visible = false;                    
                }
                else
                {
                    ImageButton adm = (ImageButton)Master.FindControl("btnAdmin");
                    adm.Visible = false;
                }
                mostrarDatos(cmempleado);
                Session.Add("Empleado", cmempleado);
               
                panelinfo.Visible = true;
                panelsesion.Visible = false;
            }
           
        }
        public void mostrarMensaje(string mensaje)
        {
            script = @"<script type='text/javascript'> alert('" + mensaje + "'); </script>";

            ScriptManager.RegisterStartupScript(this, typeof(Page), "MPS", script, false);
        }
        #region BLOQUEAR
        protected void chek_CheckedChanged(object sender, EventArgs e)
        {
            ValidadChek();
        }
        public void ValidadChek() {
            if (this.chek.Checked == true)
            {
                actualizar.Visible = true;
                baja.Visible = true;
                FileUpload1.Visible = true;
                txtInstruccion.Visible = false;
                txtTelefono.Enabled = true;
                txtDescripcion.Enabled = true;
                txtCargo.Visible = false;
                txtUnidad.Visible = false;
                ddlInstruccion.Visible = true;
                ddlCargo.Visible = true;
                ddlUnidad.Visible = true;
                this.panelinfo.Visible = true;
            }
            else
            {
                txtCargo.Visible = true;
                txtUnidad.Visible = true;
                txtInstruccion.Visible = true;
                FileUpload1.Visible = false;
                chek.Visible = true;
                actualizar.Visible = false;
                baja.Visible = false;
                ddlCargo.Visible = false;
                ddlUnidad.Visible = false;
                ddlInstruccion.Visible = false;
                txtTelefono.Enabled = false;
                txtDescripcion.Enabled = false;
                this.panelinfo.Visible = true;
            }
        }
        
        public void ocultarDdls(bool estado)
        {
            ddlInstruccion.Visible = estado;
            ddlCargo.Visible = estado;
            ddlUnidad.Visible = estado;
            txtNombre.Enabled = estado;
            txtApellido.Enabled = estado;
            txtFechaNaci.Enabled = estado;
            txtInstruccion.Enabled = estado;
            txtTelefono.Enabled = estado;
            txtDescripcion.Enabled = estado;
            txtCargo.Enabled = estado;
            txtUnidad.Enabled = estado;
            FileUpload1.Visible = estado;
            actualizar.Visible = estado;
            baja.Visible = estado;
            chek.Visible = true;
        }
        private void Ver()
        {
            this.chek.Checked = false;
            txtCargo.Visible = true;
            txtDescripcion.Enabled = false;
            txtTelefono.Enabled = true;
            txtUnidad.Visible = true;
            txtInstruccion.Enabled = false;
            txtInstruccion.Visible = true;
            ddlCargo.Visible = false;
            ddlUnidad.Visible = false;
            ddlInstruccion.Visible = false;
            txtTelefono.Enabled = false;
            txtDescripcion.Enabled = false;
            panelinfo.Visible = true;
        }
#endregion
        protected void actualizar_Click(object sender, ImageClickEventArgs e)
        {
            if ((FileUpload1.PostedFile != null) && (FileUpload1.PostedFile.ContentLength > 0))
            {
                HttpPostedFile archivoImagen = FileUpload1.PostedFile;
                Byte[] byteImage = new Byte[FileUpload1.PostedFile.ContentLength];
                archivoImagen.InputStream.Read(byteImage, 0, FileUpload1.PostedFile.ContentLength);
                if (ngEmpleado.ActualizarEmpleado(Convert.ToInt16(txtidEmpleado.Text),this.txtNombre.Text,txtApellido.Text,Convert.ToDateTime(txtFechaNaci.Text) ,
                    ddlInstruccion.SelectedItem.ToString(), txtTelefono.Text, txtDescripcion.Text, Convert.ToInt16(ddlCargo.SelectedValue),
                    Convert.ToInt16(ddlUnidad.SelectedValue),"Activo", byteImage,txtusuario.Text,txtpass.Text) > 0)
                {
                    mostrarMensaje("Actualizacion ejecutada.!!!");
                    FileUpload1.Visible = false;
                    cmempleado = ngEmpleado.RecuperarSesion(cmempleado.Usuario, cmempleado.Contraseña, "Activo");
                    mostrarDatos(cmempleado);
                    this.panelinfo.Visible = true;
                    Ver();                    
                }
            }
        }

        protected void ddlUnidad0_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void registraractividad_Click(object sender, ImageClickEventArgs e)
        {
            Session.Add("Empleado", cmempleado);
            Server.Transfer("Actividades.aspx");
        }

        protected void txtNombre_TextChanged(object sender, EventArgs e)
        {

        }

        protected void cerrarSesion_Click(object sender, ImageClickEventArgs e)
        {
            salirSesion = true;
            cmemplSesion = null;
            panelinfo.Visible = false;
            panelsesion.Visible = true;
            txtpass.Text = null;
            txtusuario.Text = null;
        }

        protected void Administracion_Click(object sender, ImageClickEventArgs e)
        {
            Server.Transfer("Administrador.aspx");
        }

        protected void empleados_Click(object sender, ImageClickEventArgs e)
        {
            Server.Transfer("EmpleadosNota.aspx");
            Session.Add("Empleado", cmempleado);
        }

        protected void nota_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void baja_Click(object sender, ImageClickEventArgs e)
        {
            
                
                if (ngEmpleado.ActualizarEmpleado(Convert.ToInt16(txtidEmpleado.Text), this.txtNombre.Text, txtApellido.Text, Convert.ToDateTime(txtFechaNaci.Text),
                    ddlInstruccion.SelectedItem.ToString(), txtTelefono.Text, txtDescripcion.Text, Convert.ToInt16(ddlCargo.SelectedValue),
                    Convert.ToInt16(ddlUnidad.SelectedValue), "Inactivo", cmempleado.Fotografia, txtusuario.Text, txtpass.Text) > 0)
                {
                    mostrarMensaje("Empleado dado de baja.!!!");
                    salirSesion = true;
                    cmemplSesion = null;
                    panelinfo.Visible = false;
                    panelsesion.Visible = true;
                    txtpass.Text = null;
                    txtusuario.Text = null;
                }
            
        }

       
       
    }
}