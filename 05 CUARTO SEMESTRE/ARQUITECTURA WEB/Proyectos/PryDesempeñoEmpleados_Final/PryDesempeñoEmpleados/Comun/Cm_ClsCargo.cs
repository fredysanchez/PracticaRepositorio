using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PryDesempeñoEmpleados.Comun
{
    public class Cm_ClsCargo
    {

        private int id_Cargo;    
        private string nombre;
        private DateTime fechaCreacion;
        private string descripcion;
        private string estado;


        public int IdCargo
        {
            get { return id_Cargo; }
            set { id_Cargo = value; }
        }
        public string Nombre
        {
            get { return nombre; }
            set { nombre = value; }
        }
        
        public DateTime FechaCreacion
        {
            get { return fechaCreacion; }
            set { fechaCreacion = value; }
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

        public Cm_ClsCargo() { }
        public Cm_ClsCargo(
            int id,
            string Nombre,
            DateTime FechaCreacion,
            string Descripccion,
            string Estado) 
        {


                this.id_Cargo = id;    
                this.nombre = Nombre;
                this.fechaCreacion = FechaCreacion;
                this.descripcion = Descripccion;
                this.estado = Estado;
        }
        
    }
}