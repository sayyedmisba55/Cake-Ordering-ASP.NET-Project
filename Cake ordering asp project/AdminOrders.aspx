<%@ Page Title="Admin Orders"
    Language="C#"
    MasterPageFile="~/Site1.Master"
    AutoEventWireup="true"
    CodeBehind="AdminOrders.aspx.cs"
    Inherits="Cake_ordering_asp_project.AdminOrders" %>

<asp:Content ID="Content1"
    ContentPlaceHolderID="head"
    runat="server">

    <style>

        .admin-container {
            width: 95%;
            max-width: 1200px;
            margin: 40px auto;
        }

        .admin-title {
            text-align: center;
            color: #6b3520;
            font-family: Georgia, serif;
            margin-bottom: 15px;
        }

        /* ADMIN TOP BAR */
        .admin-topbar {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 15px;
            margin-bottom: 30px;
            flex-wrap: wrap;
        }

        .admin-welcome {
            color: #6b3520;
            font-weight: bold;
            font-size: 16px;
        }

        .logout-btn {
            display: inline-block;
            background: #8b0000;
            color: white;
            padding: 10px 18px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: bold;
        }

        .logout-btn:hover {
            background: #650000;
            color: white;
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
            margin-bottom: 20px;
        }

        .order-id {
            font-size: 21px;
            font-weight: bold;
            color: #6b3520;
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

        .status-area {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-top: 10px;
        }

        .status-dropdown {
            padding: 9px 12px;
            border: 1px solid #ccc;
            border-radius: 7px;
            font-size: 15px;
        }

        .update-btn {
            background: #6b3520;
            color: white;
            border: none;
            padding: 10px 18px;
            border-radius: 7px;
            cursor: pointer;
        }

        .update-btn:hover {
            background: #4d2415;
        }

        .details-btn {
            display: inline-block;
            background: #8b4513;
            color: white;
            padding: 9px 16px;
            border-radius: 7px;
            text-decoration: none;
            margin-top: 10px;
        }

        .details-btn:hover {
            color: white;
            background: #6b3520;
        }

        .no-orders {
            background: white;
            padding: 40px;
            text-align: center;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.12);
        }

        @media screen and (max-width: 800px) {

            .order-info {
                grid-template-columns: repeat(2, 1fr);
            }

            .order-header {
                flex-direction: column;
                align-items: flex-start;
                gap: 10px;
            }
        }

        @media screen and (max-width: 500px) {

            .order-info {
                grid-template-columns: 1fr;
            }

            .status-area {
                flex-direction: column;
                align-items: flex-start;
            }
        }

    </style>

</asp:Content>


<asp:Content ID="Content2"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">

    <div class="admin-container">

        <!-- ADMIN TITLE -->

        <h1 class="admin-title">
            Admin Order Management
        </h1>


        <!-- ADMIN WELCOME + LOGOUT -->

        <div class="admin-topbar">

            <span class="admin-welcome">
                Welcome,
                <%: Session["AdminName"] %>
            </span>

            <a href="AdminLogout.aspx"
               class="logout-btn"
               onclick="return confirm('Are you sure you want to logout?');">

                Admin Logout

            </a>

        </div>


        <!-- ORDERS -->

        <asp:Repeater ID="OrdersRepeater"
            runat="server"
            OnItemCommand="OrdersRepeater_ItemCommand">

            <ItemTemplate>

                <div class="order-card">

                    <div class="order-header">

                        <div class="order-id">
                            Order #<%# Eval("OrderId") %>
                        </div>

                        <div>
                            <strong>
                                <%# Eval("Status") %>
                            </strong>
                        </div>

                    </div>


                    <div class="order-info">

                        <div class="info-box">
                            <strong>Customer</strong>
                            <%# Eval("FullName") %>
                        </div>

                        <div class="info-box">
                            <strong>Email</strong>
                            <%# Eval("Email") %>
                        </div>

                        <div class="info-box">
                            <strong>Payment</strong>
                            <%# Eval("PaymentMethod") %>
                        </div>

                        <div class="info-box">
                            <strong>Total Amount</strong>
                            ₹<%# Eval("TotalAmount", "{0:0.00}") %>
                        </div>

                        <div class="info-box">
                            <strong>Phone</strong>
                            <%# Eval("Phone") %>
                        </div>

                        <div class="info-box">
                            <strong>City</strong>
                            <%# Eval("City") %>
                        </div>

                        <div class="info-box">
                            <strong>Pincode</strong>
                            <%# Eval("Pincode") %>
                        </div>

                        <div class="info-box">
                            <strong>Order Date</strong>
                            <%# Convert.ToDateTime(Eval("OrderDate")).ToString("dd-MM-yyyy hh:mm tt") %>
                        </div>

                    </div>


                    <!-- CHANGE STATUS -->

                    <div class="status-area">

                        <strong>
                            Change Status:
                        </strong>


                        <asp:DropDownList
                            ID="ddlStatus"
                            runat="server"
                            CssClass="status-dropdown"
                            SelectedValue='<%# Eval("Status") %>'>

                            <asp:ListItem
                                Text="Placed"
                                Value="Placed">
                            </asp:ListItem>

                            <asp:ListItem
                                Text="Confirmed"
                                Value="Confirmed">
                            </asp:ListItem>

                            <asp:ListItem
                                Text="Preparing"
                                Value="Preparing">
                            </asp:ListItem>

                            <asp:ListItem
                                Text="Out for Delivery"
                                Value="Out for Delivery">
                            </asp:ListItem>

                            <asp:ListItem
                                Text="Delivered"
                                Value="Delivered">
                            </asp:ListItem>

                            <asp:ListItem
                                Text="Cancelled"
                                Value="Cancelled">
                            </asp:ListItem>

                        </asp:DropDownList>


                        <asp:LinkButton
                            ID="btnUpdateStatus"
                            runat="server"
                            CssClass="update-btn"
                            CommandName="UpdateStatus"
                            CommandArgument='<%# Eval("OrderId") %>'>

                            Update Status

                        </asp:LinkButton>

                    </div>


                    <!-- VIEW DETAILS -->

                    <a
                        class="details-btn"
                        href='<%# "OrderDetails.aspx?OrderId=" + Eval("OrderId") %>'>

                        View Order Details

                    </a>

                </div>

            </ItemTemplate>

        </asp:Repeater>


        <!-- NO ORDERS -->

        <asp:Panel
            ID="pnlNoOrders"
            runat="server"
            Visible="false"
            CssClass="no-orders">

            <h2>
                No Orders Found
            </h2>

            <p>
                There are currently no customer orders.
            </p>

        </asp:Panel>

    </div>

</asp:Content>