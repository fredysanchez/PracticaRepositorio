<%@ Page Title="" Language="C#" MasterPageFile="~/Presentacion/PaginaPrincipal.Master" AutoEventWireup="true" CodeBehind="Cargo.aspx.cs" Inherits="PryDesempeñoEmpleados.Presentacion.Cargo" %>
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
                Administracion de Cargos.</td>
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
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                    DataSourceID="cargos" DataTextField="nombreC" DataValueField="id_Cargo" 
                    Height="25px" onselectedindexchanged="DropDownList1_SelectedIndexChanged" 
                    Width="81%">
                </asp:DropDownList>
                <asp:SqlDataSource ID="cargos" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:Conn %>" 
                    SelectCommand="SELECT * FROM [CARGO] WHERE (([nombreC] &lt;&gt; @nombreC) AND ([estadoC] = @estadoC))">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="Administrador" Name="nombreC" Type="String" />
                        <asp:Parameter DefaultValue="Activo" Name="estadoC" Type="String" />
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
                Fecha de creacion:
            </td>
            <td align="left" class="style6">
                <asp:TextBox ID="fecha" runat="server" Height="25px" 
                    ontextchanged="fecha_TextChanged" ReadOnly="True" Width="80%"></asp:TextBox>
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
                Descripcion:
            </td>
            <td align="left" class="style6">
                <asp:TextBox ID="descripcion" runat="server" Height="25px" 
                    ontextchanged="descripcion_TextChanged" Width="80%"></asp:TextBox>
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
                <asp:Label ID="lbestado" runat="server" Text="Estado:"></asp:Label>
            </td>
            <td align="left" class="style6">
                <asp:DropDownList ID="estadoC" runat="server" DataSourceID="estado" 
                    DataTextField="tipo" DataValueField="id_Estado" Height="25px" 
                    onselectedindexchanged="DropDownList2_SelectedIndexChanged" Width="81%">
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
                <asp:Label ID="Label1" runat="server" Text="Lista de cargos activos." 
                    Width="100%"></asp:Label>
            </td>
                <td align="center" class="style4">
                </td>
        </tr>
         <tr>
            <td>
                &nbsp;</td>
            <td class="style2" align="center" colspan="3">
                <asp:GridView ID="grvcargos" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="id_Cargo" DataSourceID="cargosgrv" 
                    onselectedindexchanged="grvcargos_SelectedIndexChanged" Width="92%">
                    <Columns>
                        <asp:BoundField DataField="id_Cargo" HeaderText="Identificador" 
                            InsertVisible="False" ReadOnly="True" SortExpression="id_Cargo" />
                        <asp:BoundField DataField="nombreC" HeaderText="Nombre" 
                            SortExpression="nombreC" />
                        <asp:BoundField DataField="fechaCreacionC" HeaderText="Fecha de Creación" 
                            SortExpression="fechaCreacionC" />
                        <asp:BoundField DataField="descripcionC" HeaderText="Descripción" 
                            SortExpression="descripcionC" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="cargosgrv" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="grvCargo" 
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
