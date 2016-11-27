using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace presentation.utilities.contratos
{
    /// <summary>
    /// Toda la persistencia de serialización se maneja en el directorio temporal
    /// por lo que no hace falta pasar como parámetro la ubicación del archivo.
    /// </summary>
    public interface ISerializador
    {
        void SerializarMethod(object objToSerialise, string _FilePathCatalogo);
        object DeserializarSerializarMethod(string filePathCatalogo, Type type);
    }
}
