using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de ClsChef
/// </summary>
public class ClsChef
{
	
		//ATRIBUTOS 
        int id;
        String nombre;
        String correo;


        //CONSTRUCTOR VACIO 
        public ClsChef(){
        
        }

        //CONSTRUCTOR 
        public ClsChef( int id, String nombre, String correo){
            this.id = id;
            this.nombre = nombre;
            this.correo= correo;
        
        }


    //SETTER Y GETTER 

        public int Id
        {
            get { return id; }
            set { id = value; }
        }

        public String Nombre
        {
            get { return nombre; }
            set { nombre = value; }
        }


    //METODOS
    public String escribirHTMLChef()
     {
        String chefHTML = "";
        chefHTML = "<div style ='" + "margin:10px 300px 0 300px;" + "'>" +
                        "<h1>" +"ID: "+ this.id + "</h1>" +  "<h1>" +"Nombre: "+ this.nombre + "</h1>"+
                        "<h1>" +"Correo: "+ this.correo + "</h1>"+
                    "</div>";

        return chefHTML;
    }
}