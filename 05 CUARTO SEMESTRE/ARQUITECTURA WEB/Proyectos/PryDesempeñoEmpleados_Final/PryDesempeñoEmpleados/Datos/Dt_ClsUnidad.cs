using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Data.Common;
using System.Data;
using PryDesempeñoEmpleados.Comun;

namespace PryDesempeñoEmpleados.Datos
{
    public class Dt_ClsUnidad
    {
        public Dt_ClsUnidad() { }
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

        public int insertarUnidad(
            string Nombre,
            string Ubicacion,
            string Telefono,
            string Descripccion,
            string Estado
            )
        {
            List<DbParameter> parametros = new List<DbParameter>();

            DbParameter nombre = dpf.CreateParameter();
            nombre.Value = Nombre;
            nombre.ParameterName = "@Nombre";
            parametros.Add(nombre);


            DbParameter ubicacion = dpf.CreateParameter();
            ubicacion.Value = Ubicacion;
            ubicacion.ParameterName = "@Ubicacion";
            parametros.Add(ubicacion);

            DbParameter telefono = dpf.CreateParameter();
            telefono.Value = Telefono;
            telefono.ParameterName = "@Telefono";
            parametros.Add(telefono);

            DbParameter descripcion = dpf.CreateParameter();
            descripcion.Value = Descripccion;
            descripcion.ParameterName = "@Descripcion";
            parametros.Add(descripcion);

            DbParameter estado = dpf.CreateParameter();
            estado.Value = Estado;
            estado.ParameterName = "@Estado";
            parametros.Add(estado);

            return executeNonQuery("sp_insertUnidad", parametros);
        }
        public Cm_ClsUnidad ListarPorId(int IdUnidad)
        {
            Cm_ClsUnidad cmSitio = new Cm_ClsUnidad();

            string StoreProcedure = "sp_ListarUnidadId";
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
                    param.ParameterName = "@id_unidad";
                    param.Value = IdUnidad;
                    cmd.Parameters.Add(param);
                    con.Open();
                    using (DbDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.Read())
                        {
                            cmSitio = new Cm_ClsUnidad(
                                    IdUnidad,
                                    (string)dr["nombreU"],
                                    (string)dr["ubicacionU"],
                                    (string)dr["telefonoU"],
                                    (string)dr["descripcionU"],
                                    (string)dr["estadoU"]);
                        }
                    }
                }
            }
            return cmSitio;
        }
        public List<Cm_ClsUnidad> listarUnidades()
        {
            List<Cm_ClsUnidad> ListaUnidades = new List<Cm_ClsUnidad>();
            string StoreProcedure = "sp_ListarUnidad";
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
                            ListaUnidades.Add(
                                new Cm_ClsUnidad(
                                    (int)dr["id_Unidad"],
                                    (string)dr["nombreU"],
                                    (string)dr["ubicacionU"],
                                    (string)dr["telefonoU"],
                                    (string)dr["descripcionU"],
                                    (string)dr["estadoU"]));
                        }
                    }
                }
            }
            return ListaUnidades;
        }

        public int ActUnidad(
            int id_Unidad,
            string Nombre,
            string Ubicacion,
            string Telefono,
            string Descripcion,
            string Estado)
        {
            List<DbParameter> parametros = new List<DbParameter>();

            DbParameter param0 = dpf.CreateParameter();
            param0.Value = id_Unidad;
            param0.ParameterName = "@id_unidad";
            parametros.Add(param0);

            DbParameter nombre = dpf.CreateParameter();
            nombre.Value = Nombre;
            nombre.ParameterName = "@Nombre";
            parametros.Add(nombre);


            DbParameter ubicacion = dpf.CreateParameter();
            ubicacion.Value = Ubicacion;
            ubicacion.ParameterName = "@ubicacion";
            parametros.Add(ubicacion);

            DbParameter telefono = dpf.CreateParameter();
            telefono.Value = Telefono;
            telefono.ParameterName = "@telefono";
            parametros.Add(telefono);


            DbParameter descripcion = dpf.CreateParameter();
            descripcion.Value = Descripcion;
            descripcion.ParameterName = "@Descripcion";
            parametros.Add(descripcion);


            DbParameter estado = dpf.CreateParameter();
            estado.Value = Estado;
            estado.ParameterName = "@Estado";
            parametros.Add(estado);

            return executeNonQuery("sp_modificarUnidad", parametros);


        }

        public int listarEmpleadoUnidad(
      int Id_unidad
      )
        {
            List<DbParameter> parametros = new List<DbParameter>();

            DbParameter id_unidad = dpf.CreateParameter();
            id_unidad.Value = Id_unidad;
            id_unidad.ParameterName = "@id_unidad";
            parametros.Add(id_unidad);

            return executeNonQuery("sp_listarEmpleadosUnidad", parametros);
        }
    }
}