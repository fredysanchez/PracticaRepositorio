<%@ Page Title="" Language="C#" MasterPageFile="~/Presentacion/PaginaPrincipal.Master" AutoEventWireup="true" CodeBehind="Unidad.aspx.cs" Inherits="PryDesempeñoEmpleados.Presentacion.Unidad" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
        }
        .style4
        {
            height: 22px;
        }
        .style5
        {
            height: 22px;
        }
        .style6
        {
            width: 317px;
        }
        .style7
        {
            width: 298px;
        }
        .titulo
        {
            font-family: "Berlin Sans FB";
    font-size: 20px;
    color: #D2691E;
    text-align:center;
            
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style1">
    <tr>
            <td colspan="5">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="5" class="titulo">
                Administracion de Unidades.</td>
        </tr>
        <tr>
            <td width="200px">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td class="style6">
                &nbsp;</td>
            <td class="style7">
                &nbsp;</td>
                <td width="200px">
                    &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style2" align="right">
                Nombre:
            </td>
            <td align="left" class="style6">
                <asp:DropDownList ID="ddlunidad" runat="server" AutoPostBack="True" 
                    DataSourceID="unidadd" DataTextField="nombreU" DataValueField="id_Unidad" 
                    Height="25px" onselectedindexchanged="DropDownList1_SelectedIndexChanged" 
                    Width="81%">
                </asp:DropDownList>
                <asp:SqlDataSource ID="unidadd" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:Conn %>" 
                    SelectCommand="SELECT * FROM [UNIDAD] WHERE ([estadoU] = @estadoU)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="Activo" Name="estadoU" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:TextBox ID="nombre" runat="server" Height="25px" Width="80%"></asp:TextBox>
            </td>
            <td align="center" class="style7">
                <asp:CheckBox ID="actualizar" runat="server" AutoPostBack="True" 
                    oncheckedchanged="actualizar_CheckedChanged" Text="Modificar información." 
                    Width="90%" />
            </td>
                <td width="200px">
                    &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td align="right" class="style2">
                Ubicacion:</td>
            <td align="left" class="style6">
                <asp:TextBox ID="ubicacion" runat="server" Height="25px" Width="80%"></asp:TextBox>
            </td>
            <td class="style7">
                <asp:ImageButton ID="modidicar" runat="server" 
                    onclick="modidicar_Click" 
                    ImageUrl="~/Presentacion/Images/Boton/actualizar.png" />
            </td>
                <td>
                    &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td align="right" class="style2">
                Telefono:</td>
            <td align="left" class="style6">
                <asp:TextBox ID="telefono" runat="server" Height="25px" Width="80%"></asp:TextBox>
            </td>
            <td class="style7">
                <asp:ImageButton ID="guardar" runat="server" 
                    onclick="ingresar_Click" 
                    ImageUrl="~/Presentacion/Images/Boton/guardar.png" />
            </td>
                <td>
                    &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td align="right" class="style2">
                Descripcion:
            </td>
            <td align="left" class="style6">
                <asp:TextBox ID="descripcion" runat="server" Height="25px" 
                    Width="80%"></asp:TextBox>
            </td>
            <td class="style7">
                &nbsp;</td>
                <td>
                    &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td align="right" class="style2">
                <asp:Label ID="lbestado" runat="server" Text="Estado:"></asp:Label>
            </td>
            <td align="left" class="style6">
                <asp:DropDownList ID="estadoC" runat="server" DataSourceID="estado" 
                    DataTextField="tipo" DataValueField="id_Estado" Height="25px" Width="81%">
                </asp:DropDownList>
                <asp:SqlDataSource ID="estado" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:Conn %>" 
                    SelectCommand="SELECT * FROM [ESTADO]"></asp:SqlDataSource>
            </td>
            <td class="style7">
                &nbsp;</td>
                <td>
                    &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td align="right" class="style2">
                &nbsp;</td>
            <td class="style6">
                &nbsp;</td>
            <td class="style7">
                &nbsp;</td>
                <td>
                    &nbsp;</td>
        </tr>
        <tr>
            <td align="center" class="style4">
                </td>
            <td class="style5" align="center" colspan="3">
                <asp:Label ID="Label1" runat="server" Text="Lista de unidades activas." 
                    Width="100%"></asp:Label>
            </td>
                <td align="center" class="style4">
                </td>
        </tr>
         <tr>
            <td>
                &nbsp;</td>
            <td class="style2" align="center" colspan="3">
               
             
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="id_Unidad" DataSourceID="grvUnidad" Width="90%">
                    <Columns>
                        <asp:BoundField DataField="id_Unidad" HeaderText="Identificador" 
                            InsertVisible="False" ReadOnly="True" SortExpression="id_Unidad" />
                        <asp:BoundField DataField="nombreU" HeaderText="Nombre" 
                            SortExpression="nombreU" />
                        <asp:BoundField DataField="descripcionU" HeaderText="Descripcion" 
                            SortExpression="descripcionU" />
                        <asp:BoundField DataField="ubicacionU" HeaderText="Ubicacion" 
                            SortExpression="ubicacionU" />
                        <asp:BoundField DataField="telefonoU" HeaderText="Telefono" 
                            SortExpression="telefonoU" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="grvUnidad" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="grvUnidad" 
                    SelectCommandType="StoredProcedure"></asp:SqlDataSource>
               
             
             </td>
                <td>
                    &nbsp;</td>
        </tr>
         <tr>
            <td>
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td class="style6">
                &nbsp;</td>
            <td class="style7">
                &nbsp;</td>
                <td>
                    &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td class="style6">
                &nbsp;</td>
            <td class="style7">
                <asp:ImageButton ID="regresar" runat="server" 
                    onclick="regresar_Click" 
                    ImageUrl="~/Presentacion/Images/Boton/regresar.png" 
                    CausesValidation="False" />
            </td>
                <td>
                    &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td class="style6">
                &nbsp;</td>
            <td class="style7">
                &nbsp;</td>
                <td>
                    &nbsp;</td>
        </tr>
    </table>
</asp:Content>
