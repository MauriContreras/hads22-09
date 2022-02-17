<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registro.aspx.cs" Inherits="lab2.Registro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             REGISTRO DE USUARIOS</p>
            &nbsp; Email<asp:TextBox ID="textBoxEmail" runat="server" Height="42px" style="margin-left: 124px" Width="275px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="requiredFieldValidatorEmail" runat="server" ControlToValidate="textBoxEmail" ErrorMessage="RequiredFieldValidator" ForeColor="Red">*</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ClientIDMode="AutoID" ControlToValidate="textBoxEmail" ErrorMessage="RegularExpressionValidator" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">Formato incorrecto</asp:RegularExpressionValidator>
        <p>
&nbsp; Nombre<asp:TextBox ID="textBoxNombre" runat="server" Height="44px" style="margin-left: 110px" Width="269px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="requiredFieldValidatorNombre" runat="server" ControlToValidate="textBoxNombre" ErrorMessage="RequiredFieldValidator" ForeColor="Red">*</asp:RequiredFieldValidator>
            </p>
        <p>
&nbsp; Apellidos<asp:TextBox ID="textBoxApellidos" runat="server" Height="42px" style="margin-left: 101px" Width="269px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="requiredFieldValidatorApellidos" runat="server" ControlToValidate="textBoxApellidos" ErrorMessage="RequiredFieldValidator" ForeColor="Red">*</asp:RequiredFieldValidator>
            </p>
        <p>
&nbsp; Password<asp:TextBox ID="textBoxPassword" runat="server" Height="43px" style="margin-left: 102px" Width="268px" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="requiredFieldValidatorPassword" runat="server" ControlToValidate="textBoxPassword" ErrorMessage="RequiredFieldValidator" ForeColor="Red">*</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="RegularExpressionValidator" ControlToValidate="textBoxPassword" MatchTimeout="2" ValidationExpression="^.{6,}$">Longitud mínima 6 caracteres</asp:RegularExpressionValidator>
            </p>
        <p>
&nbsp; Repetir Psw<asp:TextBox ID="textBoxRepetirPsw" runat="server" Height="42px" style="margin-left: 83px" Width="268px" TextMode="Password"></asp:TextBox>
           
            <asp:RequiredFieldValidator ID="requiredFieldValidatorPassword2" runat="server" ControlToValidate="textBoxRepetirPsw" ErrorMessage="RequiredFieldValidator" ForeColor="Red">*</asp:RequiredFieldValidator>
           
            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="RegularExpressionValidator" ControlToValidate="textBoxRepetirPsw" ValidationExpression="^.{6,}$">Longitud mínima 6 caracteres</asp:RegularExpressionValidator>
           
        </p>
        &nbsp; Rol&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:RequiredFieldValidator ID="requiredFieldValidatorRol" runat="server" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ControlToValidate="RadioButtonList1">*</asp:RequiredFieldValidator>
&nbsp;<asp:RadioButtonList ID="RadioButtonList1" runat="server" style="margin-left: 205px" Width="119px" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
            <asp:ListItem>Alumno</asp:ListItem>
            <asp:ListItem>Profesor</asp:ListItem>
        </asp:RadioButtonList>
        <br />
        <br />
        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="CompareValidator" ControlToCompare="textBoxPassword" ControlToValidate="textBoxRepetirPsw">Las contraseñas deben coincidir</asp:CompareValidator>
        <br />
        <br />
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp 
&nbsp;<asp:Label ID="labelTodoOK" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="labelCodigoEnviado" runat="server" Visible="False"></asp:Label>
        <p>
            
            <asp:Button ID="botonRegistrar" runat="server" Text="Registrar" OnClick="Button1_Click" style="margin-left: 53px; margin-top: 0px;" Width="380px" Height="45px" />
        </p>
           
    </form>
</body>
</html>
