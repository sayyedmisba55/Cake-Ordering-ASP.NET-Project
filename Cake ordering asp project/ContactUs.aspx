<%@ Page Title="ContactUs"
    Language="C#"
    MasterPageFile="~/Site1.Master"
    AutoEventWireup="true"
    CodeBehind="ContactUs.aspx.cs"
    Inherits="Cake_ordering_asp_project.Contact" %>

<asp:Content ID="Content1"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">

    <style>
        .contact-container {
            padding: 50px;
            background-color: #fff8f2;
            min-height: 650px;
            font-family: 'Times New Roman', Times, serif;
        }

        .contact-container h2 {
            text-align: center;
            color: #6b3520;
            font-size: 40px;
            margin-bottom: 10px;
        }

        .contact-container > p {
            text-align: center;
            color: #777;
            font-size: 18px;
            margin-bottom: 40px;
        }

        .contact-content {
            display: flex;
            justify-content: center;
            gap: 40px;
            max-width: 1100px;
            margin: auto;
        }

        .contact-form,
        .contact-info {
            width: 45%;
            background-color: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.10);
            box-sizing: border-box;
        }

        .contact-form h3,
        .contact-info h3 {
            color: #6b3520;
            font-size: 25px;
            margin-bottom: 20px;
        }

        .contact-form label {
            display: block;
            color: #6b3520;
            font-weight: bold;
            margin-bottom: 6px;
        }

        .contact-form input[type="text"],
        .contact-form textarea {
            width: 100%;
            padding: 11px;
            border: 1px solid #d99b83;
            border-radius: 8px;
            box-sizing: border-box;
            font-size: 16px;
        }

        .contact-form textarea {
            resize: vertical;
        }

        .contact-form input[type="submit"] {
            background-color: #6b3520;
            color: white;
            border: none;
            padding: 12px 30px;
            border-radius: 25px;
            font-size: 17px;
            font-weight: bold;
            cursor: pointer;
        }

        .contact-form input[type="submit"]:hover {
            background-color: #8b4513;
        }

        .contact-status {
            color: green;
            font-weight: bold;
        }

        .info-item {
            display: flex;
            align-items: flex-start;
            gap: 15px;
            margin-bottom: 25px;
        }

        .info-icon {
            font-size: 25px;
            width: 40px;
        }

        .info-text h4 {
            margin: 0 0 5px 0;
            color: #6b3520;
            font-size: 19px;
        }

        .info-text p {
            margin: 0;
            color: #666;
            line-height: 1.5;
        }

        @media screen and (max-width: 800px) {
            .contact-container {
                padding: 25px;
            }

            .contact-content {
                flex-direction: column;
            }

            .contact-form,
            .contact-info {
                width: 100%;
            }
        }
    </style>

    <div class="contact-container">

        <h2>Contact Us</h2>

        <p>
            Have a question about our cakes or your order?
            Get in touch with us!
        </p>

        <div class="contact-content">

            <div class="contact-form">

                <h3>Send Us a Message</h3>

                <asp:Label ID="lblName"
                    runat="server"
                    Text="Name">
                </asp:Label>

                <br />

                <asp:TextBox ID="txtName"
                    runat="server">
                </asp:TextBox>

                <br /><br />

                <asp:Label ID="lblEmail"
                    runat="server"
                    Text="Email">
                </asp:Label>

                <br />

                <asp:TextBox ID="txtEmail"
                    runat="server">
                </asp:TextBox>

                <br /><br />

                <asp:Label ID="lblSubject"
                    runat="server"
                    Text="Subject">
                </asp:Label>

                <br />

                <asp:TextBox ID="txtSubject"
                    runat="server">
                </asp:TextBox>

                <br /><br />

                <asp:Label ID="lblMessageText"
                    runat="server"
                    Text="Message">
                </asp:Label>

                <br />

                <asp:TextBox ID="txtMessage"
                    runat="server"
                    TextMode="MultiLine"
                    Rows="5">
                </asp:TextBox>

                <br /><br />

                <asp:Button ID="btnSubmit"
                    runat="server"
                    Text="Submit"
                    OnClick="btnSubmit_Click">
                </asp:Button>

                <br /><br />

                <asp:Label ID="lblStatus"
                    runat="server"
                    CssClass="contact-status">
                </asp:Label>

            </div>

            <div class="contact-info">

                <h3>Cake Heaven</h3>

                <div class="info-item">
                    <div class="info-icon">✉</div>
                    <div class="info-text">
                        <h4>Email</h4>
                        <p>cakeheaven@gmail.com</p>
                    </div>
                </div>

                <div class="info-item">
                    <div class="info-icon">☎</div>
                    <div class="info-text">
                        <h4>Phone</h4>
                        <p>+91 98765 43210</p>
                    </div>
                </div>

                <div class="info-item">
                    <div class="info-icon">📍</div>
                    <div class="info-text">
                        <h4>Address</h4>
                        <p>
                            123 Sweet Street,<br />
                            Mumbai, Maharashtra 400074
                        </p>
                    </div>
                </div>

                <div class="info-item">
                    <div class="info-icon">🕐</div>
                    <div class="info-text">
                        <h4>Opening Hours</h4>
                        <p>Mon-Sun, 9:00 AM - 9:00 PM</p>
                    </div>
                </div>

            </div>

        </div>

    </div>

</asp:Content>