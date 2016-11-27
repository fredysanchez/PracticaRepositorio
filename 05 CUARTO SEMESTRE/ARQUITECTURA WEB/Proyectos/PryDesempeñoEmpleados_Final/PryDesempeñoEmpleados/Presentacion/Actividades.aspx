<%@ Page Title="" Language="C#" MasterPageFile="~/Presentacion/PaginaPrincipal.Master" AutoEventWireup="true" CodeBehind="Actividades.aspx.cs" Inherits="PryDesempeñoEmpleados.Presentacion.Actividades" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style4
        {
            width: 15%;
        }
        .style5
        {
            width: 26%;
        }
        .style6
        {
            width: 30%;
        }
        .style8
        {
            width: 14px;
        }
        .style9
        {
            width: 22%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style1">
        <tr>
            <td class="style4" width="200px">
                &nbsp;</td>
            <td class="style9">
                &nbsp;</td>
            <td class="style6">
                &nbsp;</td>
            <td class="style8">
                &nbsp;</td>
            <td class="style5">
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td colspan="3">
                Registro de Actividades</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style9">
                &nbsp;</td>
            <td class="style6">
                <asp:TextBox ID="txtidemp" runat="server" Visible="False"></asp:TextBox>
            </td>
            <td class="style8">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td align="right" class="style9">
                Nombre:</td>
            <td align="left" class="style6">
                <asp:TextBox ID="nombre" runat="server" Height="25px" Width="78%"></asp:TextBox>
                <asp:RequiredFieldValidator ID="r1" runat="server" ControlToValidate="nombre" 
                    Display="Dynamic" ErrorMessage="*" ForeColor="#CC0000"></asp:RequiredFieldValidator>
            </td>
            <td class="style8">
                <asp:ImageButton ID="ImageButton1" runat="server" 
                    onclick="ImageButton1_Click" 
                    ImageUrl="~/Presentacion/Images/Boton/guardar.png" />
            </td>
            <td width="200px">
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td align="right" class="style9">
                Descripcion:</td>
            <td align="left" class="style6">
                <asp:TextBox ID="descripcion" runat="server" Height="25px" Width="78%"></asp:TextBox>
                <asp:RequiredFieldValidator ID="r2" runat="server" 
                    ControlToValidate="descripcion" Display="Dynamic" ErrorMessage="*" 
                    ForeColor="#CC0000"></asp:RequiredFieldValidator>
            </td>
            <td class="style8">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td align="right" class="style9">
                Duracion:</td>
            <td align="left" class="style6">
                <asp:DropDownList ID="dhoras" runat="server" DataSourceID="SqlDataSource1" 
                    DataTextField="hora" DataValueField="hora" Height="25px" Width="33%">
                </asp:DropDownList>
                <asp:Label ID="Label1" runat="server" Text="hh."></asp:Label>
                <asp:DropDownList ID="dminutos" runat="server" DataSourceID="SqlDataSource2" 
                    DataTextField="minu" DataValueField="minu" Height="25px" Width="33%">
                </asp:DropDownList>
                <asp:Label ID="Label2" runat="server" Text="mm."></asp:Label>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:Conn %>" 
                    SelectCommand="SELECT * FROM [MINUTOS]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:Conn %>" 
                    SelectCommand="SELECT * FROM [HORAS]"></asp:SqlDataSource>
            </td>
            <td class="style8">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td align="right" class="style9">
                Fecha:<br />
            </td>
            <td align="left" class="style6">
                <asp:TextBox ID="fecha" runat="server" Height="25px" ReadOnly="True" 
                    Width="78%"></asp:TextBox>
            </td>
            <td class="style8">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td align="right" class="style9">
                Sitio:<br />
            </td>
            <td align="left" class="style6">
                <asp:DropDownList ID="dsitio" runat="server" DataSourceID="SqlDataSource3" 
                    DataTextField="nombre" DataValueField="id_Sitio" Height="25px" Width="79%">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:Conn %>" 
                    SelectCommand="SELECT * FROM [SITIO] WHERE ([estado] = @estado)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="Activo" Name="estado" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td class="style8">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td align="right" class="style9">
                Dificultad:</td>
            <td align="left" class="style6">
                <asp:DropDownList ID="ddificultad" runat="server" DataSourceID="SqlDataSource4" 
                    DataTextField="nombre" DataValueField="id_Dificultad" Height="25px" 
                    onselectedindexchanged="ddificultad_SelectedIndexChanged" Width="79%">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:Conn %>" 
                    SelectCommand="SELECT * FROM [DIFICULTAD]"></asp:SqlDataSource>
            </td>
            <td class="style8">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td align="right" class="style9">
                Estado:</td>
            <td align="left" class="style6">
                <asp:DropDownList ID="destado" runat="server" DataSourceID="SqlDataSource5" 
                    DataTextField="tipo" DataValueField="id_Estado" Width="79%">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:Conn %>" 
                    SelectCommand="SELECT * FROM [ESTADO]"></asp:SqlDataSource>
            </td>
            <td class="style8">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td align="right" class="style9">
                &nbsp;</td>
            <td class="style6">
                &nbsp;</td>
            <td class="style8">
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
            <td class="style9">
                &nbsp;</td>
            <td class="style6">
                &nbsp;</td>
            <td class="style8">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style9">
                &nbsp;</td>
            <td class="style6">
                &nbsp;</td>
            <td class="style8">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style9">
                &nbsp;</td>
            <td class="style6">
                &nbsp;</td>
            <td class="style8">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style9">
                &nbsp;</td>
            <td class="style6">
                &nbsp;</td>
            <td class="style8">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style9">
                &nbsp;</td>
            <td class="style6">
                &nbsp;</td>
            <td class="style8">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style9">
                &nbsp;</td>
            <td class="style6">
                &nbsp;</td>
            <td class="style8">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style9">
                &nbsp;</td>
            <td class="style6">
                &nbsp;</td>
            <td class="style8">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style9">
                &nbsp;</td>
            <td class="style6">
                &nbsp;</td>
            <td class="style8">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style9">
                &nbsp;</td>
            <td class="style6">
                &nbsp;</td>
            <td class="style8">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style9">
                &nbsp;</td>
            <td class="style6">
                &nbsp;</td>
            <td class="style8">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
