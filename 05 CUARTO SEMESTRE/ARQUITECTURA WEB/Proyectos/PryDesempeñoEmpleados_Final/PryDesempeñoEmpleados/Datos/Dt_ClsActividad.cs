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
    public class Dt_ClsActividad
    {
        public Dt_ClsActividad() { }
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

        public int insertarActividad(
            string Nombre,
            string Descripcion,
            DateTime FechaRealizacion,
            double Duracion,
            int Dificultad,
            string Estado,
            int IdEmpleado,
            int IdSitio
            )
        {
            List<DbParameter> parametros = new List<DbParameter>();

            DbParameter nombre = dpf.CreateParameter();
            nombre.Value = Nombre;
            nombre.ParameterName = "@nombre";
            parametros.Add(nombre);

            DbParameter descripcion = dpf.CreateParameter();
            descripcion.Value = Descripcion;
            descripcion.ParameterName = "@descripcion";
            parametros.Add(descripcion);

            DbParameter fecharealizacion = dpf.CreateParameter();
            fecharealizacion.Value = FechaRealizacion;
            fecharealizacion.ParameterName = "@fechaRealizacion";
            parametros.Add(fecharealizacion);


            DbParameter duracion = dpf.CreateParameter();
            duracion.Value = Duracion;
            duracion.ParameterName = "@duracion";
            parametros.Add(duracion);

            
            DbParameter dificultad = dpf.CreateParameter();
            dificultad.Value = Dificultad;
            dificultad.ParameterName = "@dificultad";
            parametros.Add(dificultad);


            DbParameter estado = dpf.CreateParameter();
            estado.Value = Estado;
            estado.ParameterName = "@estado";
            parametros.Add(estado);

            DbParameter id_Empleado = dpf.CreateParameter();
            id_Empleado.Value =IdEmpleado ;
            id_Empleado.ParameterName = "@id_Empleado";
            parametros.Add(id_Empleado);

            DbParameter id_Sitio = dpf.CreateParameter();
            id_Sitio.Value =IdSitio ;
            id_Sitio.ParameterName = "@id_Sitio";
            parametros.Add(id_Sitio);

            

            return executeNonQuery("sp_insertActividad", parametros);
        }

        public int modificar( int idB) {
            List<DbParameter> parametros = new List<DbParameter>();

            DbParameter id = dpf.CreateParameter();
            id.Value = idB;
            id.ParameterName = "@Id";
            parametros.Add(id);

            return executeNonQuery("sp_Modificar", parametros);
        }

        public Cm_ClsActividad ListarPorId(int IdActividad)
        {
            Cm_ClsActividad cmactividad= new Cm_ClsActividad();

            string StoreProcedure = "sp_ListarActividadId";
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
                    param.ParameterName = "id_Actividad";
                    param.Value = IdActividad;
                    cmd.Parameters.Add(param);
                    con.Open();
                    using (DbDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.Read())
                        {
                            cmactividad = new Cm_ClsActividad(
                                    IdActividad,
                                    (string)dr["nombre"],
                                    (string)dr["descripcion"],
                                    (DateTime)dr["fechaRealizacion"],
                                    (double)dr["duracion"],
                                    (int)dr["dificultad"],
                                    (string)dr["estado"],
                                    (int)dr["id_Empleado"],
                                    (int)dr["id_Sitio"]);
                        }
                    }
                }
            }
            return cmactividad;
        }
        public List<Cm_ClsActividad> listarActividades()
        {
            List<Cm_ClsActividad> ListaActividades = new List<Cm_ClsActividad>();
            string StoreProcedure = "sp_ListarActividad";
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
                            ListaActividades.Add(
                                new Cm_ClsActividad(
                                    (int)dr["id_Actividad"],
                                    (string)dr["nombre"],
                                    (string)dr["descripcion"],
                                    (DateTime)dr["fechaRealizacion"],
                                    (double)dr["duracion"],
                                    (int)dr["dificultad"],
                                    (string)dr["estado"],
                                    (int)dr["id_Empleado"],
                                    (int)dr["id_Sitio"]));
                        }
                    }
                }
            }
            return ListaActividades;
        }



        public int ActActividades(
          int id_Actividad,
          string Nombre,
          string Descripcion,
          DateTime Fecha,
            double Duracion,
            double calificacion,
            int dificultad,
          string Estado,
            int Id_Empleado,
            int Id_Sitio
            )
        {
            List<DbParameter> parametros = new List<DbParameter>();

            DbParameter param0 = dpf.CreateParameter();
            param0.Value = id_Actividad;
            param0.ParameterName = "@id_Actividad";
            parametros.Add(param0);

            DbParameter nombre = dpf.CreateParameter();
            nombre.Value = Nombre;
            nombre.ParameterName = "@nombre";
            parametros.Add(nombre);

            DbParameter descripcion = dpf.CreateParameter();
            descripcion.Value = Descripcion;
            descripcion.ParameterName = "@descripcion";
            parametros.Add(descripcion);

            DbParameter fecharealizacion = dpf.CreateParameter();
            fecharealizacion.Value = Fecha;
            fecharealizacion.ParameterName = "@fechaRealizacion";
            parametros.Add(fecharealizacion);


            DbParameter duracion = dpf.CreateParameter();
            duracion.Value = Duracion;
            duracion.ParameterName = "@duracion";
            parametros.Add(duracion);

            DbParameter calificacion1 = dpf.CreateParameter();
            calificacion1.Value = calificacion;
            calificacion1.ParameterName = "@calificacion";
            parametros.Add(calificacion1);

            DbParameter dificultad2 = dpf.CreateParameter();
            dificultad2.Value = dificultad;
            dificultad2.ParameterName = "@dificultad";
            parametros.Add(dificultad2);


            DbParameter estado = dpf.CreateParameter();
            estado.Value = Estado;
            estado.ParameterName = "@estado";
            parametros.Add(estado);

            DbParameter id_Empleado = dpf.CreateParameter();
            id_Empleado.Value = Id_Empleado;
            id_Empleado.ParameterName = "@id_Empleado";
            parametros.Add(id_Empleado);

            DbParameter id_Sitio = dpf.CreateParameter();
            id_Sitio.Value = Id_Sitio;
            id_Sitio.ParameterName = "@id_Sitio";
            parametros.Add(id_Sitio);

            return executeNonQuery("sp_ModificarActividad", parametros);


        }

        public int Nota(
          int id_Actividad,
            double calificacion
            )
        {
            List<DbParameter> parametros = new List<DbParameter>();

            DbParameter param0 = dpf.CreateParameter();
            param0.Value = id_Actividad;
            param0.ParameterName = "@id_Actividad";
            parametros.Add(param0);

            DbParameter calificacion1 = dpf.CreateParameter();
            calificacion1.Value = calificacion;
            calificacion1.ParameterName = "@calificacion";
            parametros.Add(calificacion1);

           

            return executeNonQuery("sp_NotaActividad", parametros);


        }
        public int extraerNota(
            int id_Empleado,
            int id_Actividad
            
            )
        {
            List<DbParameter> parametros = new List<DbParameter>();

            DbParameter param0 = dpf.CreateParameter();
            param0.Value = id_Empleado;
            param0.ParameterName = "@id_Empleado";
            parametros.Add(param0);

            DbParameter calificacion1 = dpf.CreateParameter();
            calificacion1.Value = id_Actividad;
            calificacion1.ParameterName = "@id_Actividad";
            parametros.Add(calificacion1);



            return executeNonQuery("sp_regactividad", parametros);


        }
    }
}