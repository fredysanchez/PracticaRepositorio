using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de ClsProducto
/// </summary>
/// 
/*prototipo*/
public delegate void PrecioChangedEvebtHandler(); /*evemto delegate*/
public class ClsProducto
{

    public event PrecioChangedEvebtHandler PrecioCambio;
   
    #region Atributos
    private String nombre; 
    private String imgurl;
    private double precio;
    #endregion

    #region constructores
    public ClsProducto(){
		
	}
    
    public ClsProducto(String nombre, String imgurl, double precio)
    {
        this.nombre = nombre;
        this.imgurl = imgurl;
        this.precio = precio;
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
    public double Precio
    {
        get { return precio; }
        set { precio = value; 
            if(PrecioCambio!=null){
                PrecioCambio();
            }
        }
    }


    #endregion

    #region Metodos
        public String escribirHTML(){
            String productoHTML="";
            productoHTML="<div>"+
	                "<h1>"+this.nombre+"</h1>"+
	                "<img width=200 heigth=200 src="+this.imgurl+" alt="+this.nombre+" >"+
	                "<p> Precio: $"+this.precio.ToString()+"</p>"+
                "</div>";

            return productoHTML;        
        }
        public String recuperarImagen()
        {
            String imagen = "";
            imagen = "<div>" + "<img width=200 heigth=200 src=" + this.imgurl + " alt=" + this.nombre + " >" + "</div>";
            return imagen;
        }

        public void changeDetected(){
            this.imgurl = "https://sweetmafer.files.wordpress.com/2011/07/torta-perro.jpg";    
        }
    #endregion
}