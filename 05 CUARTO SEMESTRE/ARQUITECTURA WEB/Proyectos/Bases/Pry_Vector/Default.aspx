<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Productos</title>
    <link rel="stylesheet" href="main.css" type="text/css" />
    <script runat="server">
        //protected void Page_Load(object sender, EventArgs e)
        //{
        //    ClsProdcuto objproducto = new ClsProdcuto("CheeseCake", "http://images.sweetauthoring.com/recipe/51_593.jpg", 20.00);
        //    //Response.Write(objproducto.escribirHTML());
        //    objproducto.PrecioCambio += objproducto.changeDetected;
        //    objproducto.Precio = objproducto.Precio * 2;
        //    Response.Write(objproducto.escribirHTML());
        //}        
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="resultado">
    
        <asp:Label ID="lblresultado" runat="server"></asp:Label>
    
        <br />
        <br />
        <br />
        <br />
        <br />
    
    </div>
    <div class="ingreso">
    
        <br />
        <br />
        Ingresar los datos:<br />
        <br />
    
        Nombre:&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtnombre" runat="server"></asp:TextBox>
        <br />
        Url:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtimgUrl" runat="server" Width="307px"></asp:TextBox>
        <br />
        Precio:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtprecio" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="btningresar" runat="server" Text="INGRESAR" Width="456px" 
            onclick="btningresar_Click" />
    
    </div>
    Registro de Productos</form>
</body>
</html>
