<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Deber7_SanchezFredy</title>
        <style type="text/css">
        .style5
        {
            width: 328px;
            color:Gray;
            font-family: "Arial Black";
            margin-left:80px;
            height: 411px;
        }
        .style6
        {
            width: 346px;
            font-family: "Arial Black";
            color:Maroon;
            margin-left:316px;
            height: 390px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" clientidmode="AutoID">
    <table border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td >
            <div class="style5">
                 &nbsp;<br />
                 Ingreso de datos:<br />
                     <br />
                     &nbsp;&nbsp; Nombre:<br />
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtNombre" runat="server" style="margin-left: 46px" 
                         Width="257px" Height="31px" ontextchanged="txtNombre_TextChanged"></asp:TextBox>
                     <br />
                     <br />
                     &nbsp;&nbsp;&nbsp;Direccion URL: <br />
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <asp:TextBox ID="txtUrl" runat="server" style="margin-left: 47px" Width="254px" 
                         Height="30px" ontextchanged="txtUrl_TextChanged"></asp:TextBox>
                     <br />
                     <br />
                     &nbsp;&nbsp; Precio:<br />
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <asp:TextBox ID="txtPrecio" runat="server" style="margin-left: 46px" 
                         Width="255px" Height="30px"></asp:TextBox>
                     <br />
                 <br />
                     &nbsp;&nbsp;<asp:Button ID="btn_IngresarPasteles" runat="server" onclick="Button1_Click" 
                         Text="INGRESAR" Height="35px" Width="298px" ForeColor="#CC3300" 
                     style="margin-left: auto; color: #808080; font-family: 'Arial Black'; font-style: normal; letter-spacing: normal; background-attachment: scroll"  />
                     <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     </div>
            </td>

             <td >
             <div class="style6">
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Los mejores pasteles dia a dia.
        
                     <asp:GridView ID="gr2" runat="server" AutoGenerateColumns="False" 
                         BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" 
                         CellPadding="4"  
                         onselectedindexchanged="gr2_SelectedIndexChanged" 
                     GridLines="Horizontal">
                         <Columns>
                             <asp:TemplateField HeaderText="Pastel" SortExpression="Pastel">
                                 <EditItemTemplate>
                                     <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Pastel") %>'></asp:TextBox>
                                 </EditItemTemplate>
                                 <ItemTemplate>
                                     <asp:Label ID="Label1" runat="server" Text='<%# Bind("Pastel") %>'></asp:Label>
                                 </ItemTemplate>
                             </asp:TemplateField>
                             <asp:TemplateField HeaderText="Nombre" SortExpression="Nombre">
                                 <EditItemTemplate>
                                     <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Nombre") %>'></asp:TextBox>
                                 </EditItemTemplate>
                                 <ItemTemplate>
                                     <asp:Label ID="Label2" runat="server" Text='<%# Bind("Nombre") %>'></asp:Label>
                                 </ItemTemplate>
                             </asp:TemplateField>
                             <asp:TemplateField HeaderText="Precio" SortExpression="Precio">
                                 <EditItemTemplate>
                                     <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Precio") %>'></asp:TextBox>
                                 </EditItemTemplate>
                                 <ItemTemplate>
                                     <asp:Label ID="Label3" runat="server" Text='<%# Bind("Precio") %>'></asp:Label>
                                 </ItemTemplate>
                             </asp:TemplateField>
                         </Columns>
                         <FooterStyle BackColor="White" ForeColor="#333333" />
                         <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                         <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                         <RowStyle BackColor="White" ForeColor="#333333" />
                         <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                         <SortedAscendingCellStyle BackColor="#F7F7F7" />
                         <SortedAscendingHeaderStyle BackColor="#487575" />
                         <SortedDescendingCellStyle BackColor="#E5E5E5" />
                         <SortedDescendingHeaderStyle BackColor="#275353" />
                     </asp:GridView>
                     </div>
            </td>
        </tr>
        </table>
    </form>
</body>
</html>
