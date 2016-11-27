using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class ClsChef
{
	#region Atributos
    private String nombre;
    private String email;
    int id;
    #endregion


    #region constructores
        public ClsChef(){
		
	    }
        public ClsChef(int id,String nombre, String email)
        {
            this.id = id;
            this.nombre = nombre;
            this.email=email;
        }
    #endregion
    
    #region SetGet
        public String Nombre
        {
            get { return nombre; }
            set { nombre = value; }
        }


        public String Email
        {
            get { return email; }
            set { email = value; }
        }
        public int Id
        {
            get { return id; }
            set { id = value; }
        }

    #endregion

    #region Metodos
        public String escribirHTML(){
            String productoHTML="";
            productoHTML = "Nombre: " + this.nombre + "      Email: " + this.email;
            return productoHTML;        
        }
    #endregion
}

