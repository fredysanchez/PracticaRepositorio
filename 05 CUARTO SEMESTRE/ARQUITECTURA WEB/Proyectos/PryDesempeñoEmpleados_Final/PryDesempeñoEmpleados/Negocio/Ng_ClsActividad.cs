using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


using PryDesempeñoEmpleados.Datos;
using PryDesempeñoEmpleados.Comun;

namespace PryDesempeñoEmpleados.Negocio
{
    public class Ng_ClsActividad
    {

         public Ng_ClsActividad() { }

         public int insertarActividades(
            string nombre, 
            string descripcion,
            DateTime fecha,
            double duracion,
            int dificultad,
            string estado,
            int id_Empleado,
            int id_Sitio
            ) {
              Dt_ClsActividad dtactividad = new Dt_ClsActividad();
            return dtactividad.insertarActividad(
                nombre,
                descripcion,
                fecha,
                duracion,
                dificultad,
                estado,
                id_Empleado,
                id_Sitio);

            }

         public int insertarNota(
             int id,
             string nombre,
             string descripcion,
             DateTime fecha,
             double duracion,
             double calificacion,
             int dificultad,
             string estado,
             int id_Empleado,
             int id_Sitio
             )
         {
             Dt_ClsActividad dtactividad = new Dt_ClsActividad();
             return dtactividad.ActActividades(
                 id,
                 nombre,
                 descripcion,
                 fecha,
                 duracion,
                 calificacion,
                 dificultad,
                 estado,
                 id_Empleado,
                 id_Sitio);

         }
         public int Evaluacion(
              int id,
              double calificacion

              )
         {
             Dt_ClsActividad dtactividad = new Dt_ClsActividad();
             return dtactividad.Nota(
                 id,
                 calificacion);

         }

         public int regreso(
               int idem,
              int idac

               )
         {
             Dt_ClsActividad dtactividad = new Dt_ClsActividad();
             return dtactividad.extraerNota(
                 idem,
                 idac);

         }



    }
}