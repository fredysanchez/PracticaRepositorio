<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pastel.aspx.cs" Inherits="CakeFactory.Presentacion.Pastel" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            height: 7px;
        }
        .style3
        {
            width: 208px;
        }
        .style4
        {
            height: 7px;
            width: 208px;
        }
        .style5
        {
            width: 70px;
        }
        .style6
        {
            height: 7px;
            width: 70px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="style1">
                    <tr>
                <td class="style5">
                    &nbsp;</td>
                <td class="style3">

                    <h1 style="text-align:center">Cake Factory</h1> 

                </td>
                <td>
                    &nbsp;</td>
            </tr>
                        <tr>
                <td class="style5">
                    &nbsp;</td>
                <td class="style3">

                </td>
                <td>
                    &nbsp;</td>
            </tr>
                        <tr>
                <td class="style5">
                    &nbsp;</td>
                <td class="style3">

                    Administración de Pasteles</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style5">
                    &nbsp;</td>
                <td class="style3">

                    <asp:DropDownList ID="drpPasteles" runat="server" 
                        ontextchanged="drpPasteles_TextChanged">
                    </asp:DropDownList>

                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style5">
                    <asp:Label ID="Label4" runat="server" Text="Imagen:"></asp:Label>
                </td>
                <td class="style3">
                    <asp:FileUpload ID="flufotoPastel" runat="server" />
                </td>
                <td>
                    <asp:Label ID="lblnombreP" runat="server" Text="Descripcion:"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style6">
                    <asp:Label ID="Label1" runat="server" Text="Url:"></asp:Label>
                </td>
                <td class="style4">
                    <asp:TextBox ID="txturl" runat="server"></asp:TextBox>
                </td>
                <td class="style2">
                    <asp:Label ID="lblcostoP" runat="server" Text="$ 0,00"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style5" >
                    <asp:Label ID="Label2" runat="server" Text="Costo:"></asp:Label>
                </td>
                <td class="style3">
                    <asp:TextBox ID="txtcosto" runat="server"></asp:TextBox>
                </td>
                <td rowspan ="3">
                    <asp:Image ID="imagenP" runat="server" Width="150px" />
                </td>
            </tr>
            <tr>
                <td class="style5">
                    <asp:Label ID="Label3" runat="server" Text="Descripcion:"></asp:Label>
                </td>
                <td class="style3">
                    <asp:TextBox ID="txtdescrip" runat="server"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style5">
                    &nbsp;</td>
                <td class="style3">
                    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                        Text="Registrar" Width="126px" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>

            <tr >
                <td class="style5">
                    &nbsp;</td>
                <td class="style3">

                    <asp:Button ID="btnActualizar" runat="server" onclick="btnActualizar_Click" 
                        Text="Actualizar" />

                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style5">
                    &nbsp;</td>
                <td class="style3">

                    <asp:GridView ID="grvpasteles" runat="server">
                    </asp:GridView>

                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style5">
                    &nbsp;</td>
                <td class="style3">

                </td>

                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style5">
                    &nbsp;</td>
                <td class="style3">

                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
