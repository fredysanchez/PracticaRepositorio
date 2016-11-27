using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Configuration;
using System.Data.Common;
using System.Data;
using CakeFactory.Comun;

namespace CakeFactory.Datos
{
    public class Dt_ClsPastel
    {
        public Dt_ClsPastel() { }
        public static string constr {
            get { return ConfigurationManager.ConnectionStrings["Conn"].ConnectionString; }
        }

        public static string provider {
            get { return ConfigurationManager.ConnectionStrings["Conn"].ProviderName;}
        }

        public static DbProviderFactory dpf{
            get { return DbProviderFactories.GetFactory(provider); }
        }

        private static int executeNonQuery(string StoreProcedure, List<DbParameter> parametros){
            int Id=0;
            try 
	        {	        
		        using(DbConnection con= dpf.CreateConnection()){
                    con.ConnectionString=constr;
                    using(DbCommand cmd=dpf.CreateCommand()){
                        cmd.Connection=con;
                        cmd.CommandText=StoreProcedure;
                        cmd.CommandType=CommandType.StoredProcedure;
                        foreach (DbParameter param in parametros ){
                            cmd.Parameters.Add(param);
	                    }
                        con.Open();
                        Id = cmd.ExecuteNonQuery();
                    }
                }
	        }
	        catch (Exception )
	        {
		        throw;
	        } 
            return Id;
        }

        public int insertarPastel(string url, decimal costo, string descripcion) {
            List<DbParameter> parametros=new List<DbParameter>();

            DbParameter param=dpf.CreateParameter();
            param.Value=url;
            param.ParameterName="url_pas";
            parametros.Add(param);

            DbParameter param1=dpf.CreateParameter();
            param1.Value=costo;
            param1.ParameterName="costo_pas";
            parametros.Add(param1);

            DbParameter param2=dpf.CreateParameter();
            param2.Value=descripcion;
            param2.ParameterName="descripcion_pas";
            parametros.Add(param2);

            return executeNonQuery("insertarPastel",parametros);
        }
        public List<Cm_ClsPastel> listarPasteles() {
            List<Cm_ClsPastel> ListaPasteles = new List<Cm_ClsPastel>();
            string StoreProcedure = "obtenerPastel";
            using (DbConnection con = dpf.CreateConnection()) {
                con.ConnectionString = constr;
                using (DbCommand cmd = dpf.CreateCommand()){
                    cmd.Connection = con;
                    cmd.CommandText = StoreProcedure;
                    cmd.CommandType = CommandType.StoredProcedure;
                    con.Open();
                    using (DbDataReader dr = cmd.ExecuteReader()) {
                        while (dr.Read()){
                            ListaPasteles.Add(
                                new Cm_ClsPastel(
                                    (int)dr["id_pas"],
                                    (string)dr["url_pas"],
                                    (string)dr["descripcion_pas"],
                                    (decimal)dr["costo_pas"]));
                        }
                    }
                }
            }
            return ListaPasteles;
        }

        public Cm_ClsPastel ListarPastelPorId(int IdPastel) {
            Cm_ClsPastel cmPastel = new Cm_ClsPastel();
            string StoreProcedure = "obtenerPastelPorId";
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
                    param.ParameterName = "id_pas";
                    param.Value = IdPastel;
                    cmd.Parameters.Add(param);
                    con.Open();
                    using (DbDataReader dr = cmd.ExecuteReader()) {
                        if (dr.Read())
                        {
                            cmPastel=new Cm_ClsPastel(
                                    IdPastel,
                                    (string)dr["url_pas"],
                                    (string)dr["descripcion_pas"],
                                    (decimal)dr["costo_pas"]);
                        }
                    }
                }
            }
            return cmPastel;
        }

        public int ActualizarPastel(int IpPastel,string urlPastel,string desPastel, decimal costoPastel) { 
            List<DbParameter> parametros=new List<DbParameter>();

            DbParameter param0=dpf.CreateParameter();
            param0.Value=IpPastel;
            param0.ParameterName="id_pas";
            parametros.Add(param0);

            DbParameter param=dpf.CreateParameter();
            param.Value=urlPastel;
            param.ParameterName="url_pas";
            parametros.Add(param);

            DbParameter param1=dpf.CreateParameter();
            param1.Value=costoPastel;
            param1.ParameterName="costo_pas";
            parametros.Add(param1);

            DbParameter param2=dpf.CreateParameter();
            param2.Value=desPastel;
            param2.ParameterName="descripcion_pas";
            parametros.Add(param2);

            return executeNonQuery("modificarPastel", parametros);
        }
    }
}