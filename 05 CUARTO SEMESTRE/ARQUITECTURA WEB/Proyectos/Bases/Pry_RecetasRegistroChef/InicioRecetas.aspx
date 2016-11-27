<%@ Page Language="C#" AutoEventWireup="true" CodeFile="InicioRecetas.aspx.cs" Inherits="InicioRecetas" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style3
        {
            height: 156px;
        }
        #TextArea1
        {
            height: 91px;
            width: 317px;
            margin-right: 13px;
        }
        #TextArea2
        {
            height: 101px;
            width: 300px;
        }
        .style4
        {
            height: 50px;
        }
        .style5
        {
            height: 52px;
        }
        .style6
        {
            height: 51px;
        }
        .style7
        {
            height: 46px;
        }
        .style8
        {
            height: 45px;
        }
        .style9
        {
            height: 38px;
        }
        .style10
        {
            height: 51px;
            width: 517px;
        }
        .style11
        {
            height: 46px;
            width: 517px;
        }
        .style12
        {
            height: 45px;
            width: 517px;
        }
        .style13
        {
            height: 38px;
            width: 517px;
        }
        .style14
        {
            height: 156px;
            width: 517px;
        }
        .style15
        {
            height: 53px;
        }
        .style16
        {
            width: 516px;
        }
        .style17
        {
            height: 50px;
            width: 516px;
        }
        .style18
        {
            height: 52px;
            width: 516px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
<table border="1px" style = "width:100%; text-align: center;">


 <tr>
  <td colspan = "2"> chef 
    <table style = "width:100%" >

           <tr> 
            <td class="style16"> 
                <asp:Button ID="BtnListar" runat="server" onclick="BtnListar_Click" 
                    Text="LISTAR" />
               </td>
            <td> </td>
            </tr>
       <tr>
         <td colspan = "2" class="style6"> 
             <asp:DropDownList ID="drlChef" runat="server" Height="25px" Width="131px">
             </asp:DropDownList>
           </td>
       </tr>

       <tr>
         <td class="style17"> 
             <asp:Label runat="server" Text="ID:"></asp:Label>
           </td>
         <td class="style4"> 
             <asp:TextBox ID="txtIdC" runat="server"></asp:TextBox>
           </td>
       </tr>

       <tr>
         <td class="style17"> 
             <asp:Label ID="Label2" runat="server" Text="Nombre:"></asp:Label>
           </td>
         <td class="style4"> 
             <asp:TextBox ID="txtNombreC" runat="server"></asp:TextBox>
           </td>
       </tr>

       <tr>
         <td class="style18"> 
             <asp:Label ID="Label3" runat="server" Text="Correo"></asp:Label>
           </td>
         <td class="style5"> 
             <asp:TextBox ID="txtCorreoC" runat="server"></asp:TextBox>
           </td>
       </tr>

    </table>
  </td>

 </tr>

 <tr> 
     <td class="style10" > 
         <asp:Label ID="Id" runat="server" Text="Id"></asp:Label>
          </td>
     <td class="style6" > 
         <asp:TextBox ID="txtIdR" runat="server"></asp:TextBox>
          </td>
 </tr>

 <tr> 
    <td class="style11"> 
        <asp:Label ID="Url" runat="server" Text="Nombre"></asp:Label>
         </td>
    <td class="style7" > 
        <asp:TextBox ID="txtNombreR" runat="server"></asp:TextBox>
         </td>
 </tr>

  <tr> 
 <td class="style12"> 
     <asp:Label ID="Label6" runat="server" Text="URL"></asp:Label>
      </td>
  <td class="style8" > 
      <asp:TextBox ID="txtUrl" runat="server"></asp:TextBox>
      </td>
 </tr>

 <tr>
  <td class="style13"> Ingredientes </td>
   <td class="style9"> Instrucciones </td>
 </tr>

  <tr>
  <td class="style14"> &nbsp;<textarea id="TextArea1" name="S2" runat = "server"></textarea></td>
  <td class="style3"> <textarea id="TextArea2" name="S1"  runat = "server" ></textarea> </td>
 </tr>

 <tr>
  <td colspan="2" class="style5" >
      <asp:Button ID="BtnNuevo" runat="server" Text="NUEVA RECETA" 
          onclick="BtnRegistrar_Click" />
     </td>

    

 </tr>

 <tr>
  <td colspan="2" class="style15" >
     
         <asp:Button ID="BtnGuardarReceta" runat="server" 
             onclick="BtnGuardarReceta_Click" Text="GUARDAR" />
     
     </td>
 
 </tr>

</table>

    </form>

    </body>
</html>
