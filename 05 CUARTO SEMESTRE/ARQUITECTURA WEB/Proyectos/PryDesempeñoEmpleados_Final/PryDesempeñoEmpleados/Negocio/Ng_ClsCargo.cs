using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using PryDesempeñoEmpleados.Datos;
using PryDesempeñoEmpleados.Comun;

namespace PryDesempeñoEmpleados.Negocio
{
    public class Ng_ClsCargo
    {
        public Ng_ClsCargo() { }
        Dt_ClsCargo dtcargo = new Dt_ClsCargo();
        public int insertarCargo(
            string Nombre,
            string FechaCreacion,
            string Descripccion,
            string Estado
            )
        {
            return dtcargo.insertarCargo(
                Nombre,
                FechaCreacion,
                Descripccion,
                Estado
                );
        }
        public Cm_ClsCargo obtenerporId(int IdCargo)
        {
            Dt_ClsCargo dtcargo = new Dt_ClsCargo();
            return dtcargo.ListarPorId(IdCargo);
        }

        public int ActualizarCargo(int idCargo, string nombre, string fechaCreacion, string descripcion, string estado)
        {
            Dt_ClsCargo dtsitio = new Dt_ClsCargo();
            return dtsitio.ActCargo(idCargo, nombre, fechaCreacion, descripcion, estado);
        }
        public List<Cm_ClsCargo> ObtenerCargos()
        {
            Dt_ClsCargo dtcargo = new Dt_ClsCargo();
            return dtcargo.listarCargos();
        }

    }
}