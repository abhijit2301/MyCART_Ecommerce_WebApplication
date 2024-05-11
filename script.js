/* global oldProduct */

function add_to_cart(pid, pname, price) {
    let cart = localStorage.getItem("cart");

    if (cart == null) {
        // no cart yet
        let products = [];
        let product = { productId: pid, productName: pname, productQuantity: 1, productPrice: price };
        products.push(product);
        localStorage.setItem("cart", JSON.stringify(products));
        currentProduct = product;
        showToast("Item is added to cart");
    } else {
        // cart is already present
        let pcart = JSON.parse(cart);

        let oldProductIndex = pcart.findIndex((item) => item.productId == pid);

        if (oldProductIndex !== -1) {
            // product is already in the cart, increase the quantity
            pcart[oldProductIndex].productQuantity++;
            localStorage.setItem("cart", JSON.stringify(pcart));
            currentProduct = pcart[oldProductIndex];
            showToast(currentProduct.productName + " Product Quantity is increased to Quantity = " + currentProduct.productQuantity);
                

        } else {
            // product is not in the cart, add it
            let product = { productId: pid, productName: pname, productQuantity: 1, productPrice: price };
            pcart.push(product);
            localStorage.setItem("cart", JSON.stringify(pcart));
            currentProduct = product;
            showToast("Product is added to cart");
        }
    }
    updateCart();
}


// update cart

function updateCart() {
    let cartString = localStorage.getItem("cart");
    let cart = JSON.parse(cartString);
    if (cart == null || cart.length == 0) {
        console.log("Cart is empty !!!");
        $(".cart-items").html("(0)");
        $(".cart-body").html("<h3>Cart does not have any items </h3>");
        $(".checkout-btn").attr("disabled", true);
    } else {
        // there is something in the cart to show
        console.log(cart);
        $(".cart-items").html(`(${cart.length})`);
        let table = `
            <table class='table'>
                <thead class='thead-light'>
                    <tr>
                        <th>Item Name </th>
                        <th>Price </th>
                        <th>Quantity </th>
                        <th>Total Price </th>
                        <th>Action </th>
                    </tr>
                </thead>
                <tbody>`;
        let totalPrice = 0;
        cart.forEach((item) => {
            table += `
                <tr>
                    <td>${item.productName}</td>
                    <td><b>&#x20B9</b>${item.productPrice}/-</td>
                    <td>
                        <button onclick='decreaseQuantity(${item.productId})' class='btn btn-secondary btn-sm mr'>-</button>
                        ${item.productQuantity}
                        <button onclick='increaseQuantity(${item.productId})' class='btn btn-secondary btn-sm ml'>+</button>
                    </td>
                    <td>${item.productQuantity * item.productPrice}</td>
                    <td><button onclick='deleteItemFromCart(${item.productId})' class='btn btn-danger btn-sm'>Remove</button></td>
                </tr>`;

            totalPrice += item.productQuantity * item.productPrice;
        });

        table += `
        </tbody>
        <tr><td colspan='5' class="text-right font-weight-bold m-5">Total Amount  : <b>&#x20B9 </b>${totalPrice}/-</td></tr>
        </table>`;
        $(".cart-body").html(table);
        $(".checkout-btn").attr("disabled", false);
    }
}

function increaseQuantity(pid) {
    let cart = JSON.parse(localStorage.getItem('cart'));
    let productIndex = cart.findIndex((item) => item.productId == pid);

    if (productIndex !== -1) {
        cart[productIndex].productQuantity++;
        localStorage.setItem('cart', JSON.stringify(cart));
        updateCart();
    }
}

function decreaseQuantity(pid) {
    let cart = JSON.parse(localStorage.getItem('cart'));
    let productIndex = cart.findIndex((item) => item.productId == pid);

    if (productIndex !== -1 && cart[productIndex].productQuantity > 1) {
        cart[productIndex].productQuantity--;
        localStorage.setItem('cart', JSON.stringify(cart));
        updateCart();
    }
}

function deleteItemFromCart(pid) {
    let cart = JSON.parse(localStorage.getItem('cart'));
    let newcart = cart.filter((item) => item.productId != pid);
    localStorage.setItem('cart', JSON.stringify(newcart));
    updateCart();
    showToast("Item is removed from cart");
}

function showToast(content) {
    let toastElement = $("#toast");
    toastElement.addClass("display");
    toastElement.html(content);
    setTimeout(() => {
        toastElement.removeClass("display");
    }, 2000);
}

$(document).ready(function () {
    updateCart();
});

/*live date and time*/
function updateDateTime() {
            let now = new Date();
            let options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric', hour: 'numeric', minute: 'numeric', second: 'numeric', hour12: true };
            let formattedDateTime = now.toLocaleDateString('en-US', options);

            document.getElementById('datetime').innerText = formattedDateTime;
        }

        // Update date and time every second
        setInterval(updateDateTime, 1000);

        // Initial update
        updateDateTime();
        
/*date and time code ends*/

function goToCheckout(){
    window.location="checkout.jsp";
}