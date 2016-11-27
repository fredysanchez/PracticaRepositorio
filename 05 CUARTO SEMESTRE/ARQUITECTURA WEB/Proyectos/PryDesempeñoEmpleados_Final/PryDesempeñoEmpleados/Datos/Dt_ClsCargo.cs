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
    public class Dt_ClsCargo
    {
        public Dt_ClsCargo() { }
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

        public int insertarCargo(
            string Nombre,
            string FechaCreacion,
            string Descripccion,
            string Estado
            )
        {
            List<DbParameter> parametros = new List<DbParameter>();

            DbParameter nombre = dpf.CreateParameter();
            nombre.Value = Nombre;
            nombre.ParameterName = "@Nombre";
            parametros.Add(nombre);


            DbParameter fechacreacion = dpf.CreateParameter();
            fechacreacion.Value = FechaCreacion;
            fechacreacion.ParameterName = "@fechaCreacion";
            parametros.Add(fechacreacion);


            DbParameter descripcion = dpf.CreateParameter();
            descripcion.Value = Descripccion;
            descripcion.ParameterName = "@Descripcion";
            parametros.Add(descripcion);


            DbParameter estado = dpf.CreateParameter();
            estado.Value = Estado;
            estado.ParameterName = "@Estado";
            parametros.Add(estado);


            return executeNonQuery("sp_insertCargo", parametros);
        }

        public int modificar( int idB) {
            List<DbParameter> parametros = new List<DbParameter>();

            DbParameter id = dpf.CreateParameter();
            id.Value = idB;
            id.ParameterName = "@Id";
            parametros.Add(id);

            return executeNonQuery("sp_Modificar", parametros);
        }

        public Cm_ClsCargo ListarPorId(int IdCargo)
        {
            Cm_ClsCargo cmcargo= new Cm_ClsCargo();

            string StoreProcedure = "sp_ListarCargoId";
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
                    param.ParameterName = "id_Cargo";
                    param.Value = IdCargo;
                    cmd.Parameters.Add(param);
                    con.Open();
                    using (DbDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.Read())
                        {
                            cmcargo = new Cm_ClsCargo(
                                    IdCargo,
                                    (string)dr["nombreC"],
                                    (DateTime)dr["fechaCreacionC"],
                                    (string)dr["descripcionC"],
                                    (string)dr["estadoC"]);
                        }
                    }
                }
            }
            return cmcargo;
        }
        public List<Cm_ClsCargo> listarCargos()
        {
            List<Cm_ClsCargo> ListaCargos = new List<Cm_ClsCargo>();
            string StoreProcedure = "sp_ListarCargos";
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
                            ListaCargos.Add(
                                new Cm_ClsCargo(
                                    (int)dr["id_Cargo"],
                                    (string)dr["nombreC"],
                                    (DateTime)dr["fechaCreacionC"],
                                    (string)dr["descripcionC"],
                                    (string)dr["estadoC"]));
                        }
                    }
                }
            }
            return ListaCargos;
        }



        public int ActCargo(
          int id_Cargo,
          string NombreCargo,
          string FechaCargo,
          string DescripcionCargo,
          string Estado)
        {
            List<DbParameter> parametros = new List<DbParameter>();

            DbParameter param0 = dpf.CreateParameter();
            param0.Value = id_Cargo;
            param0.ParameterName = "@id_Cargo";
            parametros.Add(param0);

            DbParameter nombre = dpf.CreateParameter();
            nombre.Value = NombreCargo;
            nombre.ParameterName = "@Nombre";
            parametros.Add(nombre);


            DbParameter fecha = dpf.CreateParameter();
            fecha.Value = FechaCargo;
            fecha.ParameterName = "@fechaCreacion";
            parametros.Add(fecha);


            DbParameter descripcion = dpf.CreateParameter();
            descripcion.Value = DescripcionCargo;
            descripcion.ParameterName = "@Descripcion";
            parametros.Add(descripcion);


            DbParameter estado = dpf.CreateParameter();
            estado.Value = Estado;
            estado.ParameterName = "@Estado";
            parametros.Add(estado);

            return executeNonQuery("sp_modificarCargo", parametros);


        }



    }
}