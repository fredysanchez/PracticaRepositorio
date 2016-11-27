using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PryDesempeñoEmpleados.Comun
{
    public class Cm_ClsSitio
    {
        private int id_Sitio;

        public int IdSitio
        {
            get { return id_Sitio; }
            set { id_Sitio = value; }
        }
        private string nombre;
        private string ubicacion;
        private string descripcion;
        private string estado;

       
        public string Nombre
        {
            get { return nombre; }
            set { nombre = value; }
        }
        
        public string Ubicacion
        {
            get { return ubicacion; }
            set { ubicacion = value; }
        }
        

        public string Descripcion
        {
            get { return descripcion; }
            set { descripcion = value; }
        }

        public string Estado
        {
            get { return estado; }
            set { estado = value; }
        }


        public Cm_ClsSitio() { }

        public Cm_ClsSitio(
            int id,
            string Nombre,
            string Ubicacion,
            string Descripccion,
            string Estado
            ) 
        {

                this.id_Sitio = id;
                this.nombre = Nombre;
                this.ubicacion = Ubicacion;
                this.descripcion = Descripccion;
                this.estado = Estado;
        }
    }
}