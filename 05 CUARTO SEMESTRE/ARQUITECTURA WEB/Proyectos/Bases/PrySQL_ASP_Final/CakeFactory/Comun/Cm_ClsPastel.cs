using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CakeFactory.Comun
{
    public class Cm_ClsPastel
    {
        private int id_pas;

        public int Id_pas
        {
            get { return id_pas; }
            set { id_pas = value; }
        }
        private string url_pass;

        public string Url_pass
        {
            get { return url_pass; }
            set { url_pass = value; }
        }
        private decimal costo_pas;

        public decimal Costo_pas
        {
            get { return costo_pas; }
            set { costo_pas = value; }
        }
        private string descripcion_pas;

        public string Descripcion_pas
        {
            get { return descripcion_pas; }
            set { descripcion_pas = value; }
        }

        public Cm_ClsPastel() { }

        public Cm_ClsPastel(int Id_pas, string Url_pass, string Descripcion_pas, decimal Costo_pas)
        {
            this.id_pas = Id_pas;
            this.url_pass = Url_pass;
            this.descripcion_pas = Descripcion_pas;
            this.costo_pas = Costo_pas;
        }
    }
}