using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de ClChef
/// </summary>
public class ClsChef
{
    private int id;
    private String nombre;
    private String apellido;
    private String ciudad;
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
    public String Apellido
    {
        get { return apellido; }
        set { apellido = value; }
    }
    
    public String Ciudad
    {
        get { return ciudad; }
        set { ciudad = value; }
    }
	public ClsChef()
	{
		
	}
    public ClsChef(int idc, String nom, String apel, String ciu)
	{
        this.id = idc;
        this.nombre = nom;
        this.apellido = apel;
        this.ciudad = ciu;
	}
}