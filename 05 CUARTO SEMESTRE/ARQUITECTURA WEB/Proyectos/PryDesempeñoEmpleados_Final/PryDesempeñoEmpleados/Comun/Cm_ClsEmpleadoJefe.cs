using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PryDesempeñoEmpleados.Comun
{
    public class Cm_ClsEmpleadoJefe
    {
        int id_Empleado_Jefe;

        public int Id_Empleado_Jefe
        {
            get { return id_Empleado_Jefe; }
            set { id_Empleado_Jefe = value; }
        }
        int id_Empleado_Empleado;

        public int Id_Empleado_Empleado
        {
            get { return id_Empleado_Empleado; }
            set { id_Empleado_Empleado = value; }
        }

        public Cm_ClsEmpleadoJefe() { }

        public Cm_ClsEmpleadoJefe(int Id_Empleado_Jefe, int Id_Empleado_Empleado)
        {
            this.id_Empleado_Jefe = Id_Empleado_Jefe;
            this.id_Empleado_Empleado = Id_Empleado_Empleado;

        }
    }
}