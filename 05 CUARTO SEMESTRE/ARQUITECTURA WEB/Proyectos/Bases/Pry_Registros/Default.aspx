<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pasteles</title>
    <style type="text/css">
        .style7
        {
            height: 25px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
           <table border="1" style="width:100%">
          <tr>
            <td style="text-align: center;" colspan="4" class="style7">Header</td>
          </tr>
          <tr>
            <td style="text-align: center; width:100px"  rowspan="2">


        <div>
        <table border="1" style="width:100%">
          <tr>
            <td>Nombre:</td>
            <td>
                <asp:TextBox ID="txtnombre" runat="server"></asp:TextBox>
              </td>
          </tr>
          <tr>
            <td>Url:</td>
            <td>
                <asp:TextBox ID="txturl" runat="server"></asp:TextBox>
              </td>
          </tr>
          <tr>
            <td style="text-align: center;" colspan="4">
                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Ingresar" 
                    Width="187px" />
              </td>
          </tr>
        </table>

        </div>

        </td>
            <td  >
                <asp:GridView ID="grvProducto" style="margin:10px 100px 0 0" runat="server">
                </asp:GridView>
                <asp:ImageButton ID="btnmostrar" runat="server" Height="50px" 
                    ImageAlign="Middle" ImageUrl="~/img/visor.png" onclick="btnmostrar_Click" 
                    Width="50px" />
              </td>
    
          </tr>
          <tr>
            <td style="height:500px"><span id="mostarprod" runat="server">&nbsp</span></td>
          </tr>

          <tr>
            <td style="text-align: center;" colspan="4">Footer</td>
          </tr>
        </table>

    </form>
</body>
</html>
