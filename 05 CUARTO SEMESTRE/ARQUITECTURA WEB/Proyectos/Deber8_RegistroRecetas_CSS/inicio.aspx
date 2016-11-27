<%@ Page Language="C#" AutoEventWireup="true" CodeFile="inicio.aspx.cs" Inherits="inicio" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title></title>
   <meta charset="UTF-8">
        <meta name ="viewport" content="widht=device-widht,user-scalable=no, initial-scale=1, maximum-scale=1">
        <link rel="stylesheet" href="estilos.css" type="text/css" />
    </head>
<body>
    <form id="form1" runat="server">
    <div>
        <table  style="width:100%">
            <tr>
                <td style="text-align: center;"colspan="3" >
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
                                    &nbsp;</td>
                                <td  style="width:35%">
                                    <asp:Image ID="Image2" runat="server" Height="33px" 
                                        ImageUrl="~/Imagenes/br.PNG" Width="452px" />
                                </td>
                            </tr>
                        </table>
                    </div>
                    <tr>
                 <td style="text-align: center; background-image: url('Imagenes/f5.jpg'); font-family: 'Agency FB'; font-size: 20px; color: #FFFFFF;" 
                            height="500px"colspan="3">
                   


                    <ul class="galeria">
                <li><a href="#1"><img src="Imagenes/p1.png" ></a></li>
                <li><a href="#2"><img src="Imagenes/p2.png" ></a></li>
                <li><a href="#3"><img src="Imagenes/p3.png" ></a></li>
                <li><a href="#4"><img src="Imagenes/p4.png" ></a></li>
                <li><a href="#5"><img src="Imagenes/p5.png" ></a></li>
                <li><a href="#6"><img src="Imagenes/p6.png" ></a></li>
                <li><a href="#7"><img src="Imagenes/p7.png" ></a></li>
                <li><a href="#8"><img src="Imagenes/p8.png" ></a></li>
                <li><a href="#9"><img src="Imagenes/p9.png" ></a></li>
            </ul>
            <div class="modal" id="1">
                <div class ="imagen">
                    <a href="#9">&#60;</a>
                    <a href="#2"><img src="Imagenes/p1.png" ></a>
                    <a href="#2">></a>
                </div>
                <a class="cerrar" href="">Cerrar</a>
            </div>
            
            <div class="modal" id="2">
                <div class ="imagen">
                    <a href="#1">&#60;</a>
                    <a href="#3"><img src="Imagenes/p2.png"></a>
                    <a href="#3">></a>
                </div>
                <a class="cerrar" href="">Cerrar</a>
            </div>
            
             <div class="modal" id="3">
                <div class ="imagen">
                    <a href="#2">&#60;</a>
                    <a href="#4"><img src="Imagenes/p3.png"></a>
                    <a href="#4">></a>
                </div>
                <a class="cerrar" href="">Cerrar</a>
            </div>
            
             <div class="modal" id="4">
                <div class ="imagen">
                    <a href="#3">&#60;</a>
                    <a href="#5"><img src="Imagenes/p4.png"></a>
                    <a href="#5">></a>
                </div>
                <a class="cerrar" href="">Cerrar</a>
            </div>
            
             <div class="modal" id="5">
                <div class ="imagen">
                    <a href="#4">&#60;</a>
                    <a href="#6"><img src="Imagenes/p5.png"></a>
                    <a href="#6">></a>
                </div>
                <a class="cerrar" href="">Cerrar</a>
            </div>
            
             <div class="modal" id="6">
                <div class ="imagen">
                    <a href="#5">&#60;</a>
                    <a href="#7"><img src="Imagenes/p6.png"></a>
                    <a href="#7">></a>
                </div>
                <a class="cerrar" href="">Cerrar</a>
            </div>
            
             <div class="modal" id="7">
                <div class ="imagen">
                    <a href="#6">&#60;</a>
                    <a href="#8"><img src="Imagenes/p7.png"></a>
                    <a href="#8">></a>
                </div>
                <a class="cerrar" href="">Cerrar</a>
            </div>
            
             <div class="modal" id="8">
                <div class ="imagen">
                    <a href="#7">&#60;</a>
                    <a href="#9"><img src="Imagenes/p8.png"></a>
                    <a href="#9">></a>
                </div>
                <a class="cerrar" href="">Cerrar</a>
            </div>
            
             <div class="modal" id="9">
                <div class ="imagen">
                    <a href="#8">&#60;</a>
                    <a href="#1"><img src="Imagenes/p9.png"></a>
                    <a href="#1">></a>
                </div>
                <a class="cerrar" href="">Cerrar</a>
            </div>


                 </td>
            </tr>
              
            <tr>
                 <td style="text-align: center;" height="100px"colspan="3">
                    <asp:Image ID="img2" runat="server" Height="100px" 
                        ImageUrl="~/Imagenes/pie.PNG" Width="75%" />
                 </td>
            </tr>
       </table>
    </div>
    </form>
</body>
</html>
