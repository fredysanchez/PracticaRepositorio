using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


public class ClsRecetas
{
	private int id;
    private String nombreR;
    private String url;
    private String ingredentes;
    private String preparacion;
    private int idChef;


    public ClsRecetas(int Id, String Nombre, String Url, String Ingredientes, String Preparacion, int IdChef)
    {
        this.id = Id;
        this.nombreR = Nombre;
        this.url = Url;
        this.ingredentes = Ingredientes;
        this.preparacion = Preparacion;
        this.idChef = IdChef;
   } 

   public int IdChef
   {
       get { return idChef; }
       set { idChef = value; }
   }

   

   public int Id
   {
       get { return id; }
       set { id = value; }
   }
  


   public String Nombre
    {
        get { return nombreR; }
        set { nombreR = value; }
    }
    
    public String Url
    {
        get { return url; }
        set { url = value; }
    }
   
    public String Ingredentes
    {
        get { return ingredentes; }
        set { ingredentes = value; }
    }
   
    public String Preparacion
    {
        get { return preparacion; }
        set { preparacion = value; }
    }
            
    public ClsRecetas()
	{
		
	}
 
    public String mostrarReceta()
    {

        String recetaHTML = " ";
        recetaHTML = "<div style=margin:10px auto 0 auto>"+
                        "<table  >" +
                         " <tr>" +
                               "<td><h1>" + this.nombreR + "</h1></td>" +
                            "</tr>" +
                           " <tr>"+
                           " <td><img width=250 heigth=250  src=" + this.url + "' alt='" + this.nombreR + "' />" + "</td>" +
                               
                                "</tr>"+
                                 " <tr>" +
                               " <td a><h2>Ingredientes</h2></td>" +
                            "</tr>" +
                           " <tr>"+
                                "<td><h4>"+this.ingredentes+"</h4></td>"+
                              
                            "</tr>"+
                             " <tr>" +
                                 " <td ><h2>Instrucciones</h2></td>" +
                            "</tr>" +
                            "<tr>"+
                                "<td><h4>" + this.preparacion + "</h4></td>" +
                             
                          "</tr>"+
                        "</table>"+
                     "</div>";
        return recetaHTML;
    }


}
