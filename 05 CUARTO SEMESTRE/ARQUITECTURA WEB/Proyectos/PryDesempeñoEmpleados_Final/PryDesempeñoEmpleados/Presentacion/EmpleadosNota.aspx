<%@ Page Title="" Language="C#" MasterPageFile="~/Presentacion/PaginaPrincipal.Master" AutoEventWireup="true" CodeBehind="EmpleadosNota.aspx.cs" Inherits="PryDesempeñoEmpleados.Presentacion.EmpleadosNota" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style6
        {
            width: 612px;
        }
        .style8
        {
        }
        .style9
        {
        }
        .style10
        {
        }
        .style11
        {
            width: 548px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style1">
        <tr>
            <td>
                &nbsp;</td>
            <td class="style9">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td class="style6">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td align="right" class="style9">
                <asp:TextBox ID="txtidJ" runat="server" Width="43px" Visible="False"></asp:TextBox>
                Seleccionar Empleado:</td>
            <td align="left" colspan="2">
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                    DataSourceID="SqlDataSource2" DataTextField="nombreE" 
                    DataValueField="id_Empleado_Empleado" Height="25px" 
                    onselectedindexchanged="DropDownList1_SelectedIndexChanged1" Width="52%">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:Conn %>" 
                    SelectCommand="sp_listarEmpleadosporJefe" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtidJ" Name="id_Empleado_Jefe" 
                            PropertyName="Text" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style9">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td class="style6">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="5">
                <asp:Panel ID="panel1" runat="server" Height="80px" Visible="False">
                    <table class="style1">
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td class="style11">
                                &nbsp;</td>
                            <td class="style10">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td align="right" class="style11">
                                <asp:TextBox ID="txtidA" runat="server" Width="43px" Visible="False"></asp:TextBox>
                                Calificacion:</td>
                            <td align="left" class="style10" colspan="2">
                                <asp:DropDownList ID="dnota" runat="server" DataSourceID="SqlDataSource4" 
                                    DataTextField="nota" DataValueField="nota" Height="25px" Width="157px">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:Conn %>" 
                                    SelectCommand="SELECT * FROM [Calificacion]"></asp:SqlDataSource>
                            </td>
                            <td width="200px">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td class="style8" colspan="2">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:ImageButton ID="ImageButton1" runat="server" 
                                    onclick="ImageButton1_Click" 
                                    ImageUrl="~/Presentacion/Images/Boton/guardar.png" />
                            </td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td class="style11">
                                &nbsp;</td>
                            <td class="style10">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style9">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td class="style6">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style9" colspan="3">
                Lista de actividades activas.des activas.</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style9" colspan="3">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="id_Actividad" DataSourceID="SqlDataSource3" 
                    onselectedindexchanged="GridView1_SelectedIndexChanged" Width="100%">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="id_Actividad" HeaderText="Identificador" 
                            InsertVisible="False" ReadOnly="True" SortExpression="id_Actividad" />
                        <asp:BoundField DataField="descripcion" HeaderText="Descripcion" 
                            SortExpression="descripcion" />
                        <asp:BoundField DataField="nombre" HeaderText="Nombre" 
                            SortExpression="nombre" />
                        <asp:BoundField DataField="fechaRealizacion" HeaderText="Fecha Realizacion" 
                            SortExpression="fechaRealizacion" />
                        <asp:BoundField DataField="duracion" HeaderText="Duracion" 
                            SortExpression="duracion" />
                        <asp:BoundField DataField="calificacion" HeaderText="Calificacion" 
                            SortExpression="calificacion" />
                        <asp:BoundField DataField="nombre1" HeaderText="Dificultad" 
                            SortExpression="nombre1" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="sp_actividad" 
                    SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="id_Empleado" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style9">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td class="style6">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
