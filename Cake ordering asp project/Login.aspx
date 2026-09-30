<%@ Page Title="Login"
    Language="C#"
    MasterPageFile="~/Site1.Master"
    AutoEventWireup="true"
    CodeBehind="Login.aspx.cs"
    Inherits="Cake_ordering_asp_project.Login" %>

<asp:Content ID="Content1"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">

    <style>

        .login-container {
            width: 400px;
            max-width: 90%;
            margin: 60px auto;
            padding: 35px;
            background-color: #fff8f2;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.12);
            text-align: center;
            font-family: 'Times New Roman', Times, serif;
        }

        .login-container h2 {
            color: #6b3520;
            font-size: 32px;
            margin-bottom: 25px;
        }

        .login-container label {
            display: block;
            text-align: left;
            color: #6b3520;
            font-weight: bold;
            margin-bottom: 6px;
        }

        .login-container input[type="text"],
        .login-container input[type="password"] {
            width: 100%;
            padding: 11px;
            border: 1px solid #d99b83;
            border-radius: 8px;
            box-sizing: border-box;
            font-size: 16px;
        }

        .login-container input[type="text"]:focus,
        .login-container input[type="password"]:focus {
            outline: none;
            border-color: #6b3520;
        }

        .login-container input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #6b3520;
            color: white;
            border: none;
            border-radius: 25px;
            font-size: 17px;
            font-weight: bold;
            cursor: pointer;
        }

        .login-container input[type="submit"]:hover {
            background-color: #8b4513;
        }

        .login-message {
            color: crimson;
            font-weight: bold;
        }

        .login-register-link {
            color: #6b3520;
            text-decoration: none;
            font-weight: bold;
        }

        .login-register-link:hover {
            color: crimson;
        }

    </style>


    <div class="login-container">

        <h2>Login</h2>


        <asp:Label ID="lblUsername"
            runat="server"
            Text="Username">
        </asp:Label>

        <br />

        <asp:TextBox ID="txtUsername"
            runat="server">
        </asp:TextBox>


        <br /><br />


        <asp:Label ID="lblPassword"
            runat="server"
            Text="Password">
        </asp:Label>

        <br />

        <asp:TextBox ID="txtPassword"
            runat="server"
            TextMode="Password">
        </asp:TextBox>


        <br /><br />


        <asp:Button ID="btnLogin"
            runat="server"
            Text="Login"
            OnClick="btnLogin_Click" />


        <br /><br />


        <asp:Label ID="Message"
            runat="server"
            CssClass="login-message">
        </asp:Label>


        <br /><br />


        <!-- IMPORTANT: Register page -->
        <asp:HyperLink ID="lnkRegister"
            runat="server"
            NavigateUrl="~/Register.aspx"
            CssClass="login-register-link">

            Don't have an account? Register here

        </asp:HyperLink>

    </div>

</asp:Content>