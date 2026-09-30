<%@ Page Title="Products"
    Language="C#"
    MasterPageFile="~/Site1.Master"
    AutoEventWireup="true"
    CodeBehind="Products.aspx.cs"
    Inherits="Cake_ordering_asp_project.WebForm2" %>

<%@ Register Src="~/Footer.ascx"
    TagName="Footer"
    TagPrefix="uc1" %>

<asp:Content ID="Content1"
    ContentPlaceHolderID="head"
    runat="server">

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />

    <style type="text/css">

        .products-page {
            padding: 30px;
            background-color: #fff8f2;
            text-align: center;
            font-family: 'Times New Roman', Times, serif;
            min-height: 100vh;
        }

        .products-page h4 {
            font-size: 36px;
            color: #6b3520;
            margin: 10px 0;
            font-family: Arial, sans-serif;
        }

        .subtitle {
            color: #777;
            font-size: 16px;
            margin-bottom: 20px;
        }

        .search-box {
            margin: 15px auto 20px;
        }

        .search-box i {
            margin-right: 8px;
            color: #6b3520;
        }

        .search-input {
            width: 300px;
            padding: 10px 15px;
            border: 1px solid #d99b83;
            border-radius: 25px;
            font-size: 15px;
            outline: none;
        }

        .categories {
            margin: 15px 0 25px;
        }

        .category {
            padding: 8px 20px;
            margin: 4px;
            border: 1px solid #d99b83;
            border-radius: 20px;
            background-color: white;
            color: #6b3520;
            cursor: pointer;
        }

        .category:hover {
            background-color: #ffd6a5;
        }

        .Product-container {
            display: grid;
            grid-template-columns: repeat(3, 280px);
            justify-content: center;
            gap: 25px;
        }

        .product {
            width: 280px;
            height: 390px;
            background-color: white;
            padding: 12px;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.12);
            position: relative;
            text-align: center;
            box-sizing: border-box;
            transition: transform 0.3s;
        }

        .product:hover {
            transform: scale(1.03);
        }

        .product img {
            width: 100%;
            height: 170px;
            object-fit: cover;
            border-radius: 12px;
        }

        .product h3 {
            color: crimson;
            font-size: 20px;
            margin: 10px 0 6px;
        }

        .product p:not(.price) {
            height: 42px;
            margin: 5px 0;
            line-height: 20px;
            font-size: 15px;
        }

        .price {
            color: #8b4513;
            font-size: 16px;
            font-weight: bold;
            margin-top: 10px;
        }

        .add-cart {
            background-color: red;
            color: white;
            border: none;
            padding: 9px 15px;
            font-weight: bold;
            border-radius: 20px;
            cursor: pointer;
            position: absolute;
            bottom: 18px;
            left: 50%;
            width: 145px;
            height: 42px;
            transform: translateX(-50%);
        }

        .add-cart:hover {
            background-color: darkred;
        }

        .add-cart i {
            margin-right: 6px;
        }

        @media screen and (max-width: 950px) {

            .Product-container {
                grid-template-columns: repeat(2, 280px);
            }
        }

        @media screen and (max-width: 650px) {

            .Product-container {
                grid-template-columns: 280px;
            }

            .search-input {
                width: 260px;
            }
        }

    </style>

</asp:Content>


<asp:Content ID="Content2"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">

    <div class="products-page">

        <!-- TITLE -->

        <h4>Our Products</h4>

        <p class="subtitle">
            Freshly baked, always delicious
        </p>


        <!-- SEARCH -->

        <div class="search-box">

            <i class="fa fa-search"></i>

            <input
                type="text"
                id="searchBox"
                class="search-input"
                placeholder="Search product..."
                onkeyup="searchProducts();" />

        </div>


        <!-- CATEGORIES -->

        <div class="categories">

            <button
                type="button"
                class="category"
                onclick="filterProducts('all');">

                All

            </button>

            <button
                type="button"
                class="category"
                onclick="filterProducts('cake');">

                Cake

            </button>

            <button
                type="button"
                class="category"
                onclick="filterProducts('pastry');">

                Pastry

            </button>

            <button
                type="button"
                class="category"
                onclick="filterProducts('cupcake');">

                Cupcake

            </button>

        </div>


        <!-- PRODUCTS FROM MYSQL DATABASE -->

        <div class="Product-container">

            <asp:Repeater ID="ProductRepeater" runat="server">

                <ItemTemplate>

                    <div class='<%# "product " + Eval("Category").ToString().ToLower() %>'>

                        <img
                            src='<%# Eval("ImagePath") %>'
                            alt='<%# Eval("ProductName") %>' />

                        <h3>
                            <%# Eval("ProductName") %>
                        </h3>

                        <p>
                            <%# Eval("Description") %>
                        </p>

                        <p class="price">
                            Price: Rs <%# Eval("Price", "{0:0}") %>
                        </p>

                        <button
                            type="button"
                            class="add-cart"
                            onclick="addToCart(this);">

                            <i class="fa fa-shopping-cart"></i>
                            Add To Cart

                        </button>

                    </div>

                </ItemTemplate>

            </asp:Repeater>

        </div>


        <!-- FOOTER -->

        <uc1:Footer
            ID="Footer1"
            runat="server" />

    </div>


    <!-- JAVASCRIPT -->

    <script type="text/javascript">

        // @ts-nocheck

        // ==============================
        // FILTER PRODUCTS
        // ==============================

        function filterProducts(category) {

            var products =
                document.getElementsByClassName("product");

            for (var i = 0; i < products.length; i++) {

                if (category === "all") {

                    products[i].style.display = "";

                }
                else {

                    var productClass =
                        products[i].className;

                    if (productClass.indexOf(category) !== -1) {

                        products[i].style.display = "";

                    }
                    else {

                        products[i].style.display = "none";

                    }
                }
            }
        }


        // ==============================
        // SEARCH PRODUCTS
        // ==============================

        function searchProducts() {

            var searchBox =
                document.getElementById("searchBox");

            if (searchBox === null) {
                return;
            }

            var search =
                searchBox.value.toLowerCase().trim();

            var products =
                document.getElementsByClassName("product");

            for (var i = 0; i < products.length; i++) {

                var heading =
                    products[i].getElementsByTagName("h3")[0];

                if (heading === null) {
                    continue;
                }

                var productName =
                    heading.innerText.toLowerCase();

                if (productName.indexOf(search) !== -1) {

                    products[i].style.display = "";

                }
                else {

                    products[i].style.display = "none";

                }
            }
        }


        // ==============================
        // ADD TO CART
        // ==============================

        function addToCart(button) {

            if (button === null) {
                return;
            }

            var product =
                button.parentElement;

            if (product === null) {
                return;
            }

            var nameElement =
                product.getElementsByTagName("h3")[0];

            if (nameElement === null) {
                return;
            }

            var name =
                nameElement.innerText.trim();


            var priceElement =
                product.getElementsByClassName("price")[0];

            if (priceElement === null) {
                return;
            }

            var priceText =
                priceElement.innerText;

            var price =
                parseInt(
                    priceText.replace("Price: Rs ", ""),
                    10
                );

            if (isNaN(price)) {
                price = 0;
            }


            var imageElement =
                product.getElementsByTagName("img")[0];

            var image = "";

            if (imageElement !== null) {

                image =
                    imageElement.getAttribute("src");

            }


            var cart = [];

            var oldCart =
                localStorage.getItem("cart");

            if (oldCart !== null) {

                try {

                    cart =
                        JSON.parse(oldCart);

                    if (!Array.isArray(cart)) {
                        cart = [];
                    }

                }
                catch (error) {

                    cart = [];

                }
            }


            var found = false;

            for (var i = 0; i < cart.length; i++) {

                if (cart[i].name === name) {

                    cart[i].qty =
                        Number(cart[i].qty) + 1;

                    found = true;

                    break;
                }
            }


            if (found === false) {

                cart.push({

                    name: name,

                    price: price,

                    image: image,

                    qty: 1

                });
            }


            localStorage.setItem(
                "cart",
                JSON.stringify(cart)
            );


            updateCartCount();


            alert(
                name + " added to cart!"
            );
        }


        // ==============================
        // UPDATE CART COUNT
        // ==============================

        function updateCartCount() {

            var cart = [];

            var oldCart =
                localStorage.getItem("cart");

            if (oldCart !== null) {

                try {

                    cart =
                        JSON.parse(oldCart);

                    if (!Array.isArray(cart)) {
                        cart = [];
                    }

                }
                catch (error) {

                    cart = [];

                }
            }


            var count = 0;

            for (var i = 0; i < cart.length; i++) {

                count =
                    count +
                    Number(cart[i].qty || 0);
            }


            var cartCount =
                document.getElementById("cart-count");

            if (cartCount !== null) {

                cartCount.innerText =
                    String(count);
            }


            var masterCartCount =
                document.getElementById(
                    "master-cart-count"
                );

            if (masterCartCount !== null) {

                masterCartCount.innerText =
                    String(count);
            }
        }


        // ==============================
        // PAGE LOAD
        // ==============================

        window.onload = function () {

            updateCartCount();

        };

    </script>

</asp:Content>