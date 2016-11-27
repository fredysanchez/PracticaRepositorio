using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace epn_inventarios.messaje
{
    public class ItemCombo
    {
        public int Id { get; set; }
        public string Nombre { get; set; }

        public ItemCombo() { }

        public ItemCombo(
            int id, 
            string nombre) 
        {
            this.Id = id;
            this.Nombre = nombre;
        }

    }
}
