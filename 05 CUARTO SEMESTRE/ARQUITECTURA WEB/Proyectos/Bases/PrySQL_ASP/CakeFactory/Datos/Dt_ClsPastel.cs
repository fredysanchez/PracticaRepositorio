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
    }
}