<%@ Page Title="Checkout"
    Language="C#"
    MasterPageFile="~/Site1.Master"
    AutoEventWireup="true"
    CodeBehind="Checkout.aspx.cs"
    Inherits="Cake_ordering_asp_project.WebForm1" %>

<asp:Content ID="Content1"
    ContentPlaceHolderID="head"
    runat="server">

    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />

    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
        }

        .checkout-page {
            min-height: 100vh;
            background-color: #fff8f2;
            padding: 40px 20px 70px;
            font-family: 'Times New Roman', Times, serif;
        }

        .checkout-container {
            max-width: 1100px;
            margin: auto;
        }

        .checkout-title {
            text-align: center;
            color: #6b3520;
            font-size: 42px;
            margin-bottom: 35px;
        }

        .checkout-grid {
            display: grid;
            grid-template-columns: 1.3fr 0.9fr;
            gap: 30px;
        }

        .checkout-box {
            background-color: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.12);
        }

        .checkout-box h2 {
            color: #6b3520;
            margin-top: 0;
            margin-bottom: 25px;
        }

        .form-group {
            margin-bottom: 18px;
        }

        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 7px;
            color: #444;
        }

        .form-group input,
        .form-group textarea {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 16px;
            font-family: inherit;
        }

        .form-group textarea {
            height: 90px;
            resize: vertical;
        }

        .payment-title {
            color: #6b3520;
            font-size: 24px;
            margin-top: 25px;
            margin-bottom: 15px;
        }

        .payment-option {
            display: block;
            padding: 13px;
            border: 1px solid #ddd;
            border-radius: 8px;
            margin-bottom: 10px;
            cursor: pointer;
        }

        .payment-option input {
            margin-right: 8px;
        }

        #online-payment-box {
            display: none;
            background: #fff8f2;
            padding: 18px;
            border-radius: 10px;
            margin-top: 12px;
        }

        .order-item {
            display: flex;
            align-items: center;
            gap: 15px;
            padding: 15px 0;
            border-bottom: 1px solid #ddd;
        }

        .order-item img {
            width: 75px;
            height: 65px;
            object-fit: cover;
            border-radius: 8px;
        }

        .order-item-info {
            flex: 1;
        }

        .order-item-info h4 {
            margin: 0 0 5px;
            color: #6b3520;
        }

        .order-item-info p {
            margin: 3px 0;
            color: #555;
        }

        .summary-row {
            display: flex;
            justify-content: space-between;
            padding: 8px 0;
            font-size: 17px;
        }

        .summary-total {
            border-top: 2px solid #6b3520;
            margin-top: 12px;
            padding-top: 15px;
            font-size: 23px;
            font-weight: bold;
            color: #6b3520;
        }

        #empty-checkout {
            text-align: center;
            color: #777;
            font-size: 20px;
            padding: 30px;
        }

        .button-row {
            margin-top: 25px;
            display: flex;
            gap: 12px;
            flex-wrap: wrap;
        }

        .place-order-btn {
            background-color: crimson;
            color: white;
            border: none;
            padding: 13px 28px;
            border-radius: 25px;
            font-size: 17px;
            font-weight: bold;
            cursor: pointer;
        }

        .place-order-btn:hover {
            background-color: darkred;
        }

        .bill-btn {
            display: none;
            background-color: #6b3520;
            color: white;
            border: none;
            padding: 13px 28px;
            border-radius: 25px;
            font-size: 17px;
            font-weight: bold;
            cursor: pointer;
        }

        .bill-btn:hover {
            background-color: #4e2516;
        }

        @media (max-width: 800px) {
            .checkout-grid {
                grid-template-columns: 1fr;
            }

            .checkout-title {
                font-size: 34px;
            }
        }
    </style>

</asp:Content>


<asp:Content ID="Content2"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">

    <div class="checkout-page">

        <div class="checkout-container">

            <h1 class="checkout-title">
                <i class="fa fa-credit-card"></i>
                Checkout
            </h1>

            <div class="checkout-grid">

                <!-- LEFT SIDE -->

                <div class="checkout-box">

                    <h2>
                        <i class="fa fa-location-dot"></i>
                        Delivery Details
                    </h2>

                    <div class="form-group">
                        <label for="fullName">Full Name</label>

                        <input type="text"
                            id="fullName"
                            placeholder="Enter your full name" />
                    </div>

                    <div class="form-group">
                        <label for="email">Email</label>

                        <input type="email"
                            id="email"
                            placeholder="Enter your email" />
                    </div>

                    <div class="form-group">
                        <label for="phone">Phone</label>

                        <input type="text"
                            id="phone"
                            placeholder="Enter phone number" />
                    </div>

                    <div class="form-group">
                        <label for="pincode">Pincode</label>

                        <input type="text"
                            id="pincode"
                            placeholder="Enter pincode" />
                    </div>

                    <div class="form-group">
                        <label for="address">Address</label>

                        <textarea
                            id="address"
                            placeholder="Enter complete address"></textarea>
                    </div>

                    <div class="form-group">
                        <label for="city">City</label>

                        <input type="text"
                            id="city"
                            placeholder="Enter city" />
                    </div>


                    <!-- PAYMENT -->

                    <div class="payment-title">
                        Payment Method
                    </div>

                    <label class="payment-option">

                        <input type="radio"
                            name="payment"
                            id="cod"
                            value="cod"
                            checked="checked"
                            onchange="showPayment('cod')" />

                        <i class="fa fa-money-bill"></i>
                        Cash on Delivery
                    </label>

                    <label class="payment-option">

                        <input type="radio"
                            name="payment"
                            id="online"
                            value="online"
                            onchange="showPayment('online')" />

                        <i class="fa fa-credit-card"></i>
                        Online Payment
                    </label>


                    <!-- ONLINE PAYMENT -->

                    <div id="online-payment-box">

                        <div class="form-group">

                            <label for="cardNumber">
                                Card Number
                            </label>

                            <input type="text"
                                id="cardNumber"
                                maxlength="19"
                                placeholder="XXXX XXXX XXXX XXXX" />

                        </div>

                        <div class="form-group">

                            <label for="expiry">
                                Expiry Date
                            </label>

                            <input type="text"
                                id="expiry"
                                placeholder="MM/YY" />

                        </div>

                        <div class="form-group">

                            <label for="cvv">
                                CVV
                            </label>

                            <input type="password"
                                id="cvv"
                                maxlength="4"
                                placeholder="CVV" />

                        </div>

                    </div>

                </div>


                <!-- RIGHT SIDE -->

                <div class="checkout-box">

                    <h2>
                        <i class="fa fa-shopping-cart"></i>
                        Order Summary
                    </h2>

                    <div id="checkout-items">

                    </div>

                    <div id="empty-checkout"
                        style="display:none;">
                        Your cart is empty.
                    </div>

                    <div class="summary-row">

                        <span>Subtotal</span>

                        <span id="checkout-subtotal">
                            Rs. 0.00
                        </span>

                    </div>

                    <div class="summary-row">

                        <span>Shipping</span>

                        <span id="checkout-shipping">
                            Rs. 50.00
                        </span>

                    </div>

                    <div class="summary-row">

                        <span>Tax (5%)</span>

                        <span id="checkout-tax">
                            Rs. 0.00
                        </span>

                    </div>

                    <div class="summary-row summary-total">

                        <span>Total</span>

                        <span id="checkout-total">
                            Rs. 0.00
                        </span>

                    </div>


                    <div class="button-row">

                        <button type="button"
                            id="place-order-btn"
                            class="place-order-btn"
                            onclick="placeOrder()">

                            <i class="fa fa-check"></i>
                            Place Order

                        </button>


                        <button type="button"
                            id="download-bill-btn"
                            class="bill-btn"
                            onclick="downloadBill()">

                            <i class="fa fa-file-pdf"></i>
                            Download Bill

                        </button>

                    </div>

                </div>

            </div>

        </div>

    </div>


    <script type="text/javascript">

        // @ts-nocheck

        var currentSubtotal = 0;
        var currentShipping = 50;
        var currentTax = 0;
        var currentTotal = 0;


        function displayCheckoutCart() {

            var cart =
                JSON.parse(
                    localStorage.getItem("cart") || "[]"
                );

            var itemsBox =
                document.getElementById("checkout-items");

            var emptyBox =
                document.getElementById("empty-checkout");

            var subtotalBox =
                document.getElementById("checkout-subtotal");

            var shippingBox =
                document.getElementById("checkout-shipping");

            var taxBox =
                document.getElementById("checkout-tax");

            var totalBox =
                document.getElementById("checkout-total");


            if (!itemsBox ||
                !emptyBox ||
                !subtotalBox ||
                !shippingBox ||
                !taxBox ||
                !totalBox) {

                return;
            }


            if (cart.length === 0) {

                itemsBox.innerHTML = "";

                emptyBox.style.display = "block";

                subtotalBox.innerHTML = "Rs. 0.00";

                shippingBox.innerHTML = "Rs. 0.00";

                taxBox.innerHTML = "Rs. 0.00";

                totalBox.innerHTML = "Rs. 0.00";

                currentSubtotal = 0;
                currentShipping = 0;
                currentTax = 0;
                currentTotal = 0;

                return;
            }


            emptyBox.style.display = "none";

            itemsBox.innerHTML = "";

            var subtotal = 0;


            for (var i = 0; i < cart.length; i++) {

                var item = cart[i];

                var price = Number(item.price);

                var qty = Number(item.qty);

                var itemTotal = price * qty;

                subtotal += itemTotal;


                itemsBox.innerHTML +=

                    '<div class="order-item">' +

                        '<img src="' +
                        item.image +
                        '" alt="Product">' +

                        '<div class="order-item-info">' +

                            '<h4>' +
                            item.name +
                            '</h4>' +

                            '<p>Price: Rs. ' +
                            price.toFixed(2) +
                            '</p>' +

                            '<p>Quantity: ' +
                            qty +
                            '</p>' +

                        '</div>' +

                        '<strong>Rs. ' +
                        itemTotal.toFixed(2) +
                        '</strong>' +

                    '</div>';
            }


            var shipping = 50;

            var tax = subtotal * 0.05;

            var total =
                subtotal +
                shipping +
                tax;


            currentSubtotal = subtotal;

            currentShipping = shipping;

            currentTax = tax;

            currentTotal = total;


            subtotalBox.innerHTML =
                "Rs. " + subtotal.toFixed(2);

            shippingBox.innerHTML =
                "Rs. " + shipping.toFixed(2);

            taxBox.innerHTML =
                "Rs. " + tax.toFixed(2);

            totalBox.innerHTML =
                "Rs. " + total.toFixed(2);
        }


        function showPayment(method) {

            var onlineBox =
                document.getElementById(
                    "online-payment-box"
                );

            if (!onlineBox) {
                return;
            }


            if (method === "online") {

                onlineBox.style.display = "block";

            } else {

                onlineBox.style.display = "none";
            }
        }


        function placeOrder() {

            var cart =
                JSON.parse(
                    localStorage.getItem("cart") || "[]"
                );


            if (cart.length === 0) {

                alert("Your cart is empty.");

                return;
            }


            var fullName =
                document
                    .getElementById("fullName")
                    .value
                    .trim();


            var email =
                document
                    .getElementById("email")
                    .value
                    .trim();


            var phone =
                document
                    .getElementById("phone")
                    .value
                    .trim();


            var pincode =
                document
                    .getElementById("pincode")
                    .value
                    .trim();


            var address =
                document
                    .getElementById("address")
                    .value
                    .trim();


            var city =
                document
                    .getElementById("city")
                    .value
                    .trim();


            if (
                fullName === "" ||
                email === "" ||
                phone === "" ||
                pincode === "" ||
                address === "" ||
                city === ""
            ) {

                alert(
                    "Please fill all delivery details."
                );

                return;
            }


            var paymentMethod =
                "Cash on Delivery";


            var online =
                document.getElementById("online");


            if (online && online.checked) {

                paymentMethod =
                    "Online Payment";


                var cardNumber =
                    document
                        .getElementById("cardNumber")
                        .value
                        .trim();


                var expiry =
                    document
                        .getElementById("expiry")
                        .value
                        .trim();


                var cvv =
                    document
                        .getElementById("cvv")
                        .value
                        .trim();


                if (
                    cardNumber === "" ||
                    expiry === "" ||
                    cvv === ""
                ) {

                    alert(
                        "Please fill all card details."
                    );

                    return;
                }
            }


            var subtotal = 0;


            for (
                var i = 0;
                i < cart.length;
                i++
            ) {

                var price =
                    Number(cart[i].price);

                var qty =
                    Number(cart[i].qty);

                subtotal +=
                    price * qty;
            }


            var shipping = 50;

            var tax =
                subtotal * 0.05;

            var total =
                subtotal +
                shipping +
                tax;


            var cartJson =
                JSON.stringify(cart);


            var placeButton =
                document.getElementById(
                    "place-order-btn"
                );


            if (placeButton) {

                placeButton.disabled = true;

                placeButton.innerHTML =
                    '<i class="fa fa-spinner fa-spin"></i> Processing...';
            }


            $.ajax({

                type: "POST",

                url: "Checkout.aspx/SaveOrder",

                data: JSON.stringify({

                    fullName: fullName,

                    email: email,

                    phone: phone,

                    pincode: pincode,

                    address: address,

                    city: city,

                    paymentMethod:
                        paymentMethod,

                    subtotal:
                        subtotal,

                    shipping:
                        shipping,

                    tax:
                        tax,

                    total:
                        total,

                    cartJson:
                        cartJson
                }),


                contentType:
                    "application/json; charset=utf-8",


                dataType: "json",


                success:
                    function (response) {

                        var result =
                            response.d;


                        if (
                            result.indexOf(
                                "SUCCESS:"
                            ) === 0
                        ) {

                            var orderId =
                                result.split(":")[1];


                            localStorage.setItem(
                                "cartBackup",
                                JSON.stringify(cart)
                            );


                            localStorage.setItem(
                                "lastOrderId",
                                orderId
                            );


                            localStorage.removeItem(
                                "cart"
                            );


                            alert(
                                "Order placed successfully!\n\n" +
                                "Order ID: " +
                                orderId
                            );


                            if (placeButton) {

                                placeButton.style.display =
                                    "none";
                            }


                            var billButton =
                                document.getElementById(
                                    "download-bill-btn"
                                );


                            if (billButton) {

                                billButton.style.display =
                                    "inline-block";
                            }


                            displayCheckoutCart();

                        } else {

                            if (placeButton) {

                                placeButton.disabled =
                                    false;

                                placeButton.innerHTML =
                                    '<i class="fa fa-check"></i> Place Order';
                            }


                            alert(result);
                        }
                    },


                error:
                    function (xhr) {

                        console.log(
                            xhr.responseText
                        );


                        if (placeButton) {

                            placeButton.disabled =
                                false;

                            placeButton.innerHTML =
                                '<i class="fa fa-check"></i> Place Order';
                        }


                        alert(
                            "Unable to place order.\n\n" +
                            "Please try again."
                        );
                    }

            });
        }


        function downloadBill() {

            var cart =
                JSON.parse(
                    localStorage.getItem(
                        "cartBackup"
                    ) || "[]"
                );


            if (cart.length === 0) {

                alert(
                    "Order information not found."
                );

                return;
            }


            var orderId =
                localStorage.getItem(
                    "lastOrderId"
                ) || "N/A";


            var fullName =
                document
                    .getElementById("fullName")
                    .value
                    .trim();


            var email =
                document
                    .getElementById("email")
                    .value
                    .trim();


            var phone =
                document
                    .getElementById("phone")
                    .value
                    .trim();


            var address =
                document
                    .getElementById("address")
                    .value
                    .trim();


            var city =
                document
                    .getElementById("city")
                    .value
                    .trim();


            var subtotal = 0;


            for (
                var i = 0;
                i < cart.length;
                i++
            ) {

                subtotal +=
                    Number(cart[i].price) *
                    Number(cart[i].qty);
            }


            var shipping = 50;

            var tax =
                subtotal * 0.05;

            var total =
                subtotal +
                shipping +
                tax;


            var jsPDF =
                window.jspdf.jsPDF;


            var doc =
                new jsPDF();


            doc.setFontSize(22);

            doc.text(
                "Cake Ordering System",
                20,
                20
            );


            doc.setFontSize(18);

            doc.text(
                "Order Bill",
                20,
                32
            );


            doc.setFontSize(12);


            doc.text(
                "Order ID: " + orderId,
                20,
                45
            );


            doc.text(
                "Customer: " + fullName,
                20,
                55
            );


            doc.text(
                "Email: " + email,
                20,
                65
            );


            doc.text(
                "Phone: " + phone,
                20,
                75
            );


            doc.text(
                "City: " + city,
                20,
                85
            );


            doc.text(
                "Address: " + address,
                20,
                95
            );


            var y = 115;


            doc.text(
                "Product",
                20,
                y
            );


            doc.text(
                "Qty",
                120,
                y
            );


            doc.text(
                "Price",
                150,
                y
            );


            doc.text(
                "Total",
                180,
                y
            );


            y += 10;


            for (
                var j = 0;
                j < cart.length;
                j++
            ) {

                var item =
                    cart[j];


                var itemTotal =
                    Number(item.price) *
                    Number(item.qty);


                doc.text(
                    item.name.substring(
                        0,
                        35
                    ),
                    20,
                    y
                );


                doc.text(
                    String(item.qty),
                    120,
                    y
                );


                doc.text(
                    "Rs. " +
                    Number(item.price)
                        .toFixed(2),
                    150,
                    y
                );


                doc.text(
                    "Rs. " +
                    itemTotal
                        .toFixed(2),
                    180,
                    y
                );


                y += 10;


                if (y > 260) {

                    doc.addPage();

                    y = 20;
                }
            }


            y += 10;


            doc.line(
                20,
                y,
                195,
                y
            );


            y += 12;


            doc.text(
                "Subtotal: Rs. " +
                subtotal.toFixed(2),
                125,
                y
            );


            y += 8;


            doc.text(
                "Shipping: Rs. " +
                shipping.toFixed(2),
                125,
                y
            );


            y += 8;


            doc.text(
                "Tax: Rs. " +
                tax.toFixed(2),
                125,
                y
            );


            y += 10;


            doc.setFontSize(15);


            doc.text(
                "Grand Total: Rs. " +
                total.toFixed(2),
                115,
                y
            );


            y += 20;


            doc.setFontSize(11);


            doc.text(
                "Thank you for your order!",
                20,
                y
            );


            doc.save(
                "Cake_Order_" +
                orderId +
                ".pdf"
            );
        }


        window.onload =
            function () {

                displayCheckoutCart();

                showPayment("cod");
            };

    </script>

</asp:Content>