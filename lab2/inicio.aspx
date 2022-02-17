<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="inicio.aspx.cs" Inherits="lab2.Inicio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        #form1 {
            margin-top: 24px;
        }
    </style>
</head>
<body style="margin-top: 0px">
    <form id="form1" runat="server">
        
       
        <br />
        LOGIN<br />
        <br />
        <br />
        
       
        <asp:Label ID="labelEmail" runat="server" Text="Email:          "></asp:Label>
        <asp:TextBox ID="textBoxEmail" runat="server" Height="36px" OnTextChanged="TextBox1_TextChanged" style="margin-bottom: 0px" Width="200px">     </asp:TextBox>
        <asp:RequiredFieldValidator ID="requiredFieldValidatorEmail" runat="server" ControlToValidate="textBoxEmail" ErrorMessage="RequiredFieldValidator" ForeColor="Red">*</asp:RequiredFieldValidator>
        <br />
        &nbsp;&nbsp;
        <p>
            <asp:Label ID="labelPassword" runat="server" Text="Password:"></asp:Label>
            <asp:TextBox ID="textBoxPassword" runat="server" Height="36px" OnTextChanged="TextBox1_TextChanged" style="margin-bottom: 0px" Width="200px" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="requiredFieldValidatorPass" runat="server" ControlToValidate="textBoxPassword" ErrorMessage="RequiredFieldValidator" ForeColor="Red">*</asp:RequiredFieldValidator>
        </p>
        <p>
            &nbsp;</p>
        <p style="margin-left: 40px; width: 96px;">
            <asp:Button ID="botonLogin" runat="server" Height="49px" Text="Login" Width="89px" OnClick="botonLogin_Click" />
        &nbsp;
        </p>
        <p style="width: 137px">
          <asp:HyperLink ID="enlaceRegistro" runat="server" NavigateUrl="~/Registro.aspx">Quiero registrarme</asp:HyperLink>

        </p>

       
        <asp:HyperLink ID="enlaceModificarContrasena" runat="server" NavigateUrl="~/cambiarpassword.aspx">Modificar contraseña</asp:HyperLink>

       
        <p>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ClientIDMode="AutoID" ControlToValidate="textBoxEmail" ErrorMessage="RegularExpressionValidator" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">Dirección de correo no registrada</asp:RegularExpressionValidator>
        </p>

       
        <p>
            <asp:Label ID="ResultBD" runat="server"></asp:Label>
        &nbsp;&nbsp;&nbsp;
        </p>

       
    </form>
</body>
</html>
