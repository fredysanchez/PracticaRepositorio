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
    public class Dt_ClsEmpleadoJefe
    {
        public Dt_ClsEmpleadoJefe() { }

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

        public int insertarEmpleadoJefe(
           int Id_Empleado_Jefe,
          int Id_Empleado_Empleado

           )
        {
            List<DbParameter> parametros = new List<DbParameter>();

            DbParameter id_Empleado_Jefe = dpf.CreateParameter();
            id_Empleado_Jefe.Value = Id_Empleado_Jefe;
            id_Empleado_Jefe.ParameterName = "@id_Empleado_Jefe";
            parametros.Add(id_Empleado_Jefe);


            DbParameter id_Empleado_Empleado = dpf.CreateParameter();
            id_Empleado_Empleado.Value = Id_Empleado_Empleado;
            id_Empleado_Empleado.ParameterName = "@id_Empleado_Empleado";
            parametros.Add(id_Empleado_Empleado);

            return executeNonQuery("sp_insertarEmpleadoJefe", parametros);
        }

        public int listarEmpleadoJefe(
          int Id_Empleado_Jefe
          )
        {
            List<DbParameter> parametros = new List<DbParameter>();

            DbParameter id_Empleado_Jefe = dpf.CreateParameter();
            id_Empleado_Jefe.Value = Id_Empleado_Jefe;
            id_Empleado_Jefe.ParameterName = "@id_Empleado_Jefe";
            parametros.Add(id_Empleado_Jefe);

            return executeNonQuery("sp_listarEmpleadosporJefe", parametros);
        }
    }
}