using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de ClsInstrucciones
/// </summary>
public class ClsInstrucciones
{
    List<String> lstinstrucciones = new List<String>();

    public List<String> Lstinstrucciones
    {
        get { return lstinstrucciones; }
        set { lstinstrucciones = value; }
    }
	public ClsInstrucciones()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
    public ClsInstrucciones(List<String> lst)
    {
        this.lstinstrucciones = lst;
    }
}