<%@ Page Language="C#" AutoEventWireup="true" CodeFile="listar.aspx.cs" Inherits="listar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body  style="background-image:url(Img/original.jpg); background-size:600px;">
    <form id="form1" runat="server">
    <table style="width:100%; border-spacing:30px 20px;">
  <tr style="margin-top:100px">
    <th colspan = "3"  style="background-image:url(Img/img3.jpg);"><br/><img class="animated shake" src="Img/img2.png" height="150px" width="700px"/>
      <br/>
      <br/>
      <table style="margin: 0 auto auto auto; border-spacing:50px 0px; width:80%; text-align:center;" height="10px"> 
          <tr>
        <th style="text-align:center;  color:white;" width="50px"><asp:ImageButton ID="ImageButton1"  runat="server" ImageUrl="~/Img/inicio.png" Width="50px" Height="50px" href="index.aspx"/> <br/> Inicio</th>
        <th style="text-align:center;  color:white;" width="50px"><asp:ImageButton ID="ImageButton2"  runat="server" ImageUrl="~/Img/Pastel.png" Width="150px" Height="80px" href="index.aspx"/> <br/>Recetas</th>
        <th style="text-align:center;  color:white;" width="50px"><asp:ImageButton ID="ImageButton3"  runat="server" ImageUrl="~/Img/contactoo.png" Width="50px" Height="50px" href="listar.aspx"/> <br/> Ver Recetas</th>
          </tr>
        </table>
        <br/>
    </th>
  </tr>
  <tr>
    <td rowspan = "2" style="text-align:center;  background-image:url(Img/pastel1.png);" height="600px" width="200px"></td>
   
      <td style="text-align:center">
          Elija un Chef:
          <br/>
          <br/>
        <asp:DropDownList ID="dropChefs" runat="server" OnTextChanged="dropChefs_TextChanged"></asp:DropDownList>
    </td>		
    <td rowspan = "2" style="text-align:center;  background-image:url(Img/pastel2.png);" width="200px" ></td>
  </tr>
  <tr>
    <td style="text-align:center; background-color:white; " >
          <span id="MostrarRecetas" runat="server"></span>
    </td>	
  </tr>
  <tr>
    <td colspan = "3" style="text-align:center; background-image:url(Img/img3.jpg); color:white; font:200;"><pre>
Amazonas N85-11 y 6 de Diciembre
Quito - Ecuador
Teléfono: (02) 2445 123</pre>
    </td>
  </tr>
</table>
    </form>
</body>
</html>
