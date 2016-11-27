using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using System.Runtime.Serialization.Json;
using System.Net;
using System.Threading;
using System.ComponentModel;
using Newtonsoft.Json;
using System.IO;
using System.ServiceModel.Web;

namespace presentation.utilities
{
    public class JasonCall
    {
        private object _Result = null;
        private string _ErrorMessage = null;
        private enum eTypeSend { 
            Put,
            Get
        }
        #region events & delegates
        public delegate void dDataArrived(object result, string errorMessage);
        public event dDataArrived DataArrived;
        #endregion

        public  void GetData_ByPutRestMethodAsync(string urlService, Type resultType,object parameter,Type parameterType)
        {
            RunAsync(urlService,resultType, eTypeSend.Put,parameterType,parameter);
        }
        public  void GetData_ByGetRestMethodAsync(string urlServiceWithParameters, Type typeOfResult)
        {
            RunAsync(urlServiceWithParameters, typeOfResult, eTypeSend.Get);
        }
        private  void RunAsync(string urlService, Type resultType, eTypeSend TypeSend, Type parameterType=null, object parameter = null)
        {
            var worker = new BackgroundWorker();
            worker.DoWork += (object sender, DoWorkEventArgs e) => {
                ExecuteRest(urlService, resultType, TypeSend, parameterType, parameter);
            };
            worker.RunWorkerCompleted += worker_RunWorkerCompleted;
            worker.RunWorkerAsync();
        }
        void worker_RunWorkerCompleted(object sender, RunWorkerCompletedEventArgs e)
        {
            if (DataArrived != null) {
                DataArrived(_Result, _ErrorMessage);
            }
        }
        private  void ExecuteRest(string urlService, Type resultType, eTypeSend TypeSend, Type parameterType, object parameter)
        {
            try
            {
                _Result = null;
                _ErrorMessage = null;
                switch (TypeSend)
                {
                    case eTypeSend.Get:
                        _Result = GetData_ByGetRestMethod(urlService, resultType);
                        break;
                    case eTypeSend.Put:
                        _Result = GetData_ByPutRestMethod(urlService, parameter, parameterType, resultType);
                        break;
                }
            }
            catch (Exception )
            {
                throw;
            }
        }
        public object GetData_ByGetRestMethod(string urlServiceWithParameters, Type resultType)
        {
            try
            {
                DataContractJsonSerializer serializador;
                System.IO.Stream resultStream;
                var request = WebRequest.Create(urlServiceWithParameters);
                var response = request.GetResponse();
                serializador = new DataContractJsonSerializer(resultType);
                resultStream = response.GetResponseStream();
                return ReturnValueFromStream(resultType, resultStream);
            }
            catch (Exception)
            {
                throw;
            }
            
        }
        public object GetData_ByPutRestMethod(string urlService, object parameter, Type parameterType, Type resultType)
        {
            var serializador = new DataContractJsonSerializer(parameterType);
            var request = WebRequest.Create(urlService);
            request.Method = "PUT";
            request.ContentType = "application/json";
            serializador.WriteObject(request.GetRequestStream(), parameter);
            var response = request.GetResponse();
            return ReturnValueFromStream(resultType,response.GetResponseStream());
        }
        private  void WriteStream(ref WebRequest request, string jasonValue)
        {
            using (var sw = new StreamWriter(request.GetRequestStream()))
            {
                sw.Write(jasonValue);
            }
        }
        private  object ReturnValueFromStream(Type typeOfResult, System.IO.Stream resultStream)
        {
            string value = GetString_FromJason(resultStream);
            if (string.IsNullOrEmpty(value))
                return null;
            else
                try
                {
                    return JsonConvert.DeserializeObject(value, typeOfResult);
                }
                catch (Exception)
                {
                    throw new Exception(string.Format("No se pudo deserealizar el objeto con el formato JASON:\r\n{0}",value));
                }
                
        }
        private  string GetString_FromJason(Stream stream)
        {
            using (StreamReader reader = new StreamReader(stream, Encoding.UTF8))
            {
                return reader.ReadToEnd();
            }
        }
        
    }
}
