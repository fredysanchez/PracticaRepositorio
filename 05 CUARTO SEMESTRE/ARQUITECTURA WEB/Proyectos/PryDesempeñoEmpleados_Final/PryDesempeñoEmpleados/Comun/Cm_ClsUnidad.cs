using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PryDesempeñoEmpleados.Comun
{
    public class Cm_ClsUnidad
    {
        private int id_unidad;

public int Id_unidad
{
  get { return id_unidad; }
  set { id_unidad = value; }
}
        private string nombre;
        private string ubicacion;
        private string telefono;
        private string descripcion;
        private string estado;

        public string Telefono
        {
            get { return telefono; }
            set { telefono = value; }
        }
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
         public Cm_ClsUnidad() { }
        public Cm_ClsUnidad(
            int id,
            string Nombre,
            string Ubicacion,
            string Telefono,
            string Descripccion,
            string Estado
            ) 
        {

                this.id_unidad = id;
                this.nombre = Nombre;
                this.ubicacion = Ubicacion;
                this.telefono = Telefono;
                this.descripcion = Descripccion;
                this.estado = Estado;
        }
    }
}