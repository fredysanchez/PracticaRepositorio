<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Productos</title>
    <script runat="server">
        /*
        protected void Page_Load(object sender, EventArgs e)
        {
            ClsProducto objproducto = new ClsProducto("Torta", "http://img.fiesta101.com.s3.amazonaws.com/wp-content/uploads/2011/08/torta1.jpg", 20.00);
            Response.Write(objproducto.escribirHTML());

            objproducto.PrecioCambio += objproducto.changeDetected; //liga el evento al delegate
            objproducto.Precio = objproducto.Precio * 2;
            Response.Write(objproducto.escribirHTML());

        }
         */
    </script>

    <style type="text/css">
        .style2
        {

        }
        .style3
        {
        }
    </style>

</head>
<body>
    <form id="form1" runat="server" clientidmode="AutoID">
    <table>
        <tr>
            <td class="style2">
                 <div style="width: 265px; height: 320px; margin-top: 0px; margin-right: 0px;">
        
                     <br />
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                     PRODUCTO<br />
                     <br />
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     Nombre<br />
                     <asp:TextBox ID="txtNombre" runat="server" style="margin-left: 46px" 
                         Width="141px"></asp:TextBox>
                     <br />
                     <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     url<br />
                     <asp:TextBox ID="txtUrl" runat="server" style="margin-left: 41px" Width="151px"></asp:TextBox>
                     <br />
                     <br />
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     Precio<br />
                     <asp:TextBox ID="txtPrecio" runat="server" style="margin-left: 39px" 
                         Width="157px"></asp:TextBox>
                     <br />
                     <br />
        
                     <asp:Button ID="btnIngresar" runat="server" onclick="btnIngresar_Click" 
                         Text="Ingresar" Width="249px" />
        
                     <br />
                     <br />
                     <br />
                     <br />
        
                     <asp:GridView ID="gr2" runat="server" AutoGenerateColumns="False" 
                         BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" 
                         CellPadding="4" GridLines="Horizontal" 
                         onselectedindexchanged="gr2_SelectedIndexChanged">
                         <Columns>
                             <asp:TemplateField HeaderText="Nombre" SortExpression="Nombre">
                                 <EditItemTemplate>
                                     <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Nombre") %>'></asp:TextBox>
                                 </EditItemTemplate>
                                 <ItemTemplate>
                                     <asp:Label ID="Label2" runat="server" Text='<%# Bind("Nombre") %>'></asp:Label>
                                 </ItemTemplate>
                             </asp:TemplateField>
                             <asp:TemplateField HeaderText="Pastel" SortExpression="Pastel">
                                 <EditItemTemplate>
                                     <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Pastel") %>'></asp:TextBox>
                                 </EditItemTemplate>
                                 <ItemTemplate>
                                     <asp:Label ID="Label1" runat="server" Text='<%# Bind("Pastel") %>'></asp:Label>
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
                     <br />
                     <br />
                     <asp:Button ID="btn_IngresarPasteles" runat="server" onclick="Button1_Click" 
                         style="height: 26px" Text="Button" />
        
                </div>
            </td>

             <td class="style3">
                 <div style="width: 532px; height: 778px">
        
                     <br />
                     <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                         AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" 
                         DataSourceID="SqlDataSource1" 
                         onselectedindexchanged="GridView1_SelectedIndexChanged" 
                         style="margin-top: 5px">
                         <Columns>
                             <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                                 ReadOnly="True" SortExpression="id" />
                             <asp:BoundField DataField="nombre" HeaderText="nombre" 
                                 SortExpression="nombre" />
                             <asp:BoundField DataField="apellido" HeaderText="apellido" 
                                 SortExpression="apellido" />
                         </Columns>
                     </asp:GridView>
                     <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                         ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                         SelectCommand="SELECT * FROM [Table5]" 
                         UpdateCommand="UPDATE [TABLE5] Set [nombre]=@nombre, [apellido]=@apellido where [id]=@id" 
                         DeleteCommand="DELETE from [TABLE5] where [id]=@id " 
                         onselecting="SqlDataSource1_Selecting"></asp:SqlDataSource>
                     <br />
                     <asp:TextBox ID="T1" runat="server"></asp:TextBox>
                     <asp:TextBox ID="T2" runat="server"></asp:TextBox>
                     <asp:Button ID="B1"
                         runat="server" Text="Button" onclick="B1_Click" />
                     <br />
                     <br />
                     <asp:Label ID="lblnombre" runat="server"></asp:Label>
                     <br />
                     <asp:Image ID="imgpastel" runat="server" Height="100px" ImageAlign="Middle" 
                         Width="100px" />
                     <br />
                     <br />
                     <br />
                     <asp:Label ID="lblprecio" runat="server" Font-Size="XX-Large" 
                         Text="Precion: $ 0.00"></asp:Label>
                     <br />
                     <br />
                     <br />
                     <br />
        
                </div>
            </td>
        </tr>
    </table>
   
   
    </form>
</body>
</html>
