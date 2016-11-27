<%@ Page Language="C#" AutoEventWireup="true" CodeFile="inicion.aspx.cs" Inherits="inicion" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            height: 25px;
        }
        .style2
        {
            height: 30px;
        }
        .style3
        {
            height: 23px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>

    <table  style="width:100%">
  <tr>
    <td style="text-align: center;" colspan="4" class="style3">EPN_ESFOT<br />
        SANCHEZ FREDY</td>
  </tr>
  <tr>
    <td style="font-family: Aharoni; color: #006699;" rowspan="2">


<div>
<table  style="width:100%">
  <tr>
    <td>Seleccione</td>
    <td>
        <asp:DropDownList ID="ddl1" runat="server" 
            onselectedindexchanged="ddl1_SelectedIndexChanged">
        </asp:DropDownList>
      </td>
  </tr>
  <tr>
    <td>Nombre:</td>
    <td>
        <asp:TextBox ID="txtnombre1" runat="server"></asp:TextBox>
      </td>
  </tr>
  <tr>
    <td>Img</td>
    <td>
        <asp:Label ID="lblimg1" runat="server"></asp:Label>
      </td>
  </tr>
     <tr>
    <td>Dosis</td>
    <td>
        <asp:TextBox ID="txtdosis1" runat="server"></asp:TextBox>
         </td>
  </tr>
     <tr>
    <td>Gramos</td>
    <td>
        <asp:TextBox ID="txtgramos1" runat="server"></asp:TextBox>
         </td>
  </tr>
    <tr>
    <td>Costo</td>
    <td>
        <asp:TextBox ID="txtcosto1" runat="server"></asp:TextBox>
        </td>
  </tr>
  <tr>
    <td style="text-align: center;" colspan="4">&nbsp;</td>
  </tr>
    <asp:Label ID="lblm1" runat="server"></asp:Label>
</table>

</div>


</td>
    <td style="font-family: Aharoni; color: #006699">
      <div>
<table  style="width:100%">
  <tr>
    <td>Medicamentos</td>
    <td></td>
  </tr>
  <tr>
    <td>Nombre</td>
    <td>
        <asp:TextBox ID="txtnombre" runat="server"></asp:TextBox>
      </td>
  </tr>
    <tr>
    <td>Url</td>
    <td>
        <asp:TextBox ID="txturl" runat="server"></asp:TextBox>
        </td>
  </tr>
    <tr>
    <td>Dosis</td>
    <td>
        <asp:TextBox ID="txtdosis" runat="server"></asp:TextBox>
        </td>
  </tr>
    <tr>
    <td>Gramos</td>
    <td>
        <asp:TextBox ID="txtgramos" runat="server"></asp:TextBox>
        </td>
  </tr>
    <tr>
    <td>Costo</td>
    <td>
        <asp:TextBox ID="txtcosto" runat="server" ontextchanged="TextBox1_TextChanged"></asp:TextBox>
        </td>
  </tr>
     </tr>
    <tr>
    <td class="style2"></td>
    <td class="style2">
        <asp:Button ID="btnguardar" runat="server" onclick="btnguardar_Click" 
            Text="Guardar" Width="129px" />
        </td>
  </tr>
  <tr>
    <td style="text-align: center;" colspan="4"><div>
        <div>
<table border="1" style="width:100%">
  <tr>
    <td>
        <asp:Button ID="btncomparar" runat="server" Text="Comparar" Width="141px" 
            onclick="btncomparar_Click" />
      </td>
  </tr>
  <tr>
    <td>Cantidad Pacientes</td>
  </tr>
     <tr>
    <td>
        <asp:TextBox ID="txtcatnp" runat="server" Width="190px"></asp:TextBox>
         </td>
  </tr>
    <tr>
    <td>Pacientes nuevo medicamento</td>
  </tr>
     <tr>
    <td>
        <asp:TextBox ID="txtnuevom" runat="server" Width="173px"></asp:TextBox>
         </td>
  </tr>
    <tr>
    <td>
        <asp:Label ID="lblmsg" runat="server"></asp:Label>
        </td>
  </tr>
            </table></div></td>
  </tr>
</table>

</div>
        <td style="font-family: Aharoni; color: #006699"><div>
<table  style="width:100%">
  <tr>
    <td>Seleccione</td>
    <td>
        <asp:DropDownList ID="ddl2" runat="server" 
            onselectedindexchanged="ddl2_SelectedIndexChanged">
        </asp:DropDownList>
      </td>
  </tr>
  <tr>
    <td>Nombre:</td>
    <td>
        <asp:TextBox ID="txtnombre2" runat="server"></asp:TextBox>
      </td>
  </tr>
  <tr>
    <td class="style1">Img</td>
    <td class="style1">
        <asp:Label ID="lblimg2" runat="server"></asp:Label>
      </td>
  </tr>
     <tr>
    <td>Dosis</td>
    <td>
        <asp:TextBox ID="txtdosis2" runat="server"></asp:TextBox>
         </td>
  </tr>
     <tr>
    <td>Gramos</td>
    <td>
        <asp:TextBox ID="txtgramos2" runat="server"></asp:TextBox>
         </td>
  </tr>
    <tr>
    <td>Costo</td>
    <td>
        <asp:TextBox ID="txtcosto2" runat="server"></asp:TextBox>
        </td>
  </tr>
  <tr>
    <td style="text-align: center;" colspan="4">&nbsp;</td>
  </tr>
    <asp:Label ID="lblm2" runat="server"></asp:Label>
</table>

</div>
      </td>
</table>

    
    </div>
    </form>
</body>
</html>
