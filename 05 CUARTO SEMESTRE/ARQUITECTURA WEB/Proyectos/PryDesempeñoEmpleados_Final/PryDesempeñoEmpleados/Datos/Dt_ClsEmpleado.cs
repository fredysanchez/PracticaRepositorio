using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Data.Common;
using System.Data;

using PryDesempeñoEmpleados.Presentacion;
using PryDesempeñoEmpleados.Comun;

namespace PryDesempeñoEmpleados.Datos
{
    public class Dt_ClsEmpleado
    {
        public Dt_ClsEmpleado() { }
        public static string constr
        {
            get { return ConfigurationManager.ConnectionStrings["Conn"].ConnectionString; }
        }

        public static string provider
        {
            get { return ConfigurationManager.ConnectionStrings["Conn"].ProviderName; }
        }

        public static DbProviderFactory dpf
        {
            get { return DbProviderFactories.GetFactory(provider); }
        }

        private static int executeNonQuery(string StoreProcedure, List<DbParameter> parametros)
        {
            int Id = 0;
            try
            {
                using (DbConnection con = dpf.CreateConnection())
                {
                    con.ConnectionString = constr;
                    using (DbCommand cmd = dpf.CreateCommand())
                    {
                        cmd.Connection = con;
                        cmd.CommandText = StoreProcedure;
                        cmd.CommandType = CommandType.StoredProcedure;
                        foreach (DbParameter prmts in parametros)
                        {
                            cmd.Parameters.Add(prmts);
                        }
                        con.Open();
                        Id = cmd.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception)
            {
                throw;
            }
            return Id;
        }

        public int insertarEmpleados(
            string nombreP,
            string apellidoP,
            DateTime fechaNacimientoP,
            string instruccionP,
            string telefonoP,
            string descripcionP,
            int id_CargoP,
            int id_UnidadP,
            string estadoP,
            Byte[] fotografiaP,
            string usuarioP,
            string contraseñaP)
        {
            List<DbParameter> parametros = new List<DbParameter>();
            DbParameter nombre = dpf.CreateParameter();
            nombre.Value = nombreP;
            nombre.ParameterName = "@nombre";
            parametros.Add(nombre);

            DbParameter apellido = dpf.CreateParameter();
            apellido.Value = apellidoP;
            apellido.ParameterName = "@apellido";
            parametros.Add(apellido);

            DbParameter fechaNacimiento = dpf.CreateParameter();
            fechaNacimiento.Value = fechaNacimientoP;
            fechaNacimiento.ParameterName = "@fechaNacimiento";
            parametros.Add(fechaNacimiento);

            DbParameter instruccion = dpf.CreateParameter();
            instruccion.Value = instruccionP;
            instruccion.ParameterName = "@instruccion";
            parametros.Add(instruccion);

            DbParameter telefono = dpf.CreateParameter();
            telefono.Value = telefonoP;
            telefono.ParameterName = "@telefono";
            parametros.Add(telefono);

            DbParameter descripcion = dpf.CreateParameter();
            descripcion.Value = descripcionP;
            descripcion.ParameterName = "@descripcion";
            parametros.Add(descripcion);

            DbParameter fotografia = dpf.CreateParameter();
            fotografia.Value = fotografiaP;
            fotografia.ParameterName = "@fotografia";
            parametros.Add(fotografia);

            DbParameter usuario = dpf.CreateParameter();
            usuario.Value = usuarioP;
            usuario.ParameterName = "@usuario";
            parametros.Add(usuario);

            DbParameter contraseña = dpf.CreateParameter();
            contraseña.Value = contraseñaP;
            contraseña.ParameterName = "@contraseña";
            parametros.Add(contraseña);

            DbParameter estado = dpf.CreateParameter();
            estado.Value = estadoP;
            estado.ParameterName = "@estado";
            parametros.Add(estado);

            DbParameter id_Unidad = dpf.CreateParameter();
            id_Unidad.Value = id_UnidadP;
            id_Unidad.ParameterName = "@id_Unidad";
            parametros.Add(id_Unidad);

            DbParameter id_Cargo = dpf.CreateParameter();
            id_Cargo.Value = id_CargoP;
            id_Cargo.ParameterName = "@id_Cargo";
            parametros.Add(id_Cargo);

            DbParameter Newid = dpf.CreateParameter();
            Newid.Value = -1;
            Newid.ParameterName = "@NewId";
            Newid.Direction = ParameterDirection.Output;
            parametros.Add(Newid);

            return executeNonQuery("sp_insertEmpleados", parametros);
        }

        public Cm_ClsEmpleado ListarEmpleadoPorId(int IdEmpleado)
        {
            Cm_ClsEmpleado cmEmpleado = new Cm_ClsEmpleado();

            string StoreProcedure = "sp_ListarEmpleadoId";
            using (DbConnection con = dpf.CreateConnection())
            {
                con.ConnectionString = constr;
                using (DbCommand cmd = dpf.CreateCommand())
                {
                    cmd.Connection = con;
                    cmd.CommandText = StoreProcedure;
                    cmd.CommandType = CommandType.StoredProcedure;
                    DbParameter param = cmd.CreateParameter();
                    param.DbType = DbType.Int32;
                    param.ParameterName = "@id_Empleado";
                    param.Value = IdEmpleado;
                    cmd.Parameters.Add(param);
                    con.Open();
                    using (DbDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.Read())
                        {
                            cmEmpleado = new Cm_ClsEmpleado(
                                    IdEmpleado,
                                    (string)dr["nombreE"],
                                    (string)dr["apellido"],
                                    (DateTime)dr["fechaNacimiento"],
                                    (string)dr["instruccion"],
                                    (string)dr["telefono"],
                                    (string)dr["descripcion"],
                                    (string)dr["nombreC"],
                                    (string)dr["nombreU"],
                                    (Byte[])dr["fotografia"],
                                    (string)dr["usuario"],
                                    (string)dr["contraseña"],
                                    (decimal)dr["nota"]);
                        }
                    }
                }
            }
            return cmEmpleado;
        }
        public List<Cm_ClsEmpleado> listarEmpleados()
        {
            List<Cm_ClsEmpleado> ListaEmpleado = new List<Cm_ClsEmpleado>();
            string StoreProcedure = "sp_ListarEmpleado";
            using (DbConnection con = dpf.CreateConnection())
            {
                con.ConnectionString = constr;
                using (DbCommand cmd = dpf.CreateCommand())
                {
                    cmd.Connection = con;
                    cmd.CommandText = StoreProcedure;
                    cmd.CommandType = CommandType.StoredProcedure;
                    con.Open();
                    using (DbDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            ListaEmpleado.Add(
                                new Cm_ClsEmpleado(
                                    (int)dr["id_Empleado"],
                                    (string)dr["nombreE"],
                                    (string)dr["apellido"],
                                    (DateTime)dr["fechaNacimiento"],
                                    (string)dr["instruccion"],
                                    (string)dr["telefono"],
                                    (string)dr["descripcion"],
                                    (string)dr["cargo_nombre"],
                                    (string)dr["unidad_nombre"],
                                    (string)dr["estado"],
                                    (Byte[])dr["fotografia"],
                                    (string)dr["usuario"], 
                                    (string)dr["contraseña"],
                                    (decimal)dr["nota"]));
                        }
                    }
                }
            }
            return ListaEmpleado;
        }

        public int ActualizarEmpleado(
            int id_EmpleadoP,
            string nombreP,
            string apellidoP,
            DateTime fechaNacimientoP,
            string instruccionP,
            string telefonoP,
            string descripcionP,
            int id_CargoP,
            int id_UnidadP,
            string estadoP,
            Byte[] fotografiaP,
            string usuarioP,
            string contraseñaP)
        {
            List<DbParameter> parametros = new List<DbParameter>();

            DbParameter id_Empleado = dpf.CreateParameter();
            id_Empleado.Value = id_EmpleadoP;
            id_Empleado.ParameterName = "@id_Empleado";
            parametros.Add(id_Empleado);

            DbParameter nombre = dpf.CreateParameter();
            nombre.Value = nombreP;
            nombre.ParameterName = "@nombre";
            parametros.Add(nombre);

            DbParameter apellido = dpf.CreateParameter();
            apellido.Value = apellidoP;
            apellido.ParameterName = "@apellido";
            parametros.Add(apellido);

            DbParameter fechaNacimiento = dpf.CreateParameter();
            fechaNacimiento.Value = fechaNacimientoP;
            fechaNacimiento.ParameterName = "@fechaNacimiento";
            parametros.Add(fechaNacimiento);

            DbParameter instruccion = dpf.CreateParameter();
            instruccion.Value = instruccionP;
            instruccion.ParameterName = "@instruccion";
            parametros.Add(instruccion);

            DbParameter telefono = dpf.CreateParameter();
            telefono.Value = telefonoP;
            telefono.ParameterName = "@telefono";
            parametros.Add(telefono);

            DbParameter descripcion = dpf.CreateParameter();
            descripcion.Value = descripcionP;
            descripcion.ParameterName = "@descripcion";
            parametros.Add(descripcion);

            DbParameter fotografia = dpf.CreateParameter();
            fotografia.Value = fotografiaP;
            fotografia.ParameterName = "@fotografia";
            parametros.Add(fotografia);

            DbParameter usuario = dpf.CreateParameter();
            usuario.Value = usuarioP;
            usuario.ParameterName = "@usuario";
            parametros.Add(usuario);

            DbParameter contraseña = dpf.CreateParameter();
            contraseña.Value = contraseñaP;
            contraseña.ParameterName = "@contraseña";
            parametros.Add(contraseña);

            DbParameter estado = dpf.CreateParameter();
            estado.Value = estadoP;
            estado.ParameterName = "@estado";
            parametros.Add(estado);

            DbParameter id_Unidad = dpf.CreateParameter();
            id_Unidad.Value = id_UnidadP;
            id_Unidad.ParameterName = "@id_Unidad";
            parametros.Add(id_Unidad);

            DbParameter id_Cargo = dpf.CreateParameter();
            id_Cargo.Value = id_CargoP;
            id_Cargo.ParameterName = "@id_Cargo";
            parametros.Add(id_Cargo);

            return executeNonQuery("sp_ModificarEmpleado", parametros);
        }

        public Cm_ClsEmpleado RecuperarSesion(string usuarioP, string contraseñaP, string estadoP)
        {
            Cm_ClsEmpleado cmEmpleado = new Cm_ClsEmpleado();

            string StoreProcedure = "sp_ListarEmpleadoSesion";
            using (DbConnection con = dpf.CreateConnection())
            {
                con.ConnectionString = constr;
                using (DbCommand cmd = dpf.CreateCommand())
                {
                    cmd.Connection = con;
                    cmd.CommandText = StoreProcedure;
                    cmd.CommandType = CommandType.StoredProcedure;
                    DbParameter usuario = cmd.CreateParameter();
                    usuario.ParameterName = "@usuario";
                    usuario.Value = usuarioP;
                    cmd.Parameters.Add(usuario);

                    DbParameter contraseña = cmd.CreateParameter();
                    contraseña.ParameterName = "@contraseña";
                    contraseña.Value = contraseñaP;
                    cmd.Parameters.Add(contraseña);

                    DbParameter estado = cmd.CreateParameter();
                    estado.ParameterName = "@estado";
                    estado.Value = estadoP;
                    cmd.Parameters.Add(estado);

                    con.Open();
                    using (DbDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.Read())
                        {
                            cmEmpleado = new Cm_ClsEmpleado(
                                    (int)dr["id_Empleado"],
                                    (string)dr["nombreE"],
                                    (string)dr["apellido"],
                                    (DateTime)dr["fechaNacimiento"],
                                    (string)dr["instruccion"],
                                    (string)dr["telefono"],
                                    (string)dr["descripcion"],
                                    (string)dr["nombreC"],
                                    (string)dr["nombreU"],
                                    estadoP,(Byte[])dr["fotografia"],
                                    usuarioP,contraseñaP,
                                    (decimal)dr["nota"]);

                        }
                    }
                }
            }
            return cmEmpleado;
        }
       
    }
}