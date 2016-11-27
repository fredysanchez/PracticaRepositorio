<%@ Page Title="" Language="C#" MasterPageFile="~/Presentacion/PaginaPrincipal.Master" AutoEventWireup="true" CodeBehind="Administrador.aspx.cs" Inherits="PryDesempeñoEmpleados.Presentacion.Administrador" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 201px;
        }
        .style4
        {
            width: 201px;
            height: 18px;
        }
        .style5
        {
            height: 18px;
        }
        .style7
        {
            width: 235px;
        }
        .style8
        {
            width: 235px;
            height: 18px;
        }
        .style9
        {
            width: 276px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style1">
        <tr>
            <td class="style2" width="200px">
                &nbsp;</td>
            <td class="style9">
                &nbsp;</td>
            <td class="style7">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style4" width="200px">
                </td>
            <td align="right" class="style9" rowspan="12">
                <asp:Image ID="Image1" runat="server" Height="210px" Width="65%" />
            </td>
            <td class="style8">
                </td>
            <td class="style5">
                </td>
            <td class="style4">
                </td>
        </tr>
        <tr>
            <td class="style2" width="200px">
                &nbsp;</td>
            <td class="style7">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2" width="200px">
                &nbsp;</td>
            <td align="left" class="style7">
&nbsp;&nbsp;&nbsp; Informacion general.</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2" width="200px">
                &nbsp;</td>
            <td align="left" class="style7">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </td>
            <td>
                <asp:ImageButton ID="rempleado" runat="server" 
                    onclick="empleado_Click" 
                    ImageUrl="~/Presentacion/Images/Boton/recempleado.png" />
                </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2" width="200px">
                &nbsp;</td>
            <td align="left" class="style7">
&nbsp;&nbsp;&nbsp; Nombre:
                <asp:Label ID="nombre" runat="server"></asp:Label>
&nbsp;<asp:Label ID="apellido" runat="server"></asp:Label>
            </td>
            <td>
                <asp:ImageButton ID="rgarco" runat="server" 
                    onclick="rgarco_Click" 
                    ImageUrl="~/Presentacion/Images/Boton/regcargos.png" />
                </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2" width="200px">
                &nbsp;</td>
            <td align="left" class="style7">
&nbsp;&nbsp;&nbsp; Fecha de nacimiento:
                <asp:Label ID="fecha" runat="server"></asp:Label>
            </td>
            <td>
                <asp:ImageButton ID="rsitio" runat="server" 
                    onclick="rsitio_Click" 
                    ImageUrl="~/Presentacion/Images/Boton/regsitio.png" />
                </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2" width="200px">
                &nbsp;</td>
            <td align="left" class="style7">
&nbsp;&nbsp;&nbsp; Cargo:
                <asp:Label ID="cargo" runat="server"></asp:Label>
            </td>
            <td>
                <asp:ImageButton ID="runidad" runat="server" 
                    onclick="runidad_Click" 
                    ImageUrl="~/Presentacion/Images/Boton/regunidad.png" />
                </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style4" width="200px">
            </td>
            <td align="left" class="style8">
&nbsp;&nbsp;&nbsp; Unidad:
                <asp:Label ID="unidad" runat="server"></asp:Label>
            </td>
            <td class="style5">
                <asp:ImageButton ID="renlace" runat="server" 
                    onclick="renlace_Click" 
                    ImageUrl="~/Presentacion/Images/Boton/conectar.png" />
                </td>
            <td class="style5">
            </td>
        </tr>
        <tr>
            <td class="style2" width="200px">
                &nbsp;</td>
            <td align="left" class="style7">
&nbsp;&nbsp;&nbsp;
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2" width="200px">
                &nbsp;</td>
            <td align="left" class="style7">
&nbsp;&nbsp;&nbsp;
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2" width="200px">
                &nbsp;</td>
            <td align="left" class="style7">
&nbsp;&nbsp;&nbsp;
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2" width="200px">
                &nbsp;</td>
            <td align="left" class="style7">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2" width="200px">
                &nbsp;</td>
            <td class="style9">
                &nbsp;</td>
            <td class="style7">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
