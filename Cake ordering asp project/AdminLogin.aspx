<%@ Page Title="Admin Login"
    Language="C#"
    MasterPageFile="~/Site1.Master"
    AutoEventWireup="true"
    CodeBehind="AdminLogin.aspx.cs"
    Inherits="Cake_ordering_asp_project.AdminLogin" %>

<asp:Content ID="Content1"
    ContentPlaceHolderID="head"
    runat="server">

    <style>

        .admin-login-container {
            width: 90%;
            max-width: 450px;
            margin: 70px auto;
        }

        .admin-login-box {
            background: white;
            padding: 35px;
            border-radius: 15px;
            box-shadow: 0 4px 18px rgba(0,0,0,0.15);
        }

        .admin-title {
            text-align: center;
            color: #6b3520;
            font-family: Georgia, serif;
            margin-bottom: 30px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            color: #6b3520;
            font-weight: bold;
            margin-bottom: 7px;
        }

        .form-control {
            width: 100%;
            box-sizing: border-box;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 7px;
            font-size: 15px;
        }

        .login-btn {
            width: 100%;
            background: #6b3520;
            color: white;
            border: none;
            padding: 13px;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
        }

        .login-btn:hover {
            background: #4d2415;
        }

        .message {
            display: block;
            text-align: center;
            margin-top: 15px;
            color: crimson;
            font-weight: bold;
        }

    </style>

</asp:Content>


<asp:Content ID="Content2"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">

    <div class="admin-login-container">

        <div class="admin-login-box">

            <h1 class="admin-title">
                Admin Login
            </h1>

            <div class="form-group">

                <label>
                    Username
                </label>

                <asp:TextBox
                    ID="txtUsername"
                    runat="server"
                    CssClass="form-control">
                </asp:TextBox>

            </div>


            <div class="form-group">

                <label>
                    Password
                </label>

                <asp:TextBox
                    ID="txtPassword"
                    runat="server"
                    TextMode="Password"
                    CssClass="form-control">
                </asp:TextBox>

            </div>


            <asp:Button
                ID="btnLogin"
                runat="server"
                Text="Login as Admin"
                CssClass="login-btn"
                OnClick="btnLogin_Click" />


            <asp:Label
                ID="Message"
                runat="server"
                CssClass="message">
            </asp:Label>

        </div>

    </div>

</asp:Content>