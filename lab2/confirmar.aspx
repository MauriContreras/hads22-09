<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="confirmar.aspx.cs" Inherits="lab2.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>


    </title>
    <style type="text/css">
        #form1 {
            height: 80px;
            margin-top: 24px;
        }
    </style>
</head>
<body style="height: 326px">
   
  
    <form id="form1" runat="server">
        <asp:Label ID="labelResultadoConf" runat="server" Visible="False"></asp:Label>
        <br />
        <br />
        <asp:HyperLink ID="hiperlinkLogin" runat="server" NavigateUrl="~/inicio.aspx">Login</asp:HyperLink>
    </form>





</body>
</html>
