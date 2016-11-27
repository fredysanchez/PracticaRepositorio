using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de ClsReceta
/// </summary>
public class ClsReceta
{
    private int id;
    private String nombre;
    private List<String> ingredientes = new List<String>();
    private List<String> instrucciones = new List<String>();
    private int idChef;
    public List<String> Instrucciones
    {
        get { return instrucciones; }
        set { instrucciones = value; }
    }
    public List<String> Ingredientes
    {
        get { return ingredientes; }
        set { ingredientes = value; }
    }
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
    public int IdChef
    {
        get { return idChef; }
        set { idChef = value; }
    }
	public ClsReceta()
	{
        this.nombre="";
	}
    public ClsReceta(int idp, String nom, List<String> ingre, List<String> instruc, int chef)
    {
        this.id = idp;
        this.nombre = nom;
        this.instrucciones = instruc;
        this.ingredientes = ingre;
        this.idChef = chef;
    }
    public String impresioHtmlIngredientes()
    {
        String texto = "<h2>Ingredientes</h2>";
        texto = texto + "<ul>";
        for (int i = 0; i < ingredientes.Count; i++)
        {
            texto = texto + "<li>" + ingredientes[i] + "</li>";
        }
        texto = texto+"</ul>";
        return texto;
    }
    public String impresioHtmlInstrucciones()
    {
        String texto = "<h2>Instrucciones</h2>";
        texto = texto + "<ol>";
        for (int i = 0; i < instrucciones.Count; i++)
        {
            texto = texto + "<li>" + instrucciones[i] + "</li>";
        }
        texto = texto + "</ol>";
        return texto;
    }
    public String impresionChef(List<ClsChef> lstchef)
    {
        String texto = "";
        for (int i = 0; i < lstchef.Count; i++)
        {
            if (lstchef[i].Id.Equals(IdChef))
            {
                texto = texto + "<h3> Hecho por: " + lstchef[i].Nombre+" "+ lstchef[i].Apellido+"</h3>";
                texto = texto + "<h3> De la Ciudad de:" + lstchef[i].Ciudad + "</h3>";
            }
        }
        return texto;
    }
}