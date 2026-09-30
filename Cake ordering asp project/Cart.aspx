<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master"
    AutoEventWireup="true"
    CodeBehind="Cart.aspx.cs"
    Inherits="Cake_ordering_asp_project.WebForm3" %>


<asp:Content ID="Content1"
    ContentPlaceHolderID="head"
    runat="server">

    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />

    <style>

        * {
            box-sizing: border-box;
        }

        .cart-page {
            padding: 50px;
            text-align: center;
            background-color: #fff8f2;
            min-height: 100vh;
            font-family: 'Times New Roman', Times, serif;
        }

        .cart-page h1 {
            color: #6b3520;
            font-size: 40px;
        }

        #empty-cart {
            font-size: 22px;
            color: #777;
            margin-top: 50px;
        }

        #cart-items {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 25px;
            margin-top: 30px;
        }

        .cart-item {
            width: 280px;
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.12);
        }

        .cart-item img {
            width: 180px;
            height: 150px;
            object-fit: cover;
            border-radius: 10px;
        }

        .cart-item h3 {
            color: crimson;
        }

        .quantity {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 12px;
            margin: 10px 0;
            font-weight: bold;
        }

        .quantity button {
            width: 30px;
            height: 30px;
            border: none;
            background-color: black;
            color: white;
            font-size: 20px;
            cursor: pointer;
            border-radius: 4px;
            user-select: none;
        }

        .quantity button:hover {
            background-color: #333;
        }

        .quantity span {
            font-size: 18px;
            font-weight: bold;
            min-width: 20px;
            text-align: center;
        }

        .delete-btn {
            background-color: crimson;
            color: white;
            border: none;
            padding: 8px 18px;
            border-radius: 15px;
            cursor: pointer;
            font-size: 15px;
        }

        .delete-btn:hover {
            background-color: darkred;
        }

        #cart-total {
            font-size: 22px;
            font-weight: bold;
            color: #6b3520;
            margin-top: 30px;
        }

        #checkout-btn {
            display: none;
            background-color: red;
            color: white;
            border: none;
            padding: 12px 30px;
            border-radius: 25px;
            font-size: 17px;
            font-weight: bold;
            cursor: pointer;
            margin-top: 20px;
        }

        #checkout-btn:hover {
            background-color: darkred;
        }

    </style>

</asp:Content>


<asp:Content ID="Content2"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">

    <div class="cart-page">

        <h1>
            <i class="fa fa-shopping-cart"></i>
            Your Cart
        </h1>


        <div id="empty-cart">
            Your cart is empty.
        </div>


        <div id="cart-items">
        </div>


        <div id="cart-total">
        </div>


        <button type="button"
            id="checkout-btn"
            onclick="goToCheckout()">

            Checkout

        </button>

    </div>


    <script type="text/javascript">
// @ts-nocheck

        function displayCart() {

            var cart =
                JSON.parse(localStorage.getItem("cart") || "[]");


            var cartItems =
                document.getElementById("cart-items");

            var emptyCart =
                document.getElementById("empty-cart");

            var totalBox =
                document.getElementById("cart-total");

            var checkoutButton =
                document.getElementById("checkout-btn");


            if (cartItems == null ||
                emptyCart == null ||
                totalBox == null ||
                checkoutButton == null) {

                return;
            }


            if (cart.length == 0) {

                emptyCart.style.display = "block";

                cartItems.innerHTML = "";

                totalBox.innerHTML = "";

                checkoutButton.style.display = "none";

                return;
            }


            emptyCart.style.display = "none";

            checkoutButton.style.display = "inline-block";


            var total = 0;


            cartItems.innerHTML = "";


            for (var i = 0; i < cart.length; i++) {

                var price =
                    Number(cart[i].price);

                var qty =
                    Number(cart[i].qty);

                var itemTotal =
                    price * qty;


                total =
                    total + itemTotal;


                cartItems.innerHTML +=

                    '<div class="cart-item">' +

                        '<img src="' +
                        cart[i].image +
                        '" alt="Product">' +

                        '<h3>' +
                        cart[i].name +
                        '</h3>' +

                        '<p>Price: Rs. ' +
                        price +
                        '</p>' +

                        '<div class="quantity">' +

                            '<button type="button" ' +
                            'onclick="decreaseQty(' +
                            i +
                            ')">' +

                            '−' +

                            '</button>' +

                            '<span>' +
                            qty +
                            '</span>' +

                            '<button type="button" ' +
                            'onclick="increaseQty(' +
                            i +
                            ')">' +

                            '+' +

                            '</button>' +

                        '</div>' +

                        '<p>Total: Rs. ' +
                        itemTotal.toFixed(2) +
                        '</p>' +

                        '<button type="button" ' +
                        'class="delete-btn" ' +
                        'onclick="deleteItem(' +
                        i +
                        ')">' +

                            '<i class="fa fa-trash"></i> ' +
                            'Delete' +

                        '</button>' +

                    '</div>';

            }


            totalBox.innerHTML =
                "Total: Rs. " +
                total.toFixed(2);

        }


        function increaseQty(index) {

            var cart =
                JSON.parse(
                    localStorage.getItem("cart") || "[]"
                );


            if (cart[index] == null) {

                return;

            }


            cart[index].qty =
                Number(cart[index].qty) + 1;


            localStorage.setItem(
                "cart",
                JSON.stringify(cart)
            );


            displayCart();

        }


        function decreaseQty(index) {

            var cart =
                JSON.parse(
                    localStorage.getItem("cart") || "[]"
                );


            if (cart[index] == null) {

                return;

            }


            if (Number(cart[index].qty) > 1) {

                cart[index].qty =
                    Number(cart[index].qty) - 1;


                localStorage.setItem(
                    "cart",
                    JSON.stringify(cart)
                );


                displayCart();

            }

        }


        function deleteItem(index) {

            var cart =
                JSON.parse(
                    localStorage.getItem("cart") || "[]"
                );


            if (cart[index] == null) {

                return;

            }


            cart.splice(index, 1);


            localStorage.setItem(
                "cart",
                JSON.stringify(cart)
            );


            displayCart();

        }


        function goToCheckout() {

            window.location.href =
                "Checkout.aspx";

        }


        window.onload = function () {

            displayCart();

        };

    </script>

</asp:Content>