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
        public Ng_ClsPastel()
        {

        }

        //Insertar

        public int insertarPastel(string url, decimal costo, string descripcion,Byte[] byteImage)
        {
            Dt_ClsPastel dt_pastel = new Dt_ClsPastel();
            return dt_pastel.insertarPastel(url, costo, descripcion,byteImage);
        }
        public List<Cm_ClsPastel> obtenerPasteles (){
            Dt_ClsPastel dt_pastel = new Dt_ClsPastel();
            return dt_pastel.listarPasteles();
        }

        public Cm_ClsPastel obtenerPastelPorId(int idapastel) {
            Dt_ClsPastel dt_pastel = new Dt_ClsPastel();
            return dt_pastel.listarPastelporId(idapastel);
        }

        public int actualizarPastel(int id, string url, decimal costo, string descripcion)
        {
            Dt_ClsPastel dt_pastel = new Dt_ClsPastel();
            return dt_pastel.actualizarPastel(id,url, descripcion,costo);
        }

    }
}