using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Newtonsoft.Json;
using utilities;

namespace presentation.utilities
{
    public class SerializadorJason:contratos.ISerializador
    {
        public static void Serializar(object objToSerialise,  string _FilePathCatalogo) {
            var instancia = new SerializadorJason();
            instancia.SerializarMethod(objToSerialise,  _FilePathCatalogo);
        }
        public static object Deserializar(string filePathCatalogo, Type type)
        {
            var instancia = new SerializadorJason();
            return instancia.DeserializarSerializarMethod(filePathCatalogo, type);
        }
        public void SerializarMethod(object objToSerialise,  string _FilePathCatalogo)
        {
            var settings = new JsonSerializerSettings();
            settings.ReferenceLoopHandling = ReferenceLoopHandling.Ignore;
            string jsonValue=JsonConvert.SerializeObject(objToSerialise,settings);
            Archivo.EscribirEnArchivo(_FilePathCatalogo, jsonValue);
        }
        public object DeserializarSerializarMethod(string filePathCatalogo, Type type)
        {
            string jasonValue=Archivo.GetStrigText(filePathCatalogo);
			if (jasonValue != null)
			{
				try
				{
					return JsonConvert.DeserializeObject(jasonValue, type);//da un error si es que fue serializado en xml
				}
				catch (Exception)
				{
					System.IO.File.Delete(filePathCatalogo);
					throw new Exception(
						string.Format("Se produjo un error al deserializar el objeto del tipo {0}\r\nCierre el programa y vuelva a abrirlo por favor")
					);
				}
			}
			return null;
        }
    }
}
