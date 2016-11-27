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
        .style2
        {
            width: 97px;
        }
        .style3
        {
            width: 97px;
            height: 173px;
        }
        .style4
        {
            height: 173px;
            width: 437px;
        }
        .style5
        {
            width: 437px;
        }
        .style6
        {
            height: 23px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="style1">
                <tr ><td colspan="3" align="center" 
                style="font-family: Aharoni; font-size: xx-large; background-color: #C0C0C0">CAKE 
                    FACTORY</td></tr>
        <tr>
                <td class="style2">
                   
                </td>
                <td style="font-family: 'Arial Black'" class="style5">
                   
                    Administracion de Pasteles.</td>
                    <td rowspan="11">
                        <table class="style1">
                            <tr>
                                <td>
                                    <asp:Label ID="lblnombre" runat="server" Font-Bold="True" Font-Italic="False" 
                                        Font-Size="Large">Descripcion:</asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblcosto" runat="server" Text="Costo: $ 0,00"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Image ID="Imurl" runat="server" Height="187px" Width="235px" />
                                </td>
                            </tr>
                            <tr>
                                <td class="style6">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    
                </td>
                <td class="style5">
                   
                    <asp:DropDownList ID="drpPastel" runat="server" Height="35px" Width="50%" 
                        ontextchanged="drpPastel_TextChanged" 
                        onselectedindexchanged="drpPastel_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    
                </td>
                <td class="style5">
                   
                    &nbsp;</td>
            </tr>

                <td align="right" class="style2" 
                    style="font-family: Candara; font-size: larger">
                    <asp:Label ID="Label1" runat="server" Text="Url:"></asp:Label>
                </td>
                <td class="style5">
                    <asp:TextBox ID="txturl" runat="server" Width="50%"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnregistrar" runat="server" onclick="btnregistrar_Click" 
                        Text="Registrar" Width="140px" />
                </td>
            </tr>
            <tr>
                <td align="right" class="style2" 
                    style="font-family: Candara; font-size: larger">
                    <asp:Label ID="Label2" runat="server" Text="Costo:"></asp:Label>
                </td>
                <td class="style5">
                    <asp:TextBox ID="txtcosto" runat="server" Width="50%"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnactualizar" runat="server" Text="Actualizar" Width="140px" 
                        onclick="btnactualizar_Click" />
                </td>
            </tr>
            <tr>
                <td align="right" class="style2" 
                    style="font-family: Candara; font-size: larger">
                    <asp:Label ID="Label3" runat="server" Text="Descripcion:"></asp:Label>
                </td>
                <td class="style5">
                    <asp:TextBox ID="txtdes" runat="server" Width="50%"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" Width="140px" />
                </td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td class="style5">
                    &nbsp;</td>
            </tr>
             <tr>
                <td class="style2">
                    
                </td>
                <td class="style5">
                   
                </td>
            </tr>
             <tr>
                <td class="style3">
                    
                </td>
                <td class="style4">
                   
                    <asp:GridView ID="gridPasteles" runat="server" BackColor="White" 
                        BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                        ForeColor="Black" GridLines="Horizontal">
                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                        <SortedDescendingHeaderStyle BackColor="#242121" />
                    </asp:GridView>
                   
                </td>
            </tr>
             <tr>
                <td class="style2">
                    
                </td>
                <td class="style5">
                   
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    
                </td>
                <td class="style5">
                   
                    &nbsp;</td>
            </tr>

        </table>
    
    </div>
    </form>
</body>
</html>
