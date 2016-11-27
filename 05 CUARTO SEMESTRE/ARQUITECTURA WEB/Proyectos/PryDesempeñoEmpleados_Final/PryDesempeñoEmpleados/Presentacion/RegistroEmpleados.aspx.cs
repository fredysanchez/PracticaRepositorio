using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using PryDesempeñoEmpleados.Comun;
using PryDesempeñoEmpleados.Negocio;

namespace PryDesempeñoEmpleados.Presentacion
{
    public partial class RegistroEmpleados : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Registrar_Click(object sender, ImageClickEventArgs e)
        {
            Ng_ClsEmpleado ngEmpleado = new Ng_ClsEmpleado();

            if ((fluFotoEmpleado.PostedFile != null) && (fluFotoEmpleado.PostedFile.ContentLength > 0 && Validar()))
            {
                HttpPostedFile archivoImagen = fluFotoEmpleado.PostedFile;
                Byte[] byteImage = new Byte[fluFotoEmpleado.PostedFile.ContentLength];
                archivoImagen.InputStream.Read(byteImage, 0, fluFotoEmpleado.PostedFile.ContentLength);

                if (ngEmpleado.insertarEmpleados(txtnombre.Text, txtapellido.Text, Convert.ToDateTime(this.txtfc.Text), dlinstruccion.SelectedItem.ToString(), txttelefono.Text,
                txtdes.Text, Convert.ToInt16(this.dlcargo.SelectedValue), Convert.ToInt16(dlunidad.SelectedValue), "Activo", byteImage, txtuser.Text, txtpass.Text) > 0)
                {
                    Clear();
                    string script = @"<script type='text/javascript'>
                    alert('Registro Guardado!!');
                    </script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "PryEmpleados", script, false);
                }
            }
        }
            public void Clear() {
                txtnombre.Text=null;
                txtapellido.Text=null;
                txtfc.Text=null;
                txttelefono.Text=null;
                txtdes.Text=null;
                txtuser.Text=null;
                txtpass.Text=null;
            }
            #region Validar
            private bool Validar()
            {
                if (!RNombre())
                {
                    string script = @"<script type='text/javascript'>
                alert('Datos Incorrectos, Ingrese Nombres!!');
                </script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "PryEmpleados", script, false);
                    return false;
                }
                if (!RApellido())
                {
                    string script = @"<script type='text/javascript'>
                alert('Datos Incorrectos, Ingrese Apellidos!!');
                </script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "PryEmpleados", script, false);
                    return false;
                }
                if (!RFecha())
                {
                    string script = @"<script type='text/javascript'>
                alert('Datos Incorrectos, Ingrese Fecha de Nacimiento!!');
                </script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "PryEmpleados", script, false);
                    return false;
                }
                if (!RTelefono())
                {
                    string script = @"<script type='text/javascript'>
                alert('Datos Incorrectos, Ingrese Telefono!!');
                </script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "PryEmpleados", script, false);

                    return false;
                }
                if (!RDescripcion())
                {
                    string script = @"<script type='text/javascript'>
                alert('Datos Incorrectos, Indique Descripcion!!');
                </script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "PryEmpleados", script, false);

                    return false;
                }
                if (!RUser())
                {
                    string script = @"<script type='text/javascript'>
                alert('Datos Incorrectos, Asigne Usuario!!');
                </script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "PryEmpleados", script, false);

                    return false;
                }
                if (!RPass())
                {
                    string script = @"<script type='text/javascript'>
                alert('Datos Incorrectos, Asigne Contraseña!!');
                </script>";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "PryEmpleados", script, false);

                    return false;
                }
                return true;
            }

            private bool RNombre()
            {
                return !string.IsNullOrEmpty(txtnombre.Text);
            }
            private bool RApellido()
            {
                return !string.IsNullOrEmpty(txtapellido.Text);
            }
            private bool RFecha()
            {
                return !string.IsNullOrEmpty(txtfc.Text);
            }
            private bool RTelefono()
            {
                return !string.IsNullOrEmpty(txttelefono.Text);
            }
            private bool RDescripcion()
            {
                return !string.IsNullOrEmpty(txtdes.Text);
            }
            private bool RUser()
            {
                return !string.IsNullOrEmpty(txtuser.Text);
            }
            private bool RPass()
            {
                return !string.IsNullOrEmpty(txtpass.Text);
            }
            #endregion

        protected void dlinstruccion_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void txttelefono_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtapellido_TextChanged(object sender, EventArgs e)
        {

        }
        }

    }