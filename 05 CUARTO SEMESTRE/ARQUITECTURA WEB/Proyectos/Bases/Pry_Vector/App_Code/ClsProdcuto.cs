using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de ClsProdcuto
/// </summary>
/// 

public delegate void PrecioChangeEventHandler();

public class ClsProdcuto
{
    #region Atributos
    private String nombre;
    private String imgUrl;
    private double precio;
    public  event PrecioChangeEventHandler PrecioCambio;
    #endregion

    #region Setters and Getters
    public string Nombre
    {
        get { return nombre; }
        set { nombre = value; }
    }
    
    public string ImgUrl
    {
        get { return imgUrl; }
        set { imgUrl = value; }
    }
    
    public double Precio
    {
        get { return precio; }
        set { precio = value; 
            if(PrecioCambio!=null)
                PrecioCambio();
            }
    }
    #endregion

    #region Constructores
    public ClsProdcuto(string nombre, string imgUrl, double precio)
    {
        this.nombre = nombre;
        this.imgUrl = imgUrl;
        this.precio = precio;
    }

	public ClsProdcuto()
	{

    }
    #endregion

    #region Metodos

    public String escribirHTML()
    {
        String productoHTML=" ";
        productoHTML =
        "<div>"+
	        "<h1>"+this.nombre+"</h1>"+
	        "<img width=200 heigth=200 src='"+this.imgUrl+"'alt='"+this.nombre+"'>"+
	        "<p>Precio: $ "+this.precio.ToString()+"</p>"+
        "</div>";
        return productoHTML;
    }

    public void changeDetected()
    {
        this.imgUrl = "http://goodtoknow.media.ipcdigital.co.uk/111/00000c149/42ab/Toffee-chocolate-cheesecake.jpg";
    }


    #endregion

}