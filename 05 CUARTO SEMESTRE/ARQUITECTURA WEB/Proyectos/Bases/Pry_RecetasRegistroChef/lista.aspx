<%@ Page Language="C#" AutoEventWireup="true" CodeFile="lista.aspx.cs" Inherits="lista" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table border="1" style="width:100%">
  <tr>
    <td style="text-align: center;" colspan="2">Header</td>
    
  </tr>
  <tr>
    <td style="width: 100px">
        <asp:DropDownList ID="drlChefD" runat="server" 
            ontextchanged="drlChefD_TextChanged">
        </asp:DropDownList>
      </td>
    <td style="height: 500px"><span id="mostrarChef" runat="server"></span></td>
  </tr>
  <tr>
    <td style="text-align: center;" colspan="2">Footer</td>
  </tr>
</table>
    </div>
    </form>
</body>
</html>
