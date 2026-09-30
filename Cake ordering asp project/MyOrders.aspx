<%@ Page Title="My Orders"
    Language="C#"
    MasterPageFile="~/Site1.Master"
    AutoEventWireup="true"
    CodeBehind="MyOrders.aspx.cs"
    Inherits="Cake_ordering_asp_project.MyOrders" %>

<asp:Content ID="Content1"
    ContentPlaceHolderID="head"
    runat="server">

    <style>
        .orders-container {
            width: 90%;
            max-width: 1100px;
            margin: 40px auto;
        }

        .orders-title {
            text-align: center;
            color: #6b3520;
            margin-bottom: 30px;
            font-family: Georgia, serif;
        }

        .order-card {
            background: white;
            padding: 25px;
            margin-bottom: 20px;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.12);
        }

        .order-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
        }

        .order-id {
            font-size: 20px;
            font-weight: bold;
            color: #6b3520;
        }

        .status {
            background: #fff0d9;
            color: #8a4b20;
            padding: 7px 14px;
            border-radius: 20px;
            font-weight: bold;
        }

        .order-info {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 15px;
            margin-bottom: 20px;
        }

        .info-box {
            background: #fff8f2;
            padding: 12px;
            border-radius: 8px;
        }

        .info-box strong {
            display: block;
            color: #6b3520;
            margin-bottom: 5px;
        }

        .buttons {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
        }

        .view-btn {
            display: inline-block;
            background: #6b3520;
            color: white;
            padding: 10px 18px;
            border-radius: 8px;
            text-decoration: none;
            border: none;
            cursor: pointer;
            font-size: 14px;
        }

        .view-btn:hover {
            background: #4d2415;
            color: white;
        }

        .cancel-btn {
            display: inline-block;
            background: crimson;
            color: white;
            padding: 10px 18px;
            border-radius: 8px;
            text-decoration: none;
            border: none;
            cursor: pointer;
            font-size: 14px;
        }

        .cancel-btn:hover {
            background: #a00000;
            color: white;
        }

        .no-orders {
            background: white;
            padding: 40px;
            text-align: center;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.12);
        }

        .no-orders h2 {
            color: #6b3520;
        }

        .shop-btn {
            display: inline-block;
            margin-top: 15px;
            background: crimson;
            color: white;
            padding: 12px 22px;
            border-radius: 8px;
            text-decoration: none;
        }

        .shop-btn:hover {
            color: white;
            background: #a00000;
        }

        @media screen and (max-width: 800px) {
            .order-info {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        @media screen and (max-width: 500px) {
            .order-info {
                grid-template-columns: 1fr;
            }

            .order-header {
                flex-direction: column;
                align-items: flex-start;
                gap: 10px;
            }
        }
    </style>

</asp:Content>


<asp:Content ID="Content2"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">

    <div class="orders-container">

        <h1 class="orders-title">
            My Orders
        </h1>


        <asp:Repeater ID="OrdersRepeater"
            runat="server"
            OnItemCommand="OrdersRepeater_ItemCommand">

            <ItemTemplate>

                <div class="order-card">

                    <div class="order-header">

                        <div class="order-id">
                            Order #<%# Eval("OrderId") %>
                        </div>

                        <div class="status">
                            <%# Eval("Status") %>
                        </div>

                    </div>


                    <div class="order-info">

                        <div class="info-box">
                            <strong>Order Date</strong>

                            <%# Convert.ToDateTime(
                                Eval("OrderDate")
                            ).ToString("dd-MM-yyyy") %>

                        </div>


                        <div class="info-box">

                            <strong>Payment</strong>

                            <%# Eval("PaymentMethod") %>

                        </div>


                        <div class="info-box">

                            <strong>Subtotal</strong>

                            ₹<%# Eval(
                                "Subtotal",
                                "{0:0.00}"
                            ) %>

                        </div>


                        <div class="info-box">

                            <strong>Total Amount</strong>

                            ₹<%# Eval(
                                "TotalAmount",
                                "{0:0.00}"
                            ) %>

                        </div>

                    </div>


                    <div class="buttons">

                        <!-- View Details -->

                        <a class="view-btn"
                           href='<%# "OrderDetails.aspx?OrderId=" + Eval("OrderId") %>'>
                            View Details
                        </a>


                        <!-- Cancel Order -->

                        <asp:LinkButton
                            ID="btnCancelOrder"
                            runat="server"
                            CssClass="cancel-btn"
                            CommandName="CancelOrder"
                            CommandArgument='<%# Eval("OrderId") %>'
                            Visible='<%# Eval("Status").ToString() == "Placed" %>'
                            OnClientClick="return confirm('Are you sure you want to cancel this order?');">

                            Cancel Order

                        </asp:LinkButton>

                    </div>

                </div>

            </ItemTemplate>

        </asp:Repeater>


        <asp:Panel ID="pnlNoOrders"
            runat="server"
            Visible="false"
            CssClass="no-orders">

            <h2>
                No Orders Yet
            </h2>

            <p>
                You have not placed any orders yet.
            </p>

            <a href="Products.aspx"
               class="shop-btn">

                Start Shopping

            </a>

        </asp:Panel>

    </div>

</asp:Content>