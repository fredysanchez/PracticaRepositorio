using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using PryDesempeñoEmpleados.Datos;
using PryDesempeñoEmpleados.Comun;

namespace PryDesempeñoEmpleados.Negocio
{
    public class Ng_ClsSitio
    {
        public Ng_ClsSitio() { }
        Dt_ClsSitio dtsitio = new Dt_ClsSitio();
        public int insertarSitio(
            string Nombre,
            string Ubicacion,
            string Descripcion,
            string Estado

            )
        {
            return dtsitio.insertarSitio(
                Nombre,
                Ubicacion,
                Descripcion,
                Estado
                );
            
        }

        public Cm_ClsSitio obtenerporId(int IdSitio)
        {
            Dt_ClsSitio dtsitio = new Dt_ClsSitio();
            return dtsitio.ListarPorId(IdSitio);
        }

        public int ActualizarSitio(int idSitio, string nombre, string ubicacion, string descripcion,string estado)
        {
            Dt_ClsSitio dtsitio = new Dt_ClsSitio();
            return dtsitio.ActSitio(idSitio, nombre, ubicacion, descripcion, estado);
        }
        public List<Cm_ClsSitio> ObtenerSitios()
        {
            Dt_ClsSitio dtsitio = new Dt_ClsSitio();
            return dtsitio.listarSitios();
        }
        
    }
}