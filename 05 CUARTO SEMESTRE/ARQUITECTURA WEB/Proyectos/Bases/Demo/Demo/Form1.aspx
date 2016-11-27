<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Form1.aspx.cs" Inherits="Demo.Form1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">   
    <title></title>
    <link href="all.css" rel="stylesheet" type="text/css" />
    <link href="demos.css" rel="stylesheet" type="text/css" />
    <script src="pikaday.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <asp:FileUpload ID="FileUpload1" runat="server" />
        <br /><br />
        <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" />
        <br /><br />
        <asp:Label ID="lblMessage" runat="server"></asp:Label>
        <br /><br />
        <asp:HyperLink ID="hyperlink" runat="server">Ver Imagen</asp:HyperLink>
        </div>
    </form>
</body>
</html>
