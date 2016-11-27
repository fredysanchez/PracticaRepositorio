<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Recetas</title>
    <link  rel="stylesheet" href="animete.min.css"  type="text/css"/>
    <style type="text/css">
        .auto-style1 {
            width: 176px;
            height: 28px;
        }
        .auto-style2 {
            height: 28px;
        }
    </style>
</head>
<body style="background-image:url(Img/original.jpg); background-size:600px;">
    <form id="form1" runat="server">
   <table style="width:100%; border-spacing:30px 20px;">
  <tr style="margin-top:100px">
    <th colspan = "3"  style="background-image:url(Img/img3.jpg);"><br/><img class="animated shake" src="Img/img2.png" height="150px" width="700px"/>
      <br/>
      <br/>
      <table style="margin: 0 auto auto auto; border-spacing:50px 0px; width:80%; text-align:center;" height="10px"> 
          <tr>
        <th style="text-align:center;  color:white;" width="50px"><asp:ImageButton ID="ImageButton1"  runat="server" ImageUrl="~/Img/inicio.png" Width="50px" Height="50px" href="index.aspx" /> <br/> Inicio</th>
        <th style="text-align:center;  color:white;" width="50px"><asp:ImageButton ID="ImageButton2"  runat="server" ImageUrl="~/Img/Pastel.png" Width="150px" Height="80px" href="index.aspx"/> <br/>Recetas</th>
        <th style="text-align:center;  color:white;" width="50px"><asp:ImageButton ID="ImageButton3"  runat="server" ImageUrl="~/Img/contactoo.png" Width="50px" Height="50px" OnClick="ImageButton3_Click"/> <br/> Ver Recetas</th>
          </tr>
        </table>
        <br/>
    </th>
  </tr>
  <tr>
    <td rowspan = "2" style="text-align:center;  background-image:url(Img/pastel1.png);" height="600px" width="200px"></td>
    <td style="text-align:center">
        <table border="1" style="width:70%; margin: 0 auto auto auto; border-spacing:30px 20px;" >
            
            <tr>
                <td>Nombre:</td>
                <td colspan="2"><asp:TextBox ID="txtnombre" runat="server"></asp:TextBox></td>		
            </tr>
            <tr>
                <td>Apellido:</td>
                <td colspan="2"><asp:TextBox ID="txtapel" runat="server"></asp:TextBox></td>		
            </tr>
            <tr>
                <td>Ciudad:</td>
                <td colspan="2"><asp:TextBox ID="txtciu" runat="server"></asp:TextBox></td>		
            </tr>
            <tr>
                <td colspan="2" style="text-align:left"><asp:Button ID="Button1" runat="server" Text="Ingresar Chef" OnClick="IngresoChef"/></td>	
            </tr>
            <tr>
                <td colspan="3" style="text-align:right"><asp:DropDownList ID="dropResetas" runat="server" Width="100px"></asp:DropDownList></td>
                <td colspan="2" style="text-align:right"> <br/><br/><asp:Button ID="Button2" runat="server" Text="Seleccionar Chef" OnClick="SeleccionChef"/></td>
            </tr>
        </table>
    </td>		
    <td rowspan = "2" style="text-align:center;  background-image:url(Img/pastel2.png);" width="200px" ></td>
  </tr>
  <tr>
    <td style="text-align:center">
        <asp:Panel ID="panelRecep" runat="server" BackColor="#999966" BorderStyle="Groove">
            <table border ="1" style="width:100%">
                <tr>
                    <td style="text-align:left; " class="auto-style1">Nombre del Pastel o Postre:</td>
                    <td colspan="2" class="auto-style2"><asp:TextBox ID="txtnombrePastel" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="text-align:left; width: 176px;">Nro de Ingredientes:</td>
                    <td><asp:TextBox ID="txtingredN" runat="server"></asp:TextBox></td>
                    <td><asp:ImageButton ID="ImageButton5" runat="server" Height="30px" ImageUrl="~/Img/ir.png" Width="40px" OnClick="CapturarNumeroIngredientes" /></td>
                </tr>
                <tr>
                    <td colspan="3" style="width:100%; text-align:right;"><asp:TextBox ID="txtIngredP" runat="server" Width="100%" Height="100px" TextMode="MultiLine"></asp:TextBox> <br/><br/>
                        <asp:Button ID="Button3" runat="server" Text="Ingresar Ingrediente" OnClick="IngresarIngrediente" /> <br/> <br/>
                    </td>
                </tr>
                <tr>
                    <td style="text-align:left; width: 176px;">Nro de Instrucciones:</td>
                    <td><asp:TextBox ID="txtinstrucN" runat="server"></asp:TextBox></td>
                    <td><asp:ImageButton ID="ImageButton4" runat="server" Height="30px" ImageUrl="~/Img/ir.png" OnClick="CapturarNumeroInstrucciones" Width="40px" /></td>
                </tr>
                <tr>
                    <td colspan="3" style="width:100% ; text-align:right;"><asp:TextBox ID="txtInstrucP" runat="server" Width="100%" Height="100px" TextMode="MultiLine"></asp:TextBox> <br/><br/>
                        <asp:Button ID="Button4" runat="server" Text="Ingresar Instrucción" OnClick="IngrearInstrucciones" /> <br/> <br/>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <asp:Button ID="Button5" runat="server" Text="Ingresar Receta" OnClick="Button5_Click" />
                    </td>
                </tr>
                </table>
        </asp:Panel>
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
