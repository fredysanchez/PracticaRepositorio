<%@ Page Language="C#" AutoEventWireup="true" CodeFile="listar.aspx.cs" Inherits="listar" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 20px;
            height: 50px;
        }
    </style>
    </head>
<body>
    <form id="form1" runat="server">
    <div>
        <table  style="width:100%">
            <tr>
                <td style="text-align: center;"colspan="3" >
                    <asp:Image ID="img1" runat="server" Height="150px" 
                        ImageUrl="~/Imagenes/Inicio.PNG" Width="30%" />
                </td>
            </tr>
            <tr>
                <td style="text-align: center" colspan="3">
                    <div>
                        <table style="width:100%">
                            <tr>
                                <td  style="width:35%">
                                    <asp:Image ID="Image1" runat="server" Height="33px" 
                                        ImageUrl="~/Imagenes/br.PNG" Width="452px" />
                                </td>
                                <td  style="text-align: center">
                                    <asp:ImageButton ID="btninicio" runat="server" ImageUrl="~/Imagenes/in.PNG" 
                                        onclick="ImageButton1_Click" />
                                </td>
                                <td  style="text-align: center">
<asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/Imagenes/rg.PNG" 
                                        onclick="ImageButton2_Click" />                                    
                                </td>
                                <td  style="text-align: center">
                                    <asp:ImageButton ID="ImageButton3" runat="server" 
                                        ImageUrl="~/Imagenes/lt.PNG" onclick="ImageButton3_Click" />
                                </td>
                                <td  style="width:35%">
                                    <asp:Image ID="Image2" runat="server" Height="33px" 
                                        ImageUrl="~/Imagenes/br.PNG" Width="452px" />
                                </td>
                            </tr>
                        </table>
                    </div>
                    <tr>
                 <td style="text-align: center;" height="500px"colspan="3">
                 <div>
                    
      <table  style="width:100%">
          <tr>
          <div>
            <td style="text-align: center; font-family: 'Comic Sans MS'; background-image: url('Imagenes/f7.jpg'); font-size: 15px; font-weight: bold; color: #FFFFFF; text-decoration: underline overline;"  
                  rowspan="1" class="style1">
                <asp:DropDownList ID="ddlchef" runat="server" Height="30px" Width="182px" 
                    onselectedindexchanged="btmProd_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
          
          </tr>
          <tr>
            <td style="height:500px; background-image: url('Imagenes/f2.jpg'); font-family: 'Arial Black'; color: #336699; font-size: 20px;" 
                  align="left"><span id="mostrarreceta" runat="server" 
                    style="font-family: 'Eras Light ITC'; font-size: 15px">&nbsp</span></td>
          </tr>

          </table>
                 </div>
                   
                 </td>
            </tr>
              
            <tr>
                 <td style="text-align: center;" height="100px"colspan="3">
                    <asp:Image ID="img2" runat="server" Height="100px" 
                        ImageUrl="~/Imagenes/pie.PNG" Width="75%" />
                 </td>
            </tr>
       </table>
    </div>
    </form>
</body>
</html>
