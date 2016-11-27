using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// ClsPersona

public class ClsPersona
{
    //Declaracion de Variables
    public string cedula;
    public string nombre;
    public string apellido;
    public string direccion;
    public string telefono;

    //Constructores
    public ClsPersona()
    {

    }

    public ClsPersona(string cedula, string nombre, string apellido,  string direccion, string telefono)
	{
        this.cedula = cedula;
        this.nombre = nombre;
        this.apellido = apellido;
        this.direccion = direccion;
        this.telefono = telefono;
	}

    public string Imprimir()
    {
        return "Informacion ingresada corectamente: <br><br>"+" Identificador: "+this.cedula.ToString()
                + "<br><br>" + " Bienvenido: " + this.nombre.ToString() + "  " + this.apellido.ToString()
                + "<br><br>Contactos:<br><br>" + " - Telefono: " + this.telefono.ToString() + "<br><br>" + " - Direccion:  " + this.direccion.ToString()
                + "<br><br>" + "---------------------------------------------";
    }

}