<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Uno.aspx.cs" Inherits="Demo.Uno" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head head runat="server">
<%--<%--  <title>jQuery UI Date Time Picker Simple</title><link type="text/css"rel="stylesheet"
     href="http://jquery-ui.googlecode.com/svn/tags/1.7/themes/redmond/jquery-ui.css" /><script type="text/javascript"
     src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script><script type="text/javascript"
     src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.2/jquery-ui.min.js"></script><script type="text/javascript">
      $(document).ready(function () {
          $('#txtFechaSimple').datepicker();
      });
  </script></head><body><form id="form1" runat="server">
    <div><input id="txtFechaSimple" type="text" /></div>
  </form>
</body>
</html> --%>

<title>jQuery UI Date Time Picker Configurado</title>
  <link type="text/css" rel="stylesheet"
    href="http://jquery-ui.googlecode.com/svn/tags/1.7/themes/redmond/jquery-ui.css" />   
  <script type="text/javascript"   
    src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
  <script type="text/javascript"
    src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.2/jquery-ui.min.js"></script>
 
  <script type="text/javascript">
      $(document).ready(function () {
          $('#txtFecha').datepicker(
            { dateFormat: 'dd/mm/yy',
                minDate: new Date('1940-01-01'),
                maxDate: new Date('2020-12-31'),
                changeMonth: true,
                changeYear: true,
                numberOfMonths: 1,
                dayNamesMin: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sa'],
                monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo',
                    'Junio', 'Julio', 'Agosto', 'Septiembre',
                    'Octubre', 'Noviembre', 'Diciembre'],
                monthNamesShort: ['Ene', 'Feb', 'Mar', 'Abr',
                    'May', 'Jun', 'Jul', 'Ago',
                    'Sep', 'Oct', 'Nov', 'Dic']
            });
      });
  </script> 
</head>
<body style="font-size:12px;">
  <form id="form1" runat="server">
    <div class="demo"><p>Fecha: <input id="txtFecha" type="text" /></p></div>
  </form>
</body>
</html>