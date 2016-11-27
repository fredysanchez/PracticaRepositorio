<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Administrador.aspx.cs" Inherits="Proyecto.Administrador" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style10
        {
            height: 515px;
            width: 628px;
        }
        .style11
        {
            width: 401px;
            height: 515px;
        }
        .style13
        {
            height: 515px;
            width: 422px;
        }
        .style14
        {
            width: 220px;
            height: 156px;
        }
        .style15
        {
            width: 356px;
        }
        .style16
        {
            width: 224px;
        }
        .style17
        {
            width: 224px;
            height: 30px;
        }
        .style18
        {
            width: 142px;
        }
        .style19
        {
            width: 195px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div>
<table border="1">
<tr>
 <td style="text-align: center; " class="style13">
    <table>
  <tr>
   <td class="style14">
       <asp:Image ID="imgfotografia" runat="server" Height="62px" />
   </td>
   </tr>
 </table>
 </td>
 
 <td style="text-align: center; " class="style10" align="left">
 <table>
    <tr>
   <td align="left" class="style15">
       <table>
       <tr>
       <td class="style19">
           NOMBRE:
       </td>
       <td class="style18">
           <asp:TextBox ID="txtnombre" runat="server"></asp:TextBox>
       </td>
       </tr>
       <tr>
       <td class="style19">
           APELLIDO:
       </td>
       <td class="style18">
           <asp:TextBox ID="txtapellido" runat="server"></asp:TextBox>
       </td>
       </tr>
       <tr>
       <td class="style19">
           FECHA DE NACIMIENTO:
       </td>
       <td class="style18">
           <asp:TextBox ID="txtfechanac" runat="server"></asp:TextBox>
       </td>
       </tr>
       <tr>
       <td class="style19">
           INSTRUCCION:
       </td>
       <td class="style18">
           <asp:TextBox ID="txtinstruccion" runat="server"></asp:TextBox>
       </td>
       </tr>
       <tr>
       <td class="style19">
           TELEFONO:
       </td>
       <td class="style18">
           <asp:TextBox ID="txttelefono" runat="server"></asp:TextBox>
       </td>
       </tr>
       <tr>
       <td class="style19">
           DESCRIPCION:
       </td>
       <td class="style18">
           <asp:TextBox ID="txtdescripcion" runat="server"></asp:TextBox>
       </td>
       </tr>
       <tr>
       <td class="style19">
           ESTADO:</td>
       <td class="style18">
           <asp:TextBox ID="txtestado" runat="server"></asp:TextBox>
       </td>
       </tr>
       </table>
   </td>
   </tr>
    <tr>
   <td class="style15" align="center">
       <br />
       <br />
       <br />
       <asp:Label ID="lblAdministrador" runat="server" Text="ADMINISTRADOR" align="center"></asp:Label>
       <br />
       <br />
       <br />
   </td>
   </tr>
    <tr>
   <td class="style15" align="center">
       <br />
       <br />
       <br />
       <br />
       <asp:Button ID="btningresar" runat="server" Text="INGRESAR" align="center"/>
       <br />
       <br />
       <br />
       <br />
   </td>
   </tr>
    </table>
 </td>
    
 <td  style="text-align: center; " class="style11">
   <table>
   <tr>
   <td align="right" class="style16">
       <asp:Button ID="btncargo" runat="server" Text="CARGO" />
   </td>
   </tr>
   <tr>
   <td align="right" class="style16">
       <asp:Button ID="btnempleado" runat="server" Text="EMPLEADO" />
   </td>
   </tr>
   <tr>
   <td align="right" class="style17">
       <asp:Button ID="btnsitio" runat="server" Text="SITIO" />
   </td>
   </tr>
   <tr>
   <td align="right" class="style16">
       <asp:Button ID="btnunidad" runat="server" Text="UNIDAD" />
   </td>
   </tr>
   </table>

 </td>

</tr>



</table>
</div>
</asp:Content>
