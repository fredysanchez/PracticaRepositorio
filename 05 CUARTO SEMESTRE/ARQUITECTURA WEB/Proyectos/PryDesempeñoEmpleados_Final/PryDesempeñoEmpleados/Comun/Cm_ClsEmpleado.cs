using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PryDesempeñoEmpleados.Comun
{
    public class Cm_ClsEmpleado
    {
        private int id_Empleado;

        public int Id_Empleado
        {
            get { return id_Empleado; }
            set { id_Empleado = value; }
        }
        private string nombre;

        public string Nombre
        {
            get { return nombre; }
            set { nombre = value; }
        }
        private string apellido;

        public string Apellido
        {
            get { return apellido; }
            set { apellido = value; }
        }
        private DateTime fechaNacimiento;

        public DateTime FechaNacimiento
        {
            get { return fechaNacimiento; }
            set { fechaNacimiento = value; }
        }
        private string instruccion;

        public string Instruccion
        {
            get { return instruccion; }
            set { instruccion = value; }
        }
        private string telefono;

        public string Telefono
        {
            get { return telefono; }
            set { telefono = value; }
        }
        private string descripcion;

        public string Descripcion
        {
            get { return descripcion; }
            set { descripcion = value; }
        }
        private int id_Cargo;

        public int Id_Cargo
        {
            get { return id_Cargo; }
            set { id_Cargo = value; }
        }
        private int id_Unidad;

        public int Id_Unidad
        {
            get { return id_Unidad; }
            set { id_Unidad = value; }
        }
        private string estado;

        public string Estado
        {
            get { return estado; }
            set { estado = value; }
        }
        private string usuario;

        public string Usuario
        {
            get { return usuario; }
            set { usuario = value; }
        }
        private string contraseña;

        public string Contraseña
        {
            get { return contraseña; }
            set { contraseña = value; }
        }
        private Byte[] fotografia;

        public Byte[] Fotografia
        {
            get { return fotografia; }
            set { fotografia = value; }
        }

        private string cargo_nombre;

        public string CargoNombre
        {
            get { return cargo_nombre; }
            set { cargo_nombre = value; }
        }
        private string unidad_nombre;

        public string UnidadNombre
        {
            get { return unidad_nombre; }
            set { unidad_nombre = value; }
        }
        private decimal nota;

        public decimal Nota
        {
            get { return nota; }
            set { nota = value; }
        }
        public Cm_ClsEmpleado() { }

        public Cm_ClsEmpleado(
            int id_Empleado, 
            string nombre, 
            string apellido, 
            DateTime fechaNacimiento,                              
            string instruccion, 
            string telefono, 
            string descripcion, 
            int id_Cargo,
            int id_Unidad, 
            string estado,
            Byte[] fotografia, 
            string usuario, 
            string contraseña)
        {

            this.id_Empleado = id_Empleado;
            this.nombre = nombre;
            this.apellido = apellido;
            this.fechaNacimiento = fechaNacimiento;
            this.instruccion = instruccion;
            this.telefono = telefono;
            this.descripcion = descripcion;
            this.id_Cargo = id_Cargo;
            this.id_Unidad = id_Unidad;
            this.estado = estado;
            this.usuario = usuario;
            this.contraseña = contraseña;
            this.fotografia = new Byte[fotografia.Length];
            this.fotografia = fotografia;
        }

        public Cm_ClsEmpleado(
            int id_Empleado,
            string nombre,
            string apellido,
            DateTime fechaNacimiento,
            string instruccion,
            string telefono,
            string descripcion,
            string cargo_nombre,
            string unidad_nombre,
            string estado,
            Byte[] fotografia,
            string usuario,
            string contraseña,
            decimal nota)
        {

            this.id_Empleado = id_Empleado;
            this.nombre = nombre;
            this.apellido = apellido;
            this.fechaNacimiento = fechaNacimiento;
            this.instruccion = instruccion;
            this.telefono = telefono;
            this.descripcion = descripcion;
            this.cargo_nombre = cargo_nombre;
            this.unidad_nombre = unidad_nombre;
            this.estado = estado;
            this.usuario = usuario;
            this.contraseña = contraseña;
            this.fotografia = new Byte[fotografia.Length];
            this.fotografia = fotografia;
            this.nota = nota;
        }

        public Cm_ClsEmpleado(
            int id_Empleado,
            string nombre,
            string apellido,
            DateTime fechaNacimiento,
            string instruccion,
            string telefono,
            string descripcion,
            string cargo_nombre,
            string unidad_nombre,
            Byte[] fotografia,
            string usuario,
            string contraseña,
            decimal nota)
        {

            this.id_Empleado = id_Empleado;
            this.nombre = nombre;
            this.apellido = apellido;
            this.fechaNacimiento = fechaNacimiento;
            this.instruccion = instruccion;
            this.telefono = telefono;
            this.descripcion = descripcion;
            this.cargo_nombre = cargo_nombre;
            this.unidad_nombre = unidad_nombre;
            this.usuario = usuario;
            this.contraseña = contraseña;
            this.fotografia = new Byte[fotografia.Length];
            this.fotografia = fotografia;
            this.nota = nota;
        }
    }
}