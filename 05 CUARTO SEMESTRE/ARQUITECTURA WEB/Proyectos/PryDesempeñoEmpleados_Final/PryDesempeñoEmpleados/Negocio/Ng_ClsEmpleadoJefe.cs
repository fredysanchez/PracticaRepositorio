using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PryDesempeñoEmpleados.Datos;
namespace PryDesempeñoEmpleados.Negocio
{
    public class Ng_ClsEmpleadoJefe
    {
        public Ng_ClsEmpleadoJefe() { }
        Dt_ClsEmpleadoJefe dtemp = new Dt_ClsEmpleadoJefe();

        public int insertarEmpleadoJefe(
           int Id_Empleado_Jefe,
          int Id_Empleado_Empleado
            )
        {
            return dtemp.insertarEmpleadoJefe(
                Id_Empleado_Jefe,
               Id_Empleado_Empleado

                );
        }

        public int listarEmpleadoJefe(
           int Id_Empleado_Jefe

            )
        {
            return dtemp.listarEmpleadoJefe(
                Id_Empleado_Jefe

                );
        }
    }
}