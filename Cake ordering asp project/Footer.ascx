<%@ Control Language="C#"
    AutoEventWireup="true"
    CodeBehind="Footer.ascx.cs"
    Inherits="Cake_ordering_asp_project.WebUserControl1" %>

<style>

    .footer {
        background-color: #3b2520;
        margin: 0 auto;
        color: white;
        padding: 30px;
        width: 100%;
        box-sizing: border-box;
    }

    .footer-container {
        display: flex;
        justify-content: space-around;
        flex-wrap: wrap;
        gap: 30px;
    }

    .footer h2 {
        color: #ffd6a5;
    }

    .footer a {
        color: white;
        text-decoration: none;
        display: block;
        margin-bottom: 8px;
    }

    .footer a:hover {
        color: #ffd6a5;
    }

    .footer-bottom {
        width: 100%;
        text-align: center;
        border-top: 1px solid #777;
        margin-top: 25px;
        padding-top: 15px;
    }

</style>


<div class="footer">

    <div class="footer-container">


        <!-- =========================
             ABOUT CAKE HEAVEN
        ========================== -->

        <div>

            <h2>Cake Heaven</h2>

            <p>
                Make your life fill with sweetness by
                tasting our delicious cakes, desserts,
                and sweetness.
            </p>

        </div>


        <!-- =========================
             QUICK LINKS
        ========================== -->

        <div>

            <h2>Quick Links</h2>


            <a href="Home.aspx">
                Home
            </a>


            <a href="Products.aspx">
                Products
            </a>


            <a href="ContactUs.aspx">
                Contact Us
            </a>


            <a href="Login.aspx">
                Login
            </a>


            <a href="Register.aspx">
                Register
            </a>


            <a href="Cart.aspx">
                Cart
            </a>


            <a href="Checkout.aspx">
                Checkout
            </a>

        </div>


        <!-- =========================
             ABOUT US
        ========================== -->

        <div>

            <h2>About Us</h2>

            <p>
                We provide all services and offer
                delicious desserts with reasonable prices.
            </p>

        </div>


        <!-- =========================
             CONTACT
        ========================== -->

        <div>

            <h2>Contact Us</h2>

            <p>
                Email: Cake.delicious@gmail.com
            </p>

            <p>
                Phone No: 1234556780
            </p>

        </div>


        <!-- =========================
             COPYRIGHT
        ========================== -->

        <div class="footer-bottom">

            © 2026 Cakes Delicious |
            All Rights Reserved

        </div>

    </div>

</div>