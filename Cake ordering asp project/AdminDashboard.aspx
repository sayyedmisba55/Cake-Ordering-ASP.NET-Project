<%@ Page Title="Admin Dashboard"
    Language="C#"
    MasterPageFile="~/Site1.Master"
    AutoEventWireup="true"
    CodeBehind="AdminDashboard.aspx.cs"
    Inherits="Cake_ordering_asp_project.AdminDashboard" %>

<asp:Content ID="Content1"
    ContentPlaceHolderID="head"
    runat="server">

    <style>

        .dashboard-container {
            width: 95%;
            max-width: 1200px;
            margin: 40px auto;
        }

        .dashboard-title {
            text-align: center;
            color: #6b3520;
            font-family: Georgia, serif;
            margin-bottom: 10px;
        }

        .dashboard-welcome {
            text-align: center;
            color: #777;
            margin-bottom: 30px;
        }

        .dashboard-cards {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
            margin-bottom: 30px;
        }

        .dashboard-card {
            background: white;
            padding: 25px;
            border-radius: 15px;
            text-align: center;
            box-shadow: 0 4px 15px rgba(0,0,0,0.12);
        }

        .dashboard-card h3 {
            color: #6b3520;
            margin-bottom: 12px;
        }

        .dashboard-number {
            font-size: 32px;
            font-weight: bold;
            color: #8b4513;
        }

        .dashboard-links {
            display: flex;
            justify-content: center;
            gap: 15px;
            flex-wrap: wrap;
        }

        .dashboard-btn {
            display: inline-block;
            background: #6b3520;
            color: white;
            padding: 12px 22px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: bold;
        }

        .dashboard-btn:hover {
            background: #4d2415;
            color: white;
        }

        .logout-btn {
            background: #8b0000;
        }

        .logout-btn:hover {
            background: #650000;
        }

        @media screen and (max-width: 900px) {

            .dashboard-cards {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        @media screen and (max-width: 500px) {

            .dashboard-cards {
                grid-template-columns: 1fr;
            }
        }

    </style>

</asp:Content>


<asp:Content ID="Content2"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">

    <div class="dashboard-container">

        <h1 class="dashboard-title">
            Admin Dashboard
        </h1>

        <div class="dashboard-welcome">
            Welcome,
            <%: Session["AdminName"] %>
        </div>


        <div class="dashboard-cards">

            <!-- TOTAL CUSTOMERS -->

            <div class="dashboard-card">

                <h3>
                    Total Customers
                </h3>

                <div class="dashboard-number">
                    <asp:Label
                        ID="lblCustomers"
                        runat="server"
                        Text="0">
                    </asp:Label>
                </div>

            </div>


            <!-- TOTAL ORDERS -->

            <div class="dashboard-card">

                <h3>
                    Total Orders
                </h3>

                <div class="dashboard-number">
                    <asp:Label
                        ID="lblOrders"
                        runat="server"
                        Text="0">
                    </asp:Label>
                </div>

            </div>


            <!-- TOTAL SALES -->

            <div class="dashboard-card">

                <h3>
                    Total Sales
                </h3>

                <div class="dashboard-number">
                    ₹<asp:Label
                        ID="lblSales"
                        runat="server"
                        Text="0.00">
                    </asp:Label>
                </div>

            </div>


            <!-- PENDING ORDERS -->

            <div class="dashboard-card">

                <h3>
                    Pending Orders
                </h3>

                <div class="dashboard-number">
                    <asp:Label
                        ID="lblPending"
                        runat="server"
                        Text="0">
                    </asp:Label>
                </div>

            </div>


            <!-- OUT FOR DELIVERY -->

            <div class="dashboard-card">

                <h3>
                    Out for Delivery
                </h3>

                <div class="dashboard-number">
                    <asp:Label
                        ID="lblDelivery"
                        runat="server"
                        Text="0">
                    </asp:Label>
                </div>

            </div>


            <!-- DELIVERED -->

            <div class="dashboard-card">

                <h3>
                    Delivered
                </h3>

                <div class="dashboard-number">
                    <asp:Label
                        ID="lblDelivered"
                        runat="server"
                        Text="0">
                    </asp:Label>
                </div>

            </div>


            <!-- CANCELLED -->

            <div class="dashboard-card">

                <h3>
                    Cancelled
                </h3>

                <div class="dashboard-number">
                    <asp:Label
                        ID="lblCancelled"
                        runat="server"
                        Text="0">
                    </asp:Label>
                </div>

            </div>

        </div>


        <!-- BUTTONS -->

        <div class="dashboard-links">

            <a href="AdminOrders.aspx"
               class="dashboard-btn">

                Manage Orders

            </a>


            <a href="Products.aspx"
               class="dashboard-btn">

                View Products

            </a>


            <a href="AdminLogout.aspx"
               class="dashboard-btn logout-btn"
               onclick="return confirm('Are you sure you want to logout?');">

                Admin Logout

            </a>

        </div>

    </div>

</asp:Content>