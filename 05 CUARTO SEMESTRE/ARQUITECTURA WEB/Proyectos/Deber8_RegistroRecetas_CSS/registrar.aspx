<%@ Page Language="C#" AutoEventWireup="true" CodeFile="registrar.aspx.cs" Inherits="recetas" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style2
        {
            width: 239px;
            height: 35px;
        }
        .style3
        {
            height: 35px;
        }
        .style4
        {
            width: 695px;
        }
        #TextArea1
        {
            height: 83px;
            width: 396px;
        }
        #areaing
        {
            height: 90px;
            width: 397px;
        }
        #areains
        {
            height: 84px;
            width: 392px;
        }
        #a1
        {
            height: 34px;
            width: 408px;
        }
        #a2
        {
            height: 36px;
            width: 404px;
        }
        #txta1
        {
            height: 120px;
            width: 284px;
            font-family: "Comic Sans MS";
        }
        #txta2
        {
            height: 120px;
            width: 282px;
            font-family: "Comic Sans MS";
        }
        .style16
        {
            height: 21px;
        }
        .style17
        {
            width: 150px;
            height: 30px;
        }
        .style18
        {
            height: 30px;
            font-family: "Comic Sans MS";
        }
        .style19
        {
            width: 265px;
            height: 32px;
        }
        .style20
        {
            height: 32px;
            font-family: "Comic Sans MS";
        }
        .style22
        {
            width: 163px;
        }
        .style23
        {
            width: 163px;
            height: 35px;
        }
        .style27
        {
            width: 163px;
            height: 21px;
        }
        .style28
        {
            width: 163px;
            height: 30px;
        }
        .style29
        {
            width: 163px;
            height: 33px;
        }
        .style30
        {
            width: 201px;
        }
        .style31
        {
            width: 182px;
            height: 32px;
        }
        .style32
        {
            height: 33px;
        }
    </style>
    <script language="javascript" type="text/javascript">
// <![CDATA[

function txta1_onclick() {

}

function txta2_onclick() {

}


// ]]>
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table  style="width:100%">
            <tr>
                <td style="text-align: center;" colspan="3" >
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
                </td>
            </tr>
                  
            <tr>
                <td style="text-align: center; background-image: none;" 
                    height="500px" rowspan="1" class="style30"></td>
                <td height="500px">
                         <div>
                        <table  style="width:60%" align="center">
                            <tr>
                                <td  height="150px" class="style4" 
                                    style="background-image: url('Imagenes/Wood_Background_(5).jpg')">
                                

                        <div>
                        &nbsp;<table 
                                style="width:90%; height: 221px; background-image: url('Imagenes/f5.jpg'); font-family: 'Comic Sans MS';" 
                                align="center">
                            <tr>
                                <td class="style27" align="left" 
                                    style="font-size: 20px; font-family: 'Agency FB'; color: #FFFFFF">Registro Chef.</td>
                                <td class="style16">
                                    </td>
                            </tr>
                            <tr>
                                <td class="style28" align="left" 
                                    style="font-size: 20px; font-family: 'Agency FB'; color: #FFFFFF" >&nbsp;Nombre. </td>
                                <td class="style18" height="30px">
                                    <asp:TextBox ID="txtnombre" runat="server" Width="280px" Height="25px" 
                                        ontextchanged="txtnombre_TextChanged"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style22" align="left" 
                                    style="font-size: 20px; font-family: 'Agency FB'; color: #FFFFFF" >Correo:</td>
                                <td height="30px">
                                    <asp:TextBox ID="txtcorreo" runat="server" Width="280px" Height="25px" 
                                        ontextchanged="txtcorreo_TextChanged"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style29" align="left" 
                                    style="font-size: 20px; font-family: 'Agency FB'; color: #FFFFFF" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   </td>
                                <td align="char" class="style32" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btningresarchef" runat="server" style="margin-left: 0px; font-family: 'Comic Sans MS'; margin-top: 0px;" 
                                        Text="Ingresar Chef" Width="289px" CssClass="style17" Height="35px" 
                                        onclick="btningresarchef_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center" 
                                    style="font-family: 'Berlin Sans FB'; font-size: 18px; color: #FF0000" >
                                    <asp:Label ID="lblerror" runat="server"></asp:Label>
                                </td>
                                </tr>
                            <tr>
                                <td class="style19" align="center" 
                                        
                                    style="padding: 12px; margin: 0px; font-size: 19px; font-family: 'Arial Black'; color: #FFFFFF; background-image: url('Imagenes/f6.jpg');"  
                                    colspan="2" width="30px" >&nbsp;Ingreso de Recetas.</td>
                                </tr>
                                <tr>
                                <td class="style23" align="left" 
                                        style="font-size: 20px; font-family: 'Agency FB'; color: #FFFFFF">&nbsp;Seleccione Chef.</td>
                                <td class="style3" height="30px">
                                    <asp:DropDownList ID="ddlchef" runat="server" Height="35px" Width="280px" 
                                        onselectedindexchanged="ddlchef_SelectedIndexChanged" 
                                        style="margin-bottom: 0px">
                                    </asp:DropDownList>
                                    
                                </td>
                                </tr>
                        </table>
                    </div>
                    
                    <div>
                   <table style="width:90%; height: 221px; background-image: url('Imagenes/f5.jpg');" 
                            align="center">
                            <tr >
                                <td class="style31" align="left" 
                                    
                                    
                                    
                                    style="background-image: none; font-family: 'Agency FB'; font-size: 20px; color: #FFFFFF; border-collapse: separate; border-spacing: inherit; empty-cells: show; caption-side: bottom;">Receta.</td>
                                <td class="style20" width="340px">
                                    &nbsp;
                                    <asp:TextBox ID="txtreceta" runat="server" Width="280px" 
                                        ontextchanged="txtreceta_TextChanged" Height="25px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr >
                                <td class="style31" align="left" 
                                    
                                    
                                    
                                    style="background-image: none; font-family: 'Agency FB'; font-size: 20px; color: #FFFFFF; border-collapse: separate; border-spacing: inherit; empty-cells: show; caption-side: bottom;">Url.</td>
                                <td class="style20" width="340px">
                                    &nbsp;
                                    <asp:TextBox ID="txturl" runat="server" Width="280px" Height="25px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style31" align="left" 
                                    
                                    
                                    
                                    style="background-image: none; font-family: 'Agency FB'; font-size: 20px; color: #FFFFFF; border-collapse: separate; border-spacing: inherit; empty-cells: show; caption-side: bottom;" >Datos chef.</td>
                                <td class="style20" width="340px">
                                   <div>
                                   <table style="width:94%; height: 50%; font-family: 'Agency FB'; font-size: 20px; color: #FFFFFF;" 
                                           align="left">
                                    <tr >
                                    <td class="style3" width="8px" >&nbsp;Nombre </td>
                                    <td class="style2" width="10px">
                                        <asp:Label ID="lblnombre" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr >
                                    <td class="style3" >Correo. </td>
                                    <td class="style2">
                                        <asp:Label ID="lblemail" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    </table>
                                   </div>
                                </td>
                            </tr>
                            <tr>
                                <td  align="justify" class="style31" 
                                    
                                    
                                    
                                    style="background-image: none; font-family: 'Agency FB'; font-size: 20px; color: #FFFFFF; border-collapse: separate; border-spacing: inherit; empty-cells: show; caption-side: bottom;">Ingredientes.</td>
                                    <td width="340px" class="style20">&nbsp;<textarea id="txta1" runat="server" name="S1" onclick="return txta1_onclick()"></textarea></td>
                            </tr>
                            <tr>
                                <td  align="justify" class="style31" 
                                    
                                    
                                    
                                    style="background-image: none; font-family: 'Agency FB'; font-size: 20px; color: #FFFFFF; border-collapse: separate; border-spacing: inherit; empty-cells: show; caption-side: bottom;">Instrucciones </td>
                                    <td width="340px" class="style20" >
                                        &nbsp;<textarea id="txta2" runat="server" name="S2" onclick="return txta2_onclick()" ></textarea></td>
                            </tr>
                            <td colspan="2" align="center" 
                                    style="font-family: 'Berlin Sans FB'; font-size: 18px; color: #FF0000" >
                  
                                <asp:Label ID="lblerroreceta" runat="server"></asp:Label>
                  
                                </td>
                            <tr>
                                <td class="style31" align="center" </td 
                                    
                                    
                                    
                                    style="background-image: none; font-family: 'Agency FB'; font-size: 20px; color: #FFFFFF; border-collapse: separate; border-spacing: inherit; empty-cells: show; caption-side: bottom;">
                                    &nbsp;<td class="style20" align="char" width="340px">
                                    <asp:Button ID="btnreceta" runat="server" onclick="btnreceta_Click" 
                                        Text="Guardar Receta" Width="283px" Height="30px" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
                            </tr>
                        </table>
                    </div>
                 </td>
                <td style="text-align: center; width:200px; background-image: inherit;" 
                    height="500px" rowspan="1">&nbsp;</td>
            </tr>
            <tr>
                 <td style="text-align: center; background-image: none;" height="100px"
                     colspan="3">
                    <asp:Image ID="img2" runat="server" Height="100px" 
                        ImageUrl="~/Imagenes/pie.PNG" Width="75%" />
                 </td>
            </tr>
       </table>
    </div>
    </form>
</body>
</html>
