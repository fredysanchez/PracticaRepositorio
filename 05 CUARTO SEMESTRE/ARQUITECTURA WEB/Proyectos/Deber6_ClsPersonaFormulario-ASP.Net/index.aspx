<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Arquitecura Web</title>
    <link rel="stylesheet" href="estilos.css" type="text/css" /> 
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div class="header">
            <h1>ARQUITECTURA WEB</h1>
            <h2>Ingreso de Datos</h2>
        </div>
        <div class="ingreso">
           <h3>Datos</h3>
            <p>Nombre:<asp:TextBox ID="txtnombre" runat="server" 
                    ontextchanged="txtnombre_TextChanged" 
                    style="margin-left: 71px; font-family: 'Comic Sans MS';" Width="172px"></asp:TextBox>
            </p>
            <p>Apellido:<asp:TextBox ID="txtapellido" runat="server" 
                    ontextchanged="txtnombre_TextChanged" 
                    style="margin-left: 71px; font-family: 'Comic Sans MS';" Width="172px"></asp:TextBox>
            </p>
            <p>Cedula:<asp:TextBox ID="txtcedula" runat="server" 
                    ontextchanged="txtnombre_TextChanged" 
                    style="margin-left: 71px; font-family: 'Comic Sans MS';" Width="172px"></asp:TextBox>
            </p>
            <p>Telefono:<asp:TextBox ID="txttelefono" runat="server" 
                    ontextchanged="txtnombre_TextChanged" 
                    style="margin-left: 71px; font-family: 'Comic Sans MS';" Width="172px"></asp:TextBox>
            </p>
            <p>Direccion:<asp:TextBox ID="txtdireccion" runat="server" 
                    ontextchanged="txtnombre_TextChanged" 
                    style="margin-left: 71px; font-family: 'Comic Sans MS';" Width="172px"></asp:TextBox>
                <asp:Button ID="btningresar" runat="server" BorderStyle="None" 
                    ForeColor="black" Height="48px" onclick="btningresar_Click" Text="INGRESAR"
                    Width="239px" 
                    
                    
                    style="border-bottom: 2px solid gray; margin-left: 325px; margin-top: 10px; font-family: 'Cooper Black'; text-transform: capitalize; line-height: inherit; letter-spacing: normal; clear: both; float: left;" BackColor="#CCCCCC" 
                    CssClass="header" />
            </p>
          
        </div>
        <div class="resultado">
            <h3>Informacion</h3>
            <p>
                <asp:Label ID="lbldatos" runat="server" Text="*"></asp:Label>
            </p>
            
         </div>
    </div>
    </form>
</body>
</html>
