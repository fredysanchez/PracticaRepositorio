using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using CakeFactory.Comun;
using CakeFactory.Datos;

namespace CakeFactory.Negocio
{
    public class Ng_ClsPastel
    {
        public Ng_ClsPastel(){ }

        public int insertarPastel(string url, decimal costo, string descripcion){
            Dt_ClsPastel dtpastel = new Dt_ClsPastel();
            return dtpastel.insertarPastel(url,costo,descripcion);
        }

        public List<Cm_ClsPastel> Obtenerpastel() {
            Dt_ClsPastel dtPastel = new Dt_ClsPastel();
            return dtPastel.listarPasteles();
        }

        public Cm_ClsPastel obtenerPastelporId(int IdPastel) {
            Dt_ClsPastel dtpastel = new Dt_ClsPastel();
            return dtpastel.ListarPastelPorId(IdPastel);
        }

        public int ActualizarPastel(int IdPastel, string url, decimal costo, string descripcion)
        {
            Dt_ClsPastel dtpastel = new Dt_ClsPastel();
            return dtpastel.ActualizarPastel(IdPastel, url, descripcion, costo);
        }
    }
}