using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using PryDesempeñoEmpleados.Datos;
using PryDesempeñoEmpleados.Comun;

namespace PryDesempeñoEmpleados.Negocio
{
    public class Ng_ClsUnidad
    {
        public Ng_ClsUnidad() { }

        public int insertarUnidad(
            string Nombre,
            string Ubicacion,
            string Telefono,
            string Descripccion,
            string Estado
            )
        {
            Dt_ClsUnidad dtunidad = new Dt_ClsUnidad();
            return dtunidad.insertarUnidad(
                Nombre,
                Ubicacion,
                Telefono,
                Descripccion,
                  Estado
                );
        }
        public Cm_ClsUnidad obtenerporId(int IdUnidad)
        {
            Dt_ClsUnidad dtUnidad = new Dt_ClsUnidad();
            return dtUnidad.ListarPorId(IdUnidad);
        }

        public int ActualizarUnidad(int idUnidad, string nombre, string ubicacion, string telefono, string descripcion, string estado)
        {
            Dt_ClsUnidad dtunidad = new Dt_ClsUnidad();
            return dtunidad.ActUnidad(idUnidad, nombre, ubicacion,telefono, descripcion, estado);
        }
        public List<Cm_ClsUnidad> ObtenerSitios()
        {
            Dt_ClsUnidad dtsitio = new Dt_ClsUnidad();
            return dtsitio.listarUnidades();
        }
    }
}