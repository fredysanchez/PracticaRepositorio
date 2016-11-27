<%@ Page Title="" Language="C#" MasterPageFile="~/Presentacion/PaginaPrincipal.Master" AutoEventWireup="true" CodeBehind="Sesion.aspx.cs" Inherits="PryDesempeñoEmpleados.Presentacion.Sesion" %>
<%@ Register assembly="DevExpress.Web.ASPxScheduler.v16.1, Version=16.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxScheduler.Controls" tagprefix="dxwschsc" %>
<%@ Register assembly="DevExpress.Web.v16.1, Version=16.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;           
        }
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
        .frase
        {
            font-family: "Berlin Sans FB";
    font-size: 20px;
    color: #D2691E;
    text-align:center;
            
            }
             .frase
        {
            font-family: "Berlin Sans FB";
    font-size: 20px;
    color: #D2691E;
    text-align:center;
            
            }
            
        .stylefredy{ border-color:#CCCCFF;
            background-color:#CCCCFF;}
        .style29
        {
        }
        .style30
        {
            width: 332px;
        }
        .style31
        {
            width: 555px;
        }
        .style32
        {
            width: 292px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <table class="style1">
        <tr>
            <td>
                
                    <asp:Panel ID="panelsesion" runat="server" Width="100%">
                        <table width="100%">
                             <tr>
                                <td colspan="2" align="left">
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                 </td>
                            </tr>
                            <tr>
                                <td align="right" class="style31">
                                    Usuario:<br /> </td>
                                <td align="left">
                                    <asp:TextBox ID="txtusuario" runat="server" Height="25px" Width="250px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="r1" runat="server" 
                                        ControlToValidate="txtusuario" Display="Dynamic" ErrorMessage="*" 
                                        ForeColor="Red">*</asp:RequiredFieldValidator>
                                    <br />
                                    <asp:Label ID="lb1" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" class="style31">
                                    Contraseña:<br /> </td>
                                <td align="left">
                                    <asp:TextBox ID="txtpass" runat="server" Height="25px" Width="250px" 
                                        TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                        ControlToValidate="txtpass" Display="Dynamic" 
                                        ErrorMessage="RequiredFieldValidator" ForeColor="Red">*</asp:RequiredFieldValidator>
                                    <br />
                                    <asp:Label ID="lb0" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="style31">
                                    &nbsp;</td>
                                <td align="left">
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:ImageButton ID="btnentrar" runat="server" Height="26px" 
                                        onclick="btnentrar_Click" Width="163px" 
                                        ImageUrl="~/Presentacion/Images/Boton/ingresar.png" />
                                    <br />
                                </td>
                            </tr>
                            <tr>
                            <td colspan="2" class="frase">
                                <br />
                                <br />
                                El triunfo del verdadero hombre surge de las cenizas del error.<br />
                                <br />
                                <br />
                                <asp:Label ID="lb" runat="server"></asp:Label>
                                </td></tr>
                        </table>
                    </asp:Panel>
                    <asp:Panel ID="panelinfo" runat="server" Width="100%">
                    <table width="100%">
                         <tr>
                            <td width="40px">&nbsp;</td>
                            <td class="style30">&nbsp;</td>
                            <td class="frase" colspan="2">Informacion general.</td>
                            <td></td>
                            <td width="40px"></td>                            
                        </tr>
                         <tr>
                            <td width="40px"></td>
                            <td class="style30" align="right" rowspan="10">
                                <asp:Image ID="img1" runat="server" Height="260px" Width="60%" />
                             </td>
                            <td colspan="2" rowspan="5" class="nota">
                                <asp:Label ID="cal" runat="server" CssClass="nota" Text="Calificacion:"></asp:Label>
                                <br />
                                <asp:Label ID="lblnota" runat="server" BorderStyle="None" CssClass="nota1" 
                                    Height="80%" Width="40%"></asp:Label>
                             </td>
                            <td>Acciones</td>
                            <td width="40px"></td>                            
                        </tr>
                         <tr>
                            <td width="40px"></td>
                            <td>
                                <asp:ImageButton ID="Administracion" runat="server" 
                                    onclick="Administracion_Click" Visible="False" 
                                    ImageUrl="~/Presentacion/Images/Boton/admin.png" />
                             </td>
                            <td width="40px"></td>                            
                        </tr>
                         <tr>
                            <td width="40px"></td>
                            <td>&nbsp;</td>
                            <td width="40px"></td>                            
                        </tr>
                         <tr>
                            <td width="40px"></td>
                            <td>
                                <asp:CheckBox ID="chek" runat="server" AutoPostBack="True" 
                                    oncheckedchanged="chek_CheckedChanged" Text=" Modificar Informacion" 
                                    Width="80%" />
                             </td>
                            <td width="40px">&nbsp;</td>                            
                        </tr>
                         <tr>
                            <td width="40px"></td>
                            <td>
                                <asp:ImageButton ID="actualizar" runat="server" 
                                    onclick="actualizar_Click" 
                                    ImageUrl="~/Presentacion/Images/Boton/actualizar.png" />
                             </td>
                            <td width="40px">&nbsp;</td>                            
                        </tr>
                        <tr>
                            <td width="70px"></td>
                            <td align="right" width="170px">Nombre:</td>
                            <td align="left" class="style32">
                                <asp:TextBox ID="txtNombre" runat="server" Width="90%"></asp:TextBox>
                            </td>
                            <td>
                                <asp:ImageButton ID="baja" runat="server" 
                                    onclick="baja_Click" ImageUrl="~/Presentacion/Images/Boton/baja.png" />
                            </td>
                            <td width="40px">&nbsp;</td>                            
                        </tr>
                        <tr>
                            <td width="70px"></td>
                            <td align="right">Apellido:</td>
                            <td align="left" class="style32">
                                <asp:TextBox ID="txtApellido" runat="server" Width="90%"></asp:TextBox>
                            </td>
                            <td>
                                <asp:ImageButton ID="registraractividad" runat="server" 
                                    onclick="registraractividad_Click" 
                                    ImageUrl="~/Presentacion/Images/Boton/regactividad.png" />
                            </td>
                            <td width="40px">&nbsp;</td>                            
                        </tr>
                        <tr>
                            <td width="70px"></td>
                            <td align="right">Fecha de Nacimiento:</td>
                            <td align="left" class="style32">
                                <asp:TextBox ID="txtFechaNaci" runat="server" Width="90%"></asp:TextBox>
                            </td>
                            <td>
                                <asp:ImageButton ID="empleados" runat="server" 
                                    style="margin-bottom: 0px" onclick="empleados_Click" 
                                    ImageUrl="~/Presentacion/Images/Boton/emp-jefe.png" />
                            </td>
                            <td width="40px">&nbsp;</td>                            
                        </tr>
                        <tr>
                            <td width="70px"></td>
                            <td align="right">
                                Instruccion:</td>
                            <td align="left" class="style32">
                                <asp:DropDownList ID="ddlInstruccion" runat="server" 
                                    DataSourceID="Instruccion" DataTextField="nombre" 
                                    DataValueField="id_Instruccion" Height="20px" Width="91%">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="Instruccion" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:Conn %>" 
                                    SelectCommand="SELECT * FROM [INSTRUCCION]"></asp:SqlDataSource>
                                <asp:TextBox ID="txtInstruccion" runat="server" Width="90%"></asp:TextBox>
                            </td>
                            <td>
                                <asp:ImageButton ID="cerrarSesion" runat="server" 
                                    onclick="cerrarSesion_Click" 
                                    ImageUrl="~/Presentacion/Images/Boton/salir.png" />
                            </td>
                            <td width="40px">&nbsp;</td>                            
                        </tr>
                        <tr>
                            <td width="70px"></td>
                            <td align="right">Teléfono:</td>
                            <td align="left" class="style32">
                                <asp:TextBox ID="txtTelefono" runat="server" Width="90%"></asp:TextBox>
                            </td>
                            <td>
                                &nbsp;</td>
                            <td width="40px"></td>                            
                        </tr>
                        <tr>
                            <td width="70px"></td>
                            <td align="right" class="style30">
                                <asp:FileUpload ID="FileUpload1" runat="server" Width="200px" />
                            </td>
                            <td align="right">Descripción:</td>
                            <td align="left" class="style32">
                                <asp:TextBox ID="txtDescripcion" runat="server" Width="90%"></asp:TextBox>
                            </td>
                            <td></td>
                            <td width="40px"></td>                            
                        </tr>
                        <tr>
                            <td width="70px"></td>
                            <td align="right" class="style30">
                                &nbsp;</td>
                            <td align="right">
                                Cargo:</td>
                            <td align="left" class="style32">
                                <asp:DropDownList ID="ddlCargo" runat="server" 
                                    DataSourceID="Cargo" DataTextField="nombreC" DataValueField="id_Cargo" 
                                    Height="20px" Width="91%">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="Cargo" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:Conn %>" 
                                    SelectCommand="SELECT * FROM [CARGO] WHERE (([estadoC] = @estadoC) AND ([nombreC] &lt;&gt; @nombreC))">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="Activo" Name="estadoC" Type="String" />
                                        <asp:Parameter DefaultValue="Administrador" Name="nombreC" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:TextBox ID="txtCargo" runat="server" Width="90%"></asp:TextBox>
                            </td>
                            <td></td>
                            <td width="40px"></td>                            
                        </tr>
                        <tr>
                            <td width="40px"></td>
                            <td align="right" class="style30">
                                &nbsp;</td>
                            <td align="right">
                                Unidad:</td>
                            <td align="left" class="style32">
                                <asp:DropDownList ID="ddlUnidad" runat="server" 
                                    DataSourceID="Unidad" DataTextField="nombreU" DataValueField="id_Unidad" 
                                    Height="20px" onselectedindexchanged="ddlUnidad0_SelectedIndexChanged" 
                                    Width="91%">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="Unidad" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:Conn %>" 
                                    SelectCommand="SELECT * FROM [UNIDAD] WHERE ([estadoU] = @estadoU)">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="Activo" Name="estadoU" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:TextBox ID="txtUnidad" runat="server" Width="90%"></asp:TextBox>
                            </td>
                            <td></td>
                            <td width="40px"></td>                            
                        </tr>
                        <tr>
                            <td width="40px"></td>
                            <td class="style30"></td>
                            <td></td>
                            <td class="style32">&nbsp;</td>
                            <td>
                                <asp:TextBox ID="txtidEmpleado" runat="server" Width="35px" Visible="False"></asp:TextBox>
                                <asp:TextBox ID="txtuser" runat="server" Width="44px" Visible="False"></asp:TextBox>
                                <asp:TextBox ID="txtpas" runat="server" Width="42px" Visible="False"></asp:TextBox>
                            </td>
                            <td width="40px"></td>                            
                        </tr>
                         <tr>
                            <td width="40px"></td>
                            <td class="style30"></td>
                            <td>&nbsp;</td>
                             <td class="style32">
                                 Actividades Realizadas.</td>
                            <td></td>
                            <td width="40px"></td>                            
                        </tr>
                         <tr>
                            <td width="40px"></td>
                            <td class="style30"></td>
                            <td></td>
                            <td class="style32"></td>
                            <td></td>
                            <td width="40px"></td>                            
                        </tr>
                        <tr>
                            <td width="40px"></td>
                            <td class="style29" colspan="4">
                                <asp:GridView ID="GridView1" runat="server" Height="90px" Width="100%" 
                                    AutoGenerateColumns="False" DataKeyNames="id_Actividad" 
                                    DataSourceID="SqlDataSource3">
                                    <Columns>
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
                                        <asp:ControlParameter ControlID="txtidEmpleado" Name="id_Empleado" 
                                            PropertyName="Text" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="sp_actividad" 
                                    SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="txtidEmpleado" Name="id_Empleado" 
                                            PropertyName="Text" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
                            </td>
                            <td width="40px"></td>                            
                        </tr>
                         <tr>
                            <td width="40px"></td>
                            <td class="style30"></td>
                            <td></td>
                            <td class="style32"></td>
                            <td></td>
                            <td width="40px"></td>                            
                        </tr>
                         <tr>
                            <td width="40px"></td>
                            <td class="style30"></td>
                            <td></td>
                            <td class="style32"></td>
                            <td></td>
                            <td width="40px"></td>                            
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
    </table>
    
</asp:Content>
