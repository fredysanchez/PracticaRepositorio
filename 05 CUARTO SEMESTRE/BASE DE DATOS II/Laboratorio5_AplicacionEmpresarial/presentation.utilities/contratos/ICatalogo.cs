using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace presentation.utilities.contratos
{
    public interface ICatalogo
    {
        string FilePathCatalogo { get;}
        bool EsCatalogoActual();
        object GetCatalogoFromBdd();
        object GetCatalogoLocal();
        object GetCatalogo();

        void BorrarCatalogoLocal();
        DateTime GetFechaCatalogoFromBdd();
    }
}
