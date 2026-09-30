function filterProducts(category) {

    var products = document.getElementsByClassName("product");

    for (var i = 0; i < products.length; i++) {

        if (category === "all") {

            products[i].style.display = "";

        }
        else if (
            products[i].className.indexOf(category) !== -1
        ) {

            products[i].style.display = "";

        }
        else {

            products[i].style.display = "none";

        }
    }
}



function searchProducts() {

    var searchBox = document.getElementById("searchBox");

    if (searchBox === null) {
        return;
    }

    var search = searchBox.value.toLowerCase().trim();

    var products = document.getElementsByClassName("product");

    for (var i = 0; i < products.length; i++) {

        var heading =
            products[i].getElementsByTagName("h3")[0];

        if (heading === null) {
            continue;
        }

        var productName =
            heading.textContent.toLowerCase();

        if (productName.indexOf(search) !== -1) {

            products[i].style.display = "";

        }
        else {

            products[i].style.display = "none";

        }
    }
}



function addToCart(button) {

    if (button === null) {
        return;
    }

    var product = button.parentElement;

    if (product === null) {
        return;
    }


    /* PRODUCT NAME */

    var nameElement =
        product.getElementsByTagName("h3")[0];

    if (nameElement === null) {
        return;
    }

    var name =
        nameElement.textContent.trim();


    /* PRICE */

    var priceElement =
        product.getElementsByClassName("price")[0];

    if (priceElement === null) {
        return;
    }

    var priceText =
        priceElement.textContent;

    var price =
        parseInt(
            priceText.replace("Price: Rs ", ""),
            10
        );


    /* IMAGE */

    var imageElement =
        product.getElementsByTagName("img")[0];

    var image = "";

    if (imageElement !== null) {

        image =
            imageElement.getAttribute("src");

    }


    /* GET CART */

    var cart = [];

    var savedCart =
        localStorage.getItem("cart");

    if (savedCart !== null) {

        try {

            cart = JSON.parse(savedCart);

            if (!Array.isArray(cart)) {

                cart = [];

            }

        }
        catch (e) {

            cart = [];

        }
    }


    /* CHECK EXISTING PRODUCT */

    var found = false;

    for (var i = 0; i < cart.length; i++) {

        if (cart[i].name === name) {

            cart[i].qty =
                Number(cart[i].qty) + 1;

            found = true;

            break;
        }
    }


    /* ADD NEW PRODUCT */

    if (found === false) {

        cart.push({

            name: name,

            price: price,

            image: image,

            qty: 1

        });
    }


    /* SAVE */

    localStorage.setItem(
        "cart",
        JSON.stringify(cart)
    );


    /* UPDATE COUNT */

    updateCartCount();


    alert(
        name + " added to cart!"
    );
}



function updateCartCount() {

    var cart = [];

    var savedCart =
        localStorage.getItem("cart");

    if (savedCart !== null) {

        try {

            cart = JSON.parse(savedCart);

            if (!Array.isArray(cart)) {

                cart = [];

            }

        }
        catch (e) {

            cart = [];

        }
    }


    var count = 0;

    for (var i = 0; i < cart.length; i++) {

        count += Number(cart[i].qty) || 0;

    }


    var cartCount =
        document.getElementById("cart-count");

    if (cartCount !== null) {

        cartCount.textContent =
            count.toString();

    }
}



window.onload = function () {

    updateCartCount();

};