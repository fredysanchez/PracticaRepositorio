using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PryDesempeñoEmpleados.Comun
{
    public class Cm_ClsActividad
    {
        private int id_actividad;

        public int Id_actividad
        {
            get { return id_actividad; }
            set { id_actividad = value; }
        }
        private string nombre;

        public string Nombre
        {
            get { return nombre; }
            set { nombre = value; }
        }
        private string descripcion;

        public string Descripcion
        {
            get { return descripcion; }
            set { descripcion = value; }
        }
        DateTime fechaRealizacion;

        public DateTime FechaRealizacion
        {
            get { return fechaRealizacion; }
            set { fechaRealizacion = value; }
        }
        private double duracion;

        public double Duracion
        {
            get { return duracion; }
            set { duracion = value; }
        }
        private double calificacion;

        public double Calificacion
        {
            get { return calificacion; }
            set { calificacion = value; }
        }
        private int dificultad;

        public int Dificultad
        {
            get { return dificultad; }
            set { dificultad = value; }
        }

        
        private string estado;

        public string Estado
        {
            get { return estado; }
            set { estado = value; }
        }
        private int id_Empleado;

        public int Id_Empleado
        {
            get { return id_Empleado; }
            set { id_Empleado = value; }
        }
        private int id_Sitio;

        public int Id_Sitio
        {
            get { return id_Sitio; }
            set { id_Sitio = value; }
        }

        public Cm_ClsActividad() { }
        public Cm_ClsActividad(int id_Actividad1, 
            string nombre1, 
            string descripcion1,
            DateTime fechaRealizacion1,
            double duracion1,
            int dificultad1,
            string estado1,
            int id_Empleado1,
            int id_Sitio1
            ) {
                this.id_actividad = id_Actividad1;
                this.nombre= nombre1;
                this.descripcion = descripcion1;
                this.fechaRealizacion = fechaRealizacion1;
                this.duracion = duracion1;
                this.dificultad = dificultad1;
                this.estado = estado1;
                this.id_Empleado = id_Empleado1;
                this.id_Sitio = id_Sitio1;

            }
        public Cm_ClsActividad(int id_Actividad1,
           string nombre1,
           string descripcion1,
           DateTime fechaRealizacion1,
           double duracion1,
            double calificacion1,
           int dificultad1,
           string estado1,
           int id_Empleado1,
           int id_Sitio1
           )
        {
            this.id_actividad = id_Actividad1;
            this.nombre = nombre1;
            this.descripcion = descripcion1;
            this.fechaRealizacion = fechaRealizacion1;
            this.duracion = duracion1;
            this.calificacion = calificacion1;
            this.dificultad = dificultad1;
            this.estado = estado1;
            this.id_Empleado = id_Empleado1;
            this.id_Sitio = id_Sitio1;

        }

    }

    

}