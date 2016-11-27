using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using PryDesempeñoEmpleados.Datos;
using PryDesempeñoEmpleados.Comun;

namespace PryDesempeñoEmpleados.Negocio
{
    public class Ng_ClsEmpleado
    {
        public Ng_ClsEmpleado() { }

        public int insertarEmpleados(
            string nombreP,
            string apellidoP,
            DateTime fechaNacimientoP,
            string instruccionP,
            string telefonoP,
            string descripcionP,
            int id_CargoP,
            int id_UnidadP,
            string estadoP,
            Byte[] fotografiaP,
            string usuarioP,
            string contraseñaP
            )
        {
            Dt_ClsEmpleado dtempleado = new Dt_ClsEmpleado();
            return dtempleado.insertarEmpleados(
                 nombreP,
                 apellidoP,
                 fechaNacimientoP,
                 instruccionP,
                 telefonoP,
                 descripcionP,
                 id_CargoP,
                 id_UnidadP,
                 estadoP,
                 fotografiaP,
                 usuarioP,
                 contraseñaP);
        }
        public Cm_ClsEmpleado RecuperarSesion(string usuario, string contraseña, string estado)
        {
            Dt_ClsEmpleado dtempleado = new Dt_ClsEmpleado();
            return dtempleado.RecuperarSesion(usuario, contraseña,estado);
        }
        public Cm_ClsEmpleado ListarPorId(int idEmpleado)
        {
            Dt_ClsEmpleado dtempleado = new Dt_ClsEmpleado();
            return dtempleado.ListarEmpleadoPorId(idEmpleado);
        }
       
        public int ActualizarEmpleado(
            int id_EmpleadoP,
            string nombreP,
            string apellidoP,
            DateTime fechaNacimientoP,
            string instruccionP,
            string telefonoP,
            string descripcionP,
            int id_CargoP,
            int id_UnidadP,
            string estadoP,
            Byte[] fotografiaP,
            string usuarioP,
            string contraseñaP)
        {
            Dt_ClsEmpleado dtempleado = new Dt_ClsEmpleado();
            return dtempleado.ActualizarEmpleado(
                id_EmpleadoP,
                 nombreP,
                 apellidoP,
                 fechaNacimientoP,
                 instruccionP,
                 telefonoP,
                 descripcionP,
                 id_CargoP,
                 id_UnidadP,
                 estadoP,
                 fotografiaP,
                 usuarioP,
                 contraseñaP);
        }
      
    }
}