<%@ Page Title="" Language="C#" MasterPageFile="~/Presentacion/PaginaPrincipal.Master" AutoEventWireup="true" CodeBehind="EnlazarEmpleados.aspx.cs" Inherits="PryDesempeñoEmpleados.Presentacion.EnlazarEmpleados" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
        }
        .style3
        {
            width: 49px;
        }
        .style4
        {
            width: 579px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style1">
        <tr>
            <td colspan="2">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td colspan="3">
                &nbsp;</td>
            <td colspan="2">
                &nbsp;</td>
            <td colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;</td>
            <td colspan="6">
                Enlazar Empleados.</td>
            <td colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td align="right" colspan="3">
                Jefe:<asp:DropDownList ID="djefe" runat="server" DataSourceID="SqlDataSource1" 
                    DataTextField="nombreE" DataValueField="id_Empleado" Width="60%">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:Conn %>" 
                    SelectCommand="SELECT * FROM [EMPLEADO] WHERE ([estado] = @estado)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="Activo" Name="estado" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td class="style3">
                &nbsp;</td>
            <td align="left" colspan="2">
                Subordinado:<asp:DropDownList ID="dempleado" runat="server" 
                    DataSourceID="SqlDataSource1" DataTextField="nombreE" 
                    DataValueField="id_Empleado" Width="60%">
                </asp:DropDownList>
            </td>
            <td colspan="2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td colspan="3">
                &nbsp;</td>
            <td colspan="2">
                &nbsp;</td>
            <td colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td colspan="3">
                &nbsp;</td>
            <td colspan="2">
                &nbsp;</td>
            <td colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;</td>
            <td align="center" class="style2" colspan="6">
                <asp:ImageButton ID="ImageButton1" runat="server" 
                    onclick="ImageButton1_Click" 
                    ImageUrl="~/Presentacion/Images/Boton/guardar.png" />
            </td>
            <td colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td colspan="3">
                &nbsp;</td>
            <td colspan="2">
                &nbsp;</td>
            <td colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td colspan="3">
                &nbsp;</td>
            <td colspan="2">
                &nbsp;</td>
            <td colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td colspan="3">
                &nbsp;</td>
            <td colspan="2">
                &nbsp;</td>
            <td colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td colspan="3">
                &nbsp;</td>
            <td colspan="2">
                &nbsp;</td>
            <td colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td colspan="3">
                &nbsp;</td>
            <td colspan="2">
                &nbsp;</td>
            <td colspan="2">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
