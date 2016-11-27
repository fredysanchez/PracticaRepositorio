using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de ClsIngredientes
/// </summary>
public class ClsIngredientes
{
    List<String> lstingredientes = new List<String>();

    public List<String> Lstingredientes
    {
        get { return lstingredientes; }
        set { lstingredientes = value; }
    }
	public ClsIngredientes()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
    public ClsIngredientes(List<String> lst)
    {
        this.lstingredientes = lst;
    }
}