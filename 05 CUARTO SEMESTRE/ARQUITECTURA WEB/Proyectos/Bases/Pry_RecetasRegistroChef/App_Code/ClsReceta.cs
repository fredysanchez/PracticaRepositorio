using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de ClsReceta
/// </summary>
public class ClsReceta
{

    //ATRIBUTOS
    int id;
    String nombre;
    String url;
    String ingredientes;
    String instrucciones;
    int idChef;

    //CONSTRUCTOR VACIO
	public ClsReceta()
	{

	}

    //CONSTRUCTOR  

    public ClsReceta(int id, String nombre, String url, String ingredientes, String instrucciones, int idChef) {

        this.id = id;
        this.nombre = nombre;
        this.url = url;
        this.ingredientes = ingredientes;
        this.instrucciones = instrucciones;
        this.idChef = idChef;
    
    }

    /* //METODOS
    public String escribirHTML()
     {
        String productoHTML = "";
        productoHTML = "<div style ='" + "margin:10px 300px 0 300px;" +"'>" +
                "<h1>" + this.nombre + "</h1>" +
                "<img width=200 heigth=200 src=" + this.imgurl + " alt=" + this.nombre + " >" +
                "<p> Precio: $" + this.precio.ToString() + "</p>" +
            "</div>";

        return productoHTML;
    }*/




}