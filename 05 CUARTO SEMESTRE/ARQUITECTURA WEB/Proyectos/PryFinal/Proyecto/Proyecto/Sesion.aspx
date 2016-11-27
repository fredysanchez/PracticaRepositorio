<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Sesion.aspx.cs" Inherits="Proyecto.Sesion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div>
<table border="1" align="center" width="70%">
<tr>
<td>
<table border="1">
<tr>
<td>
    <asp:Label ID="Label2" runat="server" Text="Login"></asp:Label>
    </td>
<td>&nbsp;</td>
</tr>

<tr>
<td>
    <asp:Label ID="Label3" runat="server" Text="Usuario"></asp:Label>
    </td>
<td>
    <asp:TextBox ID="txtusuario" runat="server"></asp:TextBox>
    </td>
</tr>

<tr>
<td>
    <asp:Label ID="Label4" runat="server" Text="Contraseña"></asp:Label>
    </td>
<td>
    <asp:TextBox ID="txtcontraseña" runat="server"></asp:TextBox>
    </td>
</tr>

<tr>
<td>
    <asp:Label ID="lblerror" runat="server"></asp:Label>
    </td>
<td>
    <asp:Button ID="btmingreso" runat="server" Text="Ingresar" Width="125px" />
    </td>
</tr>

</table>
</td>
<td>
<table border="1">
<tr>
<td colspan="3">
    <asp:Label ID="lblcargo" runat="server" Text="EMPLEADO"></asp:Label>
    </td>
</tr>
<tr>
<td>
    <asp:Image ID="Image2" runat="server" Height="80px" Width="75px" />
    </td>
<td></td>
<td>
    <asp:Label ID="lblnota" runat="server" Text="Label"></asp:Label>
    </td>
</tr>
<tr>
<td colspan="3">
    <asp:Label ID="Label6" runat="server" Text="Actividades"></asp:Label>
    </td>
</tr>
<tr>
<td colspan="3">
    <asp:TextBox ID="TextBox1" runat="server" Height="98px"></asp:TextBox>
    </td>
</tr>
</table>
</td>

<td>
<table border="1">
<tr>
<td>
    <asp:Button ID="btmactualizar" runat="server" Text="Actualizar" Width="160px" />
    </td>
</tr>
<tr>
<td>
    <asp:Button ID="btmbaja" runat="server" Text="Dar de baja" Width="160px" />
    </td>
</tr>
<tr>
<td>
    <asp:Button ID="btmregistraractividad" runat="server" 
        Text="Registrar actividad" Width="160px" />
    </td>
</tr>
<tr>
<td>
    <asp:Button ID="btmempleados" runat="server" Text="Empleados" Width="160px" />
    </td>
</tr>

</table>
</td>
</tr>

</table>
</div>
</asp:Content>
