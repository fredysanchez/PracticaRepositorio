<%@ Page Title="" Language="C#" MasterPageFile="~/Presentacion/PaginaPrincipal.Master" 
AutoEventWireup="true" 
CodeBehind="RegistroEmpleados.aspx.cs" Inherits="PryDesempeñoEmpleados.Presentacion.RegistroEmpleados" %>

<%@ Register Assembly="DevExpress.Web.v16.1, Version=16.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        
        .style24
        {
            
            font-family: Berlin Sans FB;
            font-size: 16px;
            border-color :#B0C4DE;
            background-color:  #F5F5F5;
            text-align: right;
            height:20px;
        }
         .style25
        {
            width: 78%;
            font-family: Berlin Sans FB;
            font-size: 16px;
            border-color:  #B0C4DE;
             background-color:  #F5F5F5;
            text-align: left;
            height: 20px;
        }
        .titulo
        {
        background-color:#F5F5F5 ;
            font-family: Berlin Sans FB;
            font-size: 20px;
            color: #2F4F4F;
            text-align: center;
        }
        </style>
     <link type="text/css" rel="stylesheet"
    href="http://jquery-ui.googlecode.com/svn/tags/1.7/themes/redmond/jquery-ui.css" />   
  <script type="text/javascript"   
    src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
  <script type="text/javascript"
    src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.2/jquery-ui.min.js"></script>

  <script type="text/javascript">
      $(document).ready(function () {
          $('[id$=txtfc]').datepicker(
            {
                dateFormat: 'dd/mm/yy',
                minDate: new Date('1950-01-01'),
                maxDate: new Date(this),
                changeMonth: true,
                changeYear: true,
                yearRange: '-90:0',
                numberOfMonths: 1,
                dayNamesMin: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sa'],
                monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo',
                    'Junio', 'Julio', 'Agosto', 'Septiembre',
                    'Octubre', 'Noviembre', 'Diciembre'],
                monthNamesShort: ['Ene', 'Feb', 'Mar', 'Abr',
                    'May', 'Jun', 'Jul', 'Ago',
                    'Sep', 'Oct', 'Nov', 'Dic'],
                theme: 'dark-theme'

            });
          $(".ui-datepicker").css('font-size', 12);
          $(".ui-datepicker").css('background-color:', 'red');
      });

  </script> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table width="60%" border-color="#CCCCCC" align="center">
        <tr>
        <td colspan="2" class="titulo">Informacion Personal</td>
        </tr>
        <tr>
                                                            <td align="right" 
                class="style24" __designer:mapid="9be">
                                                                Foto de Perfil:<br />
                                                                <br />
                                                            </td>
        <td align="left" bgcolor="#CCCCCC" class="style25">
                                                                <asp:FileUpload ID="fluFotoEmpleado" runat="server" Width="82%" />
                                                                <asp:RequiredFieldValidator ID="v1" runat="server" 
                                                                    ControlToValidate="fluFotoEmpleado" Display="Dynamic" ErrorMessage="*" 
                                                                    ForeColor="Red"></asp:RequiredFieldValidator>
                                                                <br />
                                                                <br />
                                                            </td>
        </tr>
        <tr>
                                                            <td align="right" 
                class="style24" __designer:mapid="9c2" bgcolor="#CCCCCC">
                                                                Nombre:<br />
                                                            </td>
        <td align="left" bgcolor="#CCCCCC" class="style25">
                                                                <asp:TextBox ID="txtnombre" 
                runat="server" Width="65%" Height="25px"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="v2" runat="server" 
                                                                    ControlToValidate="txtnombre" Display="Dynamic" ErrorMessage="*" 
                                                                    ForeColor="Red"></asp:RequiredFieldValidator>
                                                                <br />
                                                                <br />
                                                            </td>
        </tr>
        <tr>
                                                            <td align="right" 
                class="style24" __designer:mapid="9c6" bgcolor="#CCCCCC">
                                                                Apellido:<br />
                                                            </td>
        <td align="left" bgcolor="#CCCCCC" class="style25">
                                                                <asp:TextBox ID="txtapellido" runat="server" Width="65%" Height="25px" 
                                                                    ontextchanged="txtapellido_TextChanged"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="v3" runat="server" 
                                                                    ControlToValidate="txtapellido" Display="Dynamic" ErrorMessage="*" 
                                                                    ForeColor="Red"></asp:RequiredFieldValidator>
                                                                <br />
                                                                <br />
                                                            </td>
        </tr>
        <tr>
                                                            <td align="right" 
                class="style24" __designer:mapid="9ca" bgcolor="#CCCCCC">
                                                                Fecha de Nacimiento:<br />
                                                            </td>
        <td align="left" bgcolor="#CCCCCC" class="style25">
                                                                <asp:TextBox ID="txtfc" 
                runat="server" Width="65%" Height="25px"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="v4" runat="server" ControlToValidate="txtfc" 
                                                                    Display="Dynamic" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                                <asp:RegularExpressionValidator ID="rf" runat="server" 
                                                                    ControlToValidate="txtfc" ErrorMessage="dd/MM/yyyy" ForeColor="Maroon" 
                                                                    ValidationExpression="(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\d\d"></asp:RegularExpressionValidator>
                                                                <br />
                                                                <br />
                                                            </td>
        </tr>
        <tr>
                                                            <td align="right" 
                class="style24" __designer:mapid="9ce" bgcolor="#CCCCCC">
                                                                Telefono:<br />
                                                            </td>
        <td align="left" bgcolor="#CCCCCC" class="style25">
                                                                <asp:TextBox ID="txttelefono" runat="server" Width="65%" 
                                                                    ontextchanged="txttelefono_TextChanged" Height="25px"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="v5" runat="server" 
                                                                    ControlToValidate="txttelefono" Display="Dynamic" ErrorMessage="*" 
                                                                    ForeColor="Red"></asp:RequiredFieldValidator>
                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                                                    ControlToValidate="txttelefono" Display="Dynamic" ErrorMessage="Ej. 0987654321" 
                                                                    ForeColor="Maroon" ValidationExpression="([0-9]{10})"></asp:RegularExpressionValidator>
                                                                <br />
                                                                <br />
                                                            </td>
        </tr>
        <tr>
                                                            <td align="right" 
                class="style24" __designer:mapid="9d2" bgcolor="#CCCCCC">
                                                                Instruccion:<br />
                                                                <br />
                                                            </td>
        <td align="left" bgcolor="#CCCCCC" class="style25">
                                                                <asp:DropDownList ID="dlinstruccion" runat="server" Width="66%" 
                DataSourceID="ddlInstruccion" DataTextField="nombre" 
                                                                    
                DataValueField="id_Instruccion" 
                onselectedindexchanged="dlinstruccion_SelectedIndexChanged" Height="30px">
                                                                </asp:DropDownList>
                                                                <br />
                                                                <br />
                                                                <asp:SqlDataSource ID="ddlInstruccion" runat="server" 
                                                                    ConnectionString="<%$ ConnectionStrings:Conn %>" 
                                                                    
                SelectCommand="SELECT * FROM [INSTRUCCION]"></asp:SqlDataSource>
                                                            </td>
        </tr>
        <tr>
                                                <td align="right" class="style24" 
                __designer:mapid="9db" bgcolor="#CCCCCC">
                                                    Cargo:<br />
                                                    <br />
                                                </td>
        <td align="left" bgcolor="#CCCCCC" class="style25">
                                                    <asp:DropDownList ID="dlcargo" 
                runat="server" Width="66%" 
                                                        DataSourceID="ddlCargo" 
                DataTextField="nombreC" DataValueField="id_Cargo" Height="30px">
                                                    </asp:DropDownList>
                                                    <br />
                                                    <br />
                                                    <asp:SqlDataSource ID="ddlCargo" runat="server" 
                                                        ConnectionString="<%$ ConnectionStrings:Conn %>" 
                                                        
                                                        
                SelectCommand="SELECT * FROM [CARGO] WHERE (([estadoC] = @estadoC) AND ([nombreC] &lt;&gt; @nombreC))">
                                                        <SelectParameters>
                                                            <asp:Parameter DefaultValue="Activo" Name="estadoC" Type="String" />
                                                            <asp:Parameter DefaultValue="Administrador" Name="nombreC" Type="String" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </td>
        </tr>
        <tr>
                                                <td align="right" class="style24" 
                __designer:mapid="9e3" bgcolor="#CCCCCC">
                                                    Unidad:<br />
                                                    <br />
                                                </td>
        <td align="left" bgcolor="#CCCCCC" class="style25">
                                                    <asp:DropDownList ID="dlunidad" 
                runat="server" Width="66%" 
                                                        DataSourceID="ddlUnidad" DataTextField="nombreU" 
                                                        DataValueField="id_Unidad" Height="30px">
                                                    </asp:DropDownList>
                                                    <br />
                                                    <br />
                                                    <asp:SqlDataSource ID="ddlUnidad" runat="server" 
                                                        ConnectionString="<%$ ConnectionStrings:Conn %>" 
                                                        
                SelectCommand="SELECT * FROM [UNIDAD] WHERE ([estadoU] = @estadoU)">
                                                        <SelectParameters>
                                                            <asp:Parameter DefaultValue="Activo" Name="estadoU" Type="String" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </td>
        </tr>
        <tr>
                                                <td align="right" class="style24" 
                __designer:mapid="9ea" bgcolor="#CCCCCC">
                                                    Descripcion:<br />
                                                </td>
        <td align="left" bgcolor="#CCCCCC" class="style25">
                                                    <asp:TextBox ID="txtdes" runat="server" Width="65%" Height="25px"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="v6" runat="server" ControlToValidate="txtdes" 
                                                        Display="Dynamic" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                    <br />
                                                    <br />
                                                </td>
        </tr><tr>
        <td colspan="2" class="titulo">Acceso al sistema.</td>
        </tr><tr>
                                                <td align="right" class="style24" 
                __designer:mapid="9f0" bgcolor="#CCCCCC" width="45%">
                                                    Usuario:<br />
                                                </td>
        <td align="left" bgcolor="#CCCCCC" class="style25">
                                                    <asp:TextBox ID="txtuser" 
                runat="server" Width="65%" Height="25px"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="v7" runat="server" ControlToValidate="txtuser" 
                                                        Display="Dynamic" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                    <br />
                                                    <br />
                                                </td>
        </tr><tr>
                                                <td align="right" class="style24" 
                __designer:mapid="9f4" bgcolor="#CCCCCC" width="45%">
                                                    Contraseña:<br />
                                                </td>
        <td align="left" bgcolor="#CCCCCC" class="style25">
                                                    <asp:TextBox ID="txtpass" 
                runat="server" Width="65%" Height="25px" TextMode="Password"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="v8" runat="server" ControlToValidate="txtpass" 
                                                        Display="Dynamic" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                    <br />
                                                </td>
        </tr><tr>
        <td bgcolor="#CCCCCC" class="style24" width="45%">&nbsp;</td>
        <td align="right" bgcolor="#CCCCCC" class="style25">
                                                <asp:ImageButton ID="Registrar" 
                runat="server" 
                                                    onclick="Registrar_Click" 
                                                    ImageUrl="~/Presentacion/Images/Boton/guardar.png" />
                                                <br />
                                                <asp:Label ID="Label" runat="server"></asp:Label>
                                                </td>
        </tr>
    </table>
            
</asp:Content>
