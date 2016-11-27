using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace epn.inventarios.message
{
   public class ComponenteMsg
    {

        public int Id { get; set; }
        public string Nombre { get; set; }
        public ComponenteMsg() { }

        public ComponenteMsg(
            int id,
            string nombre
          
            ) {
                this.Id = id;
                this.Nombre = nombre;
               
        }
        public string CodigoActivo
        {
            get
            {
                return GetCodigoActivo();
            }
        }

        private string GetCodigoActivo()
        {
            return string.Format("epn.com.{0}", this.Id);
        }
        public string Error { get; set; }
    }

   
}
