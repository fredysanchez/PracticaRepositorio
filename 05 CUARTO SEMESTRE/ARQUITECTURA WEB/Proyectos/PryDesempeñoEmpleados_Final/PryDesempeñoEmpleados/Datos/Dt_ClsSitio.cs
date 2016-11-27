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
    public class Dt_ClsSitio
    {
        public Dt_ClsSitio() { }


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

        public int insertarSitio(
            string Nombre,
            string Ubicacion,
            string Descripcion,
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
            ubicacion.ParameterName = "@ubicacion";
            parametros.Add(ubicacion);


            DbParameter descripcion = dpf.CreateParameter();
            descripcion.Value = Descripcion;
            descripcion.ParameterName = "@Descripcion";
            parametros.Add(descripcion);


            DbParameter estado = dpf.CreateParameter();
            estado.Value = Estado;
            estado.ParameterName = "@Estado";
            parametros.Add(estado);



            return executeNonQuery("sp_insertSitio", parametros);
        }

        public Cm_ClsSitio ListarPorId(int IdSitio)
        {
            Cm_ClsSitio cmSitio = new Cm_ClsSitio();

            string StoreProcedure = "sp_ListarSitioId";
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
                    param.ParameterName = "id_sitio";
                    param.Value = IdSitio;
                    cmd.Parameters.Add(param);
                    con.Open();
                    using (DbDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.Read())
                        {
                            cmSitio = new Cm_ClsSitio(
                                    IdSitio,
                                    (string)dr["Nombre"],
                                    (string)dr["ubicacion"],
                                    (string)dr["Descripcion"],
                                    (string)dr["Estado"]);
                        }
                    }
                }
            }
            return cmSitio;
        }
        public List<Cm_ClsSitio> listarSitios()
        {
            List<Cm_ClsSitio> ListaSitios = new List<Cm_ClsSitio>();
            string StoreProcedure = "sp_ListarSitio";
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
                            ListaSitios.Add(
                                new Cm_ClsSitio(
                                    (int)dr["Id_Sitio"],
                                    (string)dr["Nombre"],
                                    (string)dr["ubicacion"],
                                    (string)dr["Descripcion"],
                                    (string)dr["Estado"]));
                        }
                    }
                }
            }
            return ListaSitios;
        }

        public int ActSitio(
            int id_Sitio,
            string Nombre,
            string Ubicacion,
            string Descripcion,
            string Estado)
        {
            List<DbParameter> parametros = new List<DbParameter>();

            DbParameter param0 = dpf.CreateParameter();
            param0.Value = id_Sitio;
            param0.ParameterName = "@id_sitio";
            parametros.Add(param0);

            DbParameter nombre = dpf.CreateParameter();
            nombre.Value = Nombre;
            nombre.ParameterName = "@Nombre";
            parametros.Add(nombre);


            DbParameter ubicacion = dpf.CreateParameter();
            ubicacion.Value = Ubicacion;
            ubicacion.ParameterName = "@ubicacion";
            parametros.Add(ubicacion);


            DbParameter descripcion = dpf.CreateParameter();
            descripcion.Value = Descripcion;
            descripcion.ParameterName = "@Descripcion";
            parametros.Add(descripcion);


            DbParameter estado = dpf.CreateParameter();
            estado.Value = Estado;
            estado.ParameterName = "@Estado";
            parametros.Add(estado);

            return executeNonQuery("sp_modificarSitio", parametros);

          
        }
    }
}