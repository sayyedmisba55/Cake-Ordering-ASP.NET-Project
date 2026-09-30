<%@ Page Title="Register"
    Language="C#"
    MasterPageFile="~/Site1.Master"
    AutoEventWireup="true"
    CodeBehind="Register.aspx.cs"
    Inherits="Cake_ordering_asp_project.Register" %>

<asp:Content ID="Content1"
    ContentPlaceHolderID="head"
    runat="server">

    <style>

        .register-page {
            min-height: calc(100vh - 75px);
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 40px 20px;
            background-color: #fff8f2;
        }

        .register-box {
            width: 500px;
            max-width: 100%;
            background-color: white;
            padding: 35px 45px;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.15);
        }

        .register-box h2 {
            text-align: center;
            color: #6b3520;
            margin-bottom: 25px;
            font-family: Georgia, serif;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 6px;
            color: #6b3520;
            font-weight: bold;
        }

        .form-group input,
        .form-group textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #d99b83;
            border-radius: 6px;
            font-size: 15px;
            font-family: Arial, sans-serif;
        }

        .form-group input:focus,
        .form-group textarea:focus {
            outline: none;
            border-color: #7b3f25;
        }

        .form-group textarea {
            height: 80px;
            resize: vertical;
        }

        .register-btn {
            display: block;
            margin: 25px auto 15px auto;
            width: 150px;
            padding: 12px;
            border: none;
            border-radius: 25px;
            background-color: #7b3f25;
            color: white;
            font-weight: bold;
            cursor: pointer;
        }

        .register-btn:hover {
            background-color: #5a2818;
        }

        .message {
            display: block;
            text-align: center;
            margin: 10px 0;
            font-weight: bold;
        }

        .login-link {
            text-align: center;
            color: #6b3520;
            margin-top: 10px;
        }

        .login-link a {
            color: crimson;
            text-decoration: none;
            font-weight: bold;
        }

        .login-link a:hover {
            text-decoration: underline;
        }

        @media screen and (max-width: 600px) {

            .register-page {
                padding: 25px 15px;
            }

            .register-box {
                padding: 25px 20px;
            }

        }

    </style>

</asp:Content>


<asp:Content ID="Content2"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">

    <div class="register-page">

        <div class="register-box">

            <h2>Create Your Account</h2>


            <!-- MESSAGE -->

            <asp:Label ID="Message"
                runat="server"
                CssClass="message">
            </asp:Label>


            <!-- FULL NAME -->

            <div class="form-group">

                <label>Full Name</label>

                <asp:TextBox ID="txtFullName"
                    runat="server">
                </asp:TextBox>

            </div>


            <!-- EMAIL -->

            <div class="form-group">

                <label>Email</label>

                <asp:TextBox ID="txtEmail"
                    runat="server"
                    TextMode="Email">
                </asp:TextBox>

            </div>


            <!-- USERNAME -->

            <div class="form-group">

                <label>Username</label>

                <asp:TextBox ID="txtUsername"
                    runat="server">
                </asp:TextBox>

            </div>


            <!-- PASSWORD -->

            <div class="form-group">

                <label>Password</label>

                <asp:TextBox ID="txtPassword"
                    runat="server"
                    TextMode="Password">
                </asp:TextBox>

            </div>


            <!-- CONFIRM PASSWORD -->

            <div class="form-group">

                <label>Confirm Password</label>

                <asp:TextBox ID="txtConfirmPassword"
                    runat="server"
                    TextMode="Password">
                </asp:TextBox>

            </div>


            <!-- MOBILE -->

            <div class="form-group">

                <label>Mobile Number</label>

                <asp:TextBox ID="txtMobile"
                    runat="server">
                </asp:TextBox>

            </div>


            <!-- ADDRESS -->

            <div class="form-group">

                <label>Address</label>

                <asp:TextBox ID="txtAddress"
                    runat="server"
                    TextMode="MultiLine">
                </asp:TextBox>

            </div>


            <!-- REGISTER BUTTON -->

            <asp:Button ID="btnRegister"
                runat="server"
                Text="Register"
                CssClass="register-btn"
                OnClick="btnRegister_Click" />


            <!-- LOGIN -->

            <div class="login-link">

                Already have an account?

                <a href="Login.aspx">
                    Login here
                </a>

            </div>

        </div>

    </div>

</asp:Content>