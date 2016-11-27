using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de ClsMedicamentos
/// </summary>
public class ClsMedicamentos
{
    private int idM;

    public int IdM
    {
        get { return idM; }
        set { idM = value; }
    }
    private String nombre;

    public String Nombre
    {
        get { return nombre; }
        set { nombre = value; }
    }
    private String url;

    public String Url
    {
        get { return url; }
        set { url = value; }
    }
    private Double dosis;

    public Double Dosis
    {
        get { return dosis; }
        set { dosis = value; }
    }
    private Double gramos;

    public Double Gramos
    {
        get { return gramos; }
        set { gramos = value; }
    }
    private Double costo;

    public Double Costo
    {
        get { return costo; }
        set { costo = value; }
    }

    public ClsMedicamentos() { }

	public ClsMedicamentos(int Id, String Nombre, String Url, Double Dosis, Double Gramos , Double Costo)
	{
        this.idM = Id;
        this.nombre = Nombre;
        this.url = Url;
        this.dosis = Dosis;
        this.gramos = Gramos;
        this.costo = Costo;
	}
    public String recuperarImagen()
    {
        String imagen = "";
        imagen = "<div>" + "<img width=200 heigth=200 src=" + this.url + " alt=" + this.nombre + " >" + "</div>";
        return imagen;
    }

}