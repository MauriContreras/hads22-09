<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cambiarpassword.aspx.cs" Inherits="lab2.cambiarpassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        #form1 {
            height: 493px;
            margin-top: 49px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label ID="labelEmail" runat="server" Text="Email:"></asp:Label>
        <asp:TextBox ID="textBoxEmail" runat="server" Width="305px" Height="27px"></asp:TextBox>
        
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="textBoxEmail" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="textBoxEmail" ErrorMessage="Formato de email incorrecto" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        <asp:Label ID="labelEmailEnviado" runat="server" ForeColor="Blue" Visible="False"></asp:Label>
        <br />
        <br />
        <div>
            <asp:Button ID="botonSolicitarContrasena" runat="server" OnClick="Button1_Click" Text="Solicitar cambiar contraseña" Font-Bold="False" Height="41px" Width="360px" />
            <br />
            <br />
        </div>
        <br />
        <br />
        <br />
        <asp:Label ID="labelCodigoRecibido" runat="server" Text="Código recibido:  " Visible="False"></asp:Label>
        <asp:TextBox ID="textBoxCodigoRecibido" runat="server" Height="25px" Width="113px" TextMode="Number" Visible="False"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="textBoxCodigoRecibido" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="textBoxCodigoRecibido" ErrorMessage="Código de 6 dígitos" ValidationExpression="^.{6,6}$"></asp:RegularExpressionValidator>
        <br />
        <br />
        <br />
        <asp:Label ID="labelNuevaContrasena" runat="server" Text="Nueva contraseña:" Visible="False"></asp:Label>
        <asp:TextBox ID="textBoxNuevaContrasena" runat="server" TextMode="Password" Visible="False"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="textBoxNuevaContrasena" ErrorMessage="*" Font-Bold="False" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="textBoxNuevaContrasena" ErrorMessage="Longitud mínima 6 caracteres" ValidationExpression="^.{6,}$"></asp:RegularExpressionValidator>
        <br />
        <br />
        <asp:Label ID="labelRepetirNuevaContrasena" runat="server" Text="Repetir nueva contraseña:" Visible="False"></asp:Label>
        <asp:TextBox ID="textBoxRepetirNuevaContrasena" runat="server" TextMode="Password" Visible="False"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="textBoxRepetirNuevaContrasena" ErrorMessage="*" Font-Bold="False" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="textBoxRepetirNuevaContrasena" ErrorMessage="Longitud mínima 6 caracteres" ValidationExpression="^.{6,}$"></asp:RegularExpressionValidator>
        <p>
            <asp:Button ID="botonModificarContrasena" runat="server" Height="36px" Text="Modificar contraseña" Width="234px" OnClick="botonModificarContrasena_Click" Visible="False" />
        </p>
        <p>
            <asp:Label ID="labelFunciona" runat="server" ForeColor="#33CC33" Visible="False"></asp:Label>
            <asp:HyperLink ID="hyperlinkLogin" runat="server" NavigateUrl="~/inicio.aspx" Visible="False">Iniciar sesión</asp:HyperLink>
        </p>
      
        <p>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="textBoxNuevaContrasena" ControlToValidate="textBoxRepetirNuevaContrasena" ErrorMessage="Las contraseñas deben coincidir"></asp:CompareValidator>
        </p>
      
    </form>
</body>
</html>
