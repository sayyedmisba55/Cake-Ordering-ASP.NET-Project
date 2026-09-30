<%@ Page Title="Order Details"
    Language="C#"
    MasterPageFile="~/Site1.Master"
    AutoEventWireup="true"
    CodeBehind="OrderDetails.aspx.cs"
    Inherits="Cake_ordering_asp_project.OrderDetails" %>

<asp:Content ID="Content1"
    ContentPlaceHolderID="head"
    runat="server">

    <style>
        .details-container {
            width: 90%;
            max-width: 1000px;
            margin: 40px auto;
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.12);
        }

        .page-title {
            text-align: center;
            color: #6b3520;
            font-family: Georgia, serif;
            margin-bottom: 30px;
        }

        .order-info {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 15px;
            margin-bottom: 30px;
        }

        .info-box {
            background: #fff8f2;
            padding: 15px;
            border-radius: 10px;
        }

        .info-box strong {
            color: #6b3520;
            display: block;
            margin-bottom: 5px;
        }

        .items-title {
            color: #6b3520;
            margin-bottom: 15px;
        }

        .items-table {
            width: 100%;
            border-collapse: collapse;
        }

        .items-table th {
            background: #6b3520;
            color: white;
            padding: 12px;
            text-align: left;
        }

        .items-table td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
        }

        .total-box {
            text-align: right;
            margin-top: 25px;
            line-height: 1.8;
            font-size: 17px;
        }

        .grand-total {
            color: crimson;
            font-size: 22px;
            font-weight: bold;
        }

        .back-btn {
            display: inline-block;
            margin-top: 25px;
            padding: 12px 20px;
            background: #6b3520;
            color: white;
            text-decoration: none;
            border-radius: 8px;
        }

        .back-btn:hover {
            background: #4d2415;
            color: white;
        }

        .message {
            display: block;
            text-align: center;
            color: crimson;
            font-size: 18px;
            margin: 30px;
        }

        @media screen and (max-width: 700px) {
            .details-container {
                width: 95%;
                padding: 20px;
            }

            .order-info {
                grid-template-columns: 1fr;
            }

            .items-table {
                font-size: 13px;
            }
        }
    </style>

</asp:Content>


<asp:Content ID="Content2"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">

    <div class="details-container">

        <h1 class="page-title">
            Order Details
        </h1>

        <asp:Panel ID="pnlOrderDetails"
            runat="server"
            Visible="false">

            <div class="order-info">

                <div class="info-box">
                    <strong>Order ID</strong>
                    <asp:Label ID="lblOrderId"
                        runat="server" />
                </div>

                <div class="info-box">
                    <strong>Order Date</strong>
                    <asp:Label ID="lblOrderDate"
                        runat="server" />
                </div>

                <div class="info-box">
                    <strong>Status</strong>
                    <asp:Label ID="lblStatus"
                        runat="server" />
                </div>

                <div class="info-box">
                    <strong>Payment Method</strong>
                    <asp:Label ID="lblPayment"
                        runat="server" />
                </div>

                <div class="info-box">
                    <strong>Name</strong>
                    <asp:Label ID="lblName"
                        runat="server" />
                </div>

                <div class="info-box">
                    <strong>Email</strong>
                    <asp:Label ID="lblEmail"
                        runat="server" />
                </div>

                <div class="info-box">
                    <strong>Phone</strong>
                    <asp:Label ID="lblPhone"
                        runat="server" />
                </div>

                <div class="info-box">
                    <strong>City</strong>
                    <asp:Label ID="lblCity"
                        runat="server" />
                </div>

                <div class="info-box"
                    style="grid-column: 1 / -1;">

                    <strong>Address</strong>

                    <asp:Label ID="lblAddress"
                        runat="server" />

                </div>

            </div>


            <h2 class="items-title">
                Ordered Items
            </h2>


            <table class="items-table">

                <thead>
                    <tr>
                        <th>Product</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Total</th>
                    </tr>
                </thead>

                <tbody>

                    <asp:Repeater ID="ItemsRepeater"
                        runat="server">

                        <ItemTemplate>

                            <tr>

                                <td>
                                    <%# Eval("ProductName") %>
                                </td>

                                <td>
                                    <%# Eval("Qty") %>
                                </td>

                                <td>
                                    ₹<%# Eval("Price", "{0:0.00}") %>
                                </td>

                                <td>
                                    ₹<%# Eval("ItemTotal", "{0:0.00}") %>
                                </td>

                            </tr>

                        </ItemTemplate>

                    </asp:Repeater>

                </tbody>

            </table>


            <div class="total-box">

                Subtotal:
                ₹<asp:Label ID="lblSubtotal"
                    runat="server" />

                <br />

                Shipping:
                ₹<asp:Label ID="lblShipping"
                    runat="server" />

                <br />

                Tax:
                ₹<asp:Label ID="lblTax"
                    runat="server" />

                <br />

                <span class="grand-total">
                    Total:
                    ₹<asp:Label ID="lblTotal"
                        runat="server" />
                </span>

            </div>


            <a href="MyOrders.aspx"
                class="back-btn">
                ← Back to My Orders
            </a>

        </asp:Panel>


        <asp:Label ID="lblMessage"
            runat="server"
            CssClass="message" />

    </div>

</asp:Content>