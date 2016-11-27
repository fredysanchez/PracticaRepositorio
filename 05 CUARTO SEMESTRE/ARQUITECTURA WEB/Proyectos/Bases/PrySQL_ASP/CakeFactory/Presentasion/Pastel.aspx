<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pastel.aspx.cs" Inherits="CakeFactory.Presentasion.Pastel" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="style1">
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Url:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txturl" runat="server" Width="75%"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Costo:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtcosto" runat="server" Width="75%"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Descripcion:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtdes" runat="server" Width="75%"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:Button ID="btnregistrar" runat="server" onclick="btnregistrar_Click" 
                        Text="Registrar" Width="127px" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
