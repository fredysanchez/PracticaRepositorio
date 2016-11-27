<%@ Page Title="" Language="C#" MasterPageFile="~/Presentacion/PaginaPrincipal.Master" AutoEventWireup="true" CodeBehind="Perfiles.aspx.cs" Inherits="PryDesempeñoEmpleados.Presentacion.Perfiles" %>
    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
          .nota
        {
             font-family: "Berlin Sans FB";
    font-size: 40px;
    color: #222156;
    text-align:center;
    
            }
         .nota1
        {
             font-family: "Berlin Sans FB";
    font-size: 40px;
    color: #D2691E;
    text-align:center;
    
            }
        .style1
        {
            width: 100%;
        }
        .style2
        {
            height: 22px;
        }
        .style3
        {
        }
        .style5
        {
            height: 22px;
            width: 221px;
        }
        .style6
        {
            width: 221px;
        }
        .style7
        {
            width: 364px;
        }
        .style8
        {
        }
        .style9
        {
        }
        .style10
        {
            width: 332px;
        }
        .style11
        {
            width: 248px;
        }
    </style>
     <script type="text/javascript">
         function OnGridFocusedRowChanged() {
             DetailNotes.SetText("Loading...");
             grid.GetRowValues(grid.GetFocusedRowIndex(), 'EmployeeID;Notes', OnGetRowValues);
         }
         function OnGetRowValues(values) {
             DetailImage.SetImageUrl("FocusedRow.aspx?Photo=" + values[0]);
             DetailImage.SetVisible(true);
             DetailNotes.SetText(values[1]);
         }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style1">
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td class="style10">
                &nbsp;</td>
            <td class="style11">
                &nbsp;</td>
            <td class="style7">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style5">
            </td>
            <td class="style2" colspan="3">
                Visualizar perfil.</td>
            <td class="style2">
            </td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td align="right" class="style10">
                Selecciona unidad.</td>
            <td colspan="2">
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                    DataSourceID="SqlDataSource2" DataTextField="nombreU" 
                    DataValueField="id_Unidad" Height="25px" Width="80%">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:Conn %>" 
                    SelectCommand="SELECT * FROM [UNIDAD] WHERE ([estadoU] = @estadoU)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="Activo" Name="estadoU" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td class="style10">
                &nbsp;</td>
            <td class="style9" align="left" colspan="2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td class="style3" colspan="3">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="id_empleado" DataSourceID="SqlDataSource1" 
                    onselectedindexchanged="GridView1_SelectedIndexChanged1" Width="100%">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="id_empleado" HeaderText="Identificador" 
                            InsertVisible="False" ReadOnly="True" SortExpression="id_empleado" />
                        <asp:BoundField DataField="nombreE" HeaderText="Nombre" 
                            SortExpression="nombreE" />
                        <asp:BoundField DataField="apellido" HeaderText="Apellido" 
                            SortExpression="apellido" />
                        <asp:BoundField DataField="fechaNacimiento" HeaderText="Fecha de Nacimiento" 
                            SortExpression="fechaNacimiento" />
                        <asp:BoundField DataField="nombreC" HeaderText="Cargo" 
                            SortExpression="nombreC" />
                        <asp:BoundField DataField="nombreU" HeaderText="Unidad" 
                            SortExpression="nombreU" />
                        <asp:BoundField DataField="nota" HeaderText="Calificacion" 
                            SortExpression="nota" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:Conn %>" 
                    SelectCommand="sp_listarEmpleadosUnidad" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="id_unidad" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td class="style8" colspan="3">
                Perfil Completo</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td class="style10" rowspan="8" align="right">
                <asp:Image ID="Image1" runat="server" Height="185px" Width="162px" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </td>
            <td class="style11" align="left">
                &nbsp;</td>
            <td rowspan="8" align="center">
                                <br />
                                <asp:Label ID="cal" runat="server" CssClass="nota" Text="Calificacion:"></asp:Label>
                                <br />
                                <asp:Label ID="lblnota" runat="server" 
                                    BorderStyle="None" Height="80%" Width="40%" 
                    CssClass="nota1"></asp:Label>
                             </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td class="style11" align="left">
                <asp:Label ID="Nombre" runat="server"></asp:Label>
                &nbsp;
                <asp:Label ID="apellido" runat="server"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td class="style11" align="left">
                <asp:Label ID="fecha" runat="server"></asp:Label>
            &nbsp;&nbsp; </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td class="style11" align="left">
                <asp:Label ID="instruccion" runat="server"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td class="style11" align="left">
                <asp:Label ID="telefono" runat="server"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td class="style11" align="left">
                <asp:Label ID="cargo" runat="server"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td class="style11" align="left">
                <asp:Label ID="unidad" runat="server"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td class="style11" align="left">
                <asp:Label ID="descripcion" runat="server"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td class="style10">
                &nbsp;</td>
            <td class="style11">
                &nbsp;</td>
            <td class="style7">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td class="style10">
                &nbsp;</td>
            <td class="style11">
                &nbsp;</td>
            <td class="style7">
                &nbsp;</td>
            <td>
                &nbsp;</td>
<tr>
            <td class="style6">
                &nbsp;</td>
            <td class="style10">
                &nbsp;</td>
            <td class="style11">
                &nbsp;</td>
            <td class="style7">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        </tr>
    </table>
</asp:Content>
