using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class ClsProducto
{
    #region Atributos
    private String nombre; 
    private String imgurl;
    int id;
    #endregion


    #region constructores
        public ClsProducto(){
		
	    }
        public ClsProducto(int id,String nombre, String imgurl)
        {
            this.id = id;
            this.nombre = nombre;
            this.imgurl = imgurl;
        }
    #endregion
    
    #region SetGet
        public String Nombre
        {
            get { return nombre; }
            set { nombre = value; }
        }

        public String Imgurl
        {
            get { return imgurl; }
            set { imgurl = value; }
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
            productoHTML="<div style="+"margin:100px"+" >"+
	                "<h1>"+this.nombre+"</h1>"+
	                "<img width=400 heigth=300 src="+this.imgurl+" alt="+this.nombre+" >"+
	                //"<p> Precio: $"+this.precio.ToString()+"</p>"+
                "</div>";

            return productoHTML;        
        }
    #endregion
}