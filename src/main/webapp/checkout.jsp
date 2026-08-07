<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.math.BigDecimal"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="com.tap.model.User"%>
<%@ page import="com.tap.model.Cart"%>
<%@ page import="com.tap.model.CartItem"%>

<%
User user = (User) request.getAttribute("user");
Cart cart = (Cart) request.getAttribute("cart");

Integer deliveryChargeObj =
        (Integer) request.getAttribute("deliveryCharge");

Integer packagingChargeObj =
        (Integer) request.getAttribute("packagingCharge");

BigDecimal deliveryCharge =
        BigDecimal.valueOf(
            deliveryChargeObj != null ? deliveryChargeObj : 40
        );

BigDecimal packagingCharge =
        BigDecimal.valueOf(
            packagingChargeObj != null ? packagingChargeObj : 20
        );

BigDecimal itemsTotal = BigDecimal.ZERO;
BigDecimal gst = BigDecimal.ZERO;
BigDecimal grandTotal = BigDecimal.ZERO;

DecimalFormat df = new DecimalFormat("#,##0.00");
%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>FoodExpress Checkout</title>

<style>

/* =====================================================
   GLOBAL
   ===================================================== */

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: "Segoe UI", sans-serif;
}

body {
    background: #f5f5f5;
    color: #222;
}


/* =====================================================
   NAVBAR
   ===================================================== */

.navbar {
    height: 75px;
    background: #ff6b00;

    display: flex;
    justify-content: space-between;
    align-items: center;

    padding: 0 60px;

    box-shadow: 0 3px 10px rgba(0,0,0,.15);
}

.logo {
    font-size: 30px;
    font-weight: bold;
    color: white;
}

.logo span {
    color: #222;
}

.nav-links {
    display: flex;
    gap: 35px;
}

.nav-links a {
    text-decoration: none;
    color: white;
    font-weight: 600;
}

.nav-links a:hover {
    color: black;
}


/* =====================================================
   MAIN
   ===================================================== */

.container {
    width: 95%;
    max-width: 1400px;
    margin: 35px auto;
}

.heading {
    font-size: 34px;
    font-weight: bold;
    margin-bottom: 30px;
}

.checkout {
    display: grid;
    grid-template-columns: 1.3fr .7fr;
    gap: 30px;
}

.left,
.right {
    background: white;
    padding: 30px;
    border-radius: 20px;

    box-shadow: 0 10px 30px rgba(0,0,0,.08);
}

.card-title {
    font-size: 24px;
    margin-bottom: 25px;
    color: #ff6b00;
}


/* =====================================================
   DELIVERY FORM
   ===================================================== */

.form-group {
    margin-bottom: 18px;
}

.form-group label {
    display: block;
    font-weight: 600;
    margin-bottom: 8px;
}

.form-group input,
.form-group textarea,
.form-group select {
    width: 100%;

    padding: 13px;

    border: 1px solid #ddd;
    border-radius: 10px;

    font-size: 15px;
}

.form-group textarea {
    height: 90px;
    resize: none;
}


/* =====================================================
   PAYMENT OPTIONS
   ===================================================== */

.payment-option {
    display: flex;
    align-items: center;
    gap: 12px;

    padding: 15px;

    border: 1px solid #eee;
    border-radius: 15px;

    margin-bottom: 15px;

    cursor: pointer;

    transition: .3s;
}

.payment-option:hover {
    transform: translateY(-3px);
    box-shadow: 0 5px 15px rgba(0,0,0,.08);
}

.payment-option input {
    width: 18px;
    height: 18px;
}

.payment-option label {
    font-size: 17px;
    font-weight: 600;
    cursor: pointer;
}


/* =====================================================
   ORDER SUMMARY
   ===================================================== */

.order-item {
    display: flex;
    justify-content: space-between;

    padding: 15px 0;

    border-bottom: 1px solid #eee;

    font-size: 16px;
}

.order-name {
    font-weight: 600;
}

.order-price {
    color: #ff6b00;
    font-weight: bold;
}

.bill-details {
    margin-top: 25px;
}

.bill-row {
    display: flex;
    justify-content: space-between;

    margin: 15px 0;

    font-size: 16px;
}

.grand-total {
    display: flex;
    justify-content: space-between;

    font-size: 22px;
    font-weight: bold;

    color: #ff6b00;

    margin-top: 20px;
}


/* =====================================================
   BOTTOM PAYMENT BUTTON
   ===================================================== */

.bottom-pay {
    position: fixed;

    bottom: 25px;
    right: 40px;

    z-index: 500;
}

.continue-payment {
    padding: 16px 35px;

    border: none;
    border-radius: 30px;

    background: #ff6b00;
    color: white;

    font-size: 18px;
    font-weight: bold;

    cursor: pointer;

    box-shadow: 0 5px 20px rgba(0,0,0,.2);
}

.continue-payment:hover {
    background: #e55f00;
}


/* =====================================================
   PAYMENT CONFIRMATION SHEET
   ===================================================== */

.payment-sheet {
    position: fixed;

    left: 0;
    bottom: -100%;

    width: 100%;
    height: 100%;

    background: rgba(0,0,0,.45);

    display: flex;
    align-items: flex-end;

    transition: .4s;

    z-index: 1000;
}

.payment-sheet.active {
    bottom: 0;
}

.sheet-box {
    background: white;

    width: 100%;

    border-radius: 25px 25px 0 0;

    padding: 30px;
}

.sheet-top {
    display: flex;
    justify-content: space-between;
    align-items: center;

    margin-bottom: 25px;
}

.sheet-top h2 {
    font-size: 25px;
}

.sheet-top button {
    border: none;
    background: none;

    font-size: 25px;

    cursor: pointer;
}

.sheet-payment-info {
    background: #f7f7f7;

    padding: 20px;

    border-radius: 15px;
}

.sheet-row {
    display: flex;
    justify-content: space-between;

    font-size: 18px;

    margin-bottom: 15px;
}

.secure-box {
    margin: 20px 0;

    padding: 15px;

    background: #eaf7ea;

    border-radius: 12px;

    text-align: center;
}

.pay-button {
    width: 100%;

    padding: 16px;

    border: none;
    border-radius: 15px;

    background: #ff6b00;
    color: white;

    font-size: 18px;
    font-weight: bold;

    cursor: pointer;
}

.pay-button:hover {
    background: #e55f00;
}


/* =====================================================
   UPI APP SHEET
   ===================================================== */

.upi-sheet {
    position: fixed;

    left: 0;
    bottom: -100%;

    width: 100%;
    height: 100%;

    background: rgba(0,0,0,.55);

    display: flex;
    align-items: flex-end;

    transition: .4s;

    z-index: 3000;
}

.upi-sheet.show {
    bottom: 0;
}

.upi-sheet-box {
    background: white;

    width: 100%;

    border-radius: 30px 30px 0 0;

    padding: 30px 40px 35px;

    max-height: 90vh;

    overflow-y: auto;
}

.upi-header {
    display: flex;

    justify-content: space-between;

    align-items: center;

    margin-bottom: 10px;
}

.upi-header h2 {
    font-size: 26px;
}

.upi-header button {
    border: none;

    background: transparent;

    font-size: 30px;

    cursor: pointer;
}

.upi-sheet-box h3 {
    font-size: 17px;
    margin-top: 5px;
}

.upi-amount {
    color: #ff6b00;

    text-align: center;

    font-size: 34px;

    margin: 15px 0 25px;
}

.upi-select-title {
    text-align: center;

    font-size: 19px;
    font-weight: 600;

    margin-bottom: 20px;
}


/* =====================================================
   UPI APPS
   ===================================================== */

.upi-apps {
    display: flex;

    gap: 25px;

    margin: 20px 0;
}

.upi-app {
    flex: 1;

    min-height: 180px;

    border: 2px solid #e5e5e5;

    padding: 25px 15px;

    border-radius: 18px;

    text-align: center;

    cursor: pointer;

    transition: .3s;

    display: flex;

    flex-direction: column;

    align-items: center;

    justify-content: center;
}

.upi-app:hover {
    transform: translateY(-5px);

    border-color: #ff6b00;

    box-shadow: 0 8px 20px rgba(0,0,0,.12);
}

.upi-app.selected {
    border: 2px solid #ff6b00;

    background: #fff7f0;
}

.upi-app img {
    width: 150px;

    height: 85px;

    object-fit: contain;

    display: block;

    margin: 0 auto 15px;
}

.upi-app span {
    display: block;

    font-size: 18px;
    font-weight: bold;
}

.selected-upi {
    text-align: center;

    margin: 15px 0;

    color: #777;

    font-size: 16px;
}

.pay-now {
    width: 100%;

    padding: 17px;

    background: #ff6b00;

    color: white;

    border: none;

    border-radius: 20px;

    font-size: 18px;

    font-weight: bold;

    cursor: pointer;

    transition: .3s;
}

.pay-now:hover {
    background: #e55f00;
}

/* =====================================================
   REAL QR SCANNER
   ===================================================== */

.scanner-sheet {
    position: fixed;

    left: 0;
    bottom: -100%;

    width: 100%;
    height: 100%;

    background: rgba(0,0,0,.55);

    display: flex;
    align-items: flex-end;

    transition: .4s;

    z-index: 4000;
}

.scanner-sheet.show {
    bottom: 0;
}


/* WHITE SCANNER BOX */

.scanner-box {
    background: white;

    width: 100%;

    border-radius: 30px 30px 0 0;

    padding: 30px;

    text-align: center;

    max-height: 90vh;

    overflow-y: auto;
}


/* SCANNER HEADER */

.scanner-header {
    display: flex;

    justify-content: space-between;

    align-items: center;
}

.scanner-header h2 {
    font-size: 27px;
}

.scanner-header button {
    border: none;

    background: none;

    font-size: 30px;

    cursor: pointer;
}

.scanner-subtitle {
    color: #666;

    font-size: 16px;

    margin-top: 10px;
}

.scanner-amount {
    font-size: 30px;

    font-weight: bold;

    color: #ff6b00;

    margin: 15px 0;
}


/* =====================================================
   REAL QR CONTAINER
   ===================================================== */

.qr-container {
    display: flex;

    justify-content: center;
    align-items: center;

    margin: 20px 0;
}


/*
   IMPORTANT:
   This frame now contains the actual QR image.
*/

.qr-frame {
    width: 250px;
    height: 250px;

    background: white;

    border: 5px solid #111;

    border-radius: 15px;

    padding: 12px;

    display: flex;

    align-items: center;
    justify-content: center;

    box-shadow: 0 8px 25px rgba(0,0,0,.12);
}


/* REAL QR IMAGE */

.real-qr {
    width: 100%;
    height: 100%;

    display: block;

    object-fit: contain;

    border-radius: 4px;
}


/* SCAN TEXT */

.scan-text {
    font-size: 16px;

    color: #555;

    margin: 10px 0 15px;
}


/* SELECTED APP */

.scanner-app {
    display: inline-block;

    background: #fff4eb;

    color: #ff6b00;

    padding: 10px 25px;

    border-radius: 25px;

    font-weight: bold;

    margin-bottom: 20px;
}


/* =====================================================
   SUCCESS BOX
   ===================================================== */

.success-box {
    position: fixed;

    top: 0;
    left: 0;

    width: 100%;
    height: 100%;

    background: rgba(0,0,0,.5);

    display: none;

    justify-content: center;
    align-items: center;

    z-index: 5000;
}

.success-box.show {
    display: flex;
}

.success-card {
    background: white;

    padding: 40px;

    border-radius: 25px;

    text-align: center;

    width: 350px;

    animation: popup .4s ease;
}

.success-icon {
    width: 70px;
    height: 70px;

    background: #2ecc71;

    color: white;

    font-size: 45px;

    border-radius: 50%;

    margin: auto;

    display: flex;

    align-items: center;
    justify-content: center;
}

.success-card h2 {
    margin: 20px 0;
}

.success-card p {
    color: #555;
}

.success-card button {
    margin-top: 20px;

    padding: 14px 25px;

    border: none;

    background: #ff6b00;

    color: white;

    border-radius: 25px;

    cursor: pointer;

    font-size: 16px;
}

.success-card button:hover {
    background: #e55f00;
}

@keyframes popup {

    from {
        transform: scale(.5);
        opacity: 0;
    }

    to {
        transform: scale(1);
        opacity: 1;
    }
}


/* =====================================================
   FOOTER
   ===================================================== */

/* =====================================================
   FOOTER
   ===================================================== */

.footer {
    background: #222;
    color: white;

    margin-top: 60px;
    padding: 45px 7% 25px;

    display: grid;
    grid-template-columns: 1.2fr 1fr 1fr 1fr;

    gap: 50px;
}

.footer-column h3 {
    color: #ff6b00;

    font-size: 20px;

    margin-bottom: 18px;
}

.footer-column p {
    color: #ddd;

    line-height: 1.6;

    max-width: 280px;
}

.footer-column a {
    display: block;

    color: #ddd;

    text-decoration: none;

    margin-bottom: 13px;

    font-size: 16px;

    transition: .3s;
}

.footer-column a:hover {
    color: #ff6b00;

    transform: translateX(4px);
}

.social-links {
    display: flex;

    align-items: center;

    gap: 18px;
}

.social-links a {
    display: inline-flex;

    align-items: center;
    justify-content: center;

    width: 40px;
    height: 40px;

    background: #333;

    border-radius: 50%;

    font-size: 20px;

    text-decoration: none;

    margin: 0;

    transition: .3s;
}

.social-links a:hover {
    background: #ff6b00;

    transform: translateY(-3px);
}


/* COPYRIGHT */

.copyright {
    background: #222;

    color: #bbb;

    text-align: center;

    border-top: 1px solid #555;

    padding: 20px 20px;

    font-size: 14px;
}


/* =====================================================
   FOOTER RESPONSIVE
   ===================================================== */

@media(max-width:900px) {

    .footer {
        grid-template-columns: 1fr 1fr;

        gap: 35px;
    }

}


@media(max-width:600px) {

    .footer {
        grid-template-columns: 1fr;

        padding: 35px 25px 20px;
    }

}
/* =====================================================
   ANIMATION
   ===================================================== */

.left,
.right {
    animation: slideUp .5s ease;
}

@keyframes slideUp {

    from {
        opacity: 0;
        transform: translateY(30px);
    }

    to {
        opacity: 1;
        transform: translateY(0);
    }
}

.payment-sheet.active .sheet-box {
    animation: sheetMove .4s ease;
}

@keyframes sheetMove {

    from {
        transform: translateY(100%);
    }

    to {
        transform: translateY(0);
    }
}


/* =====================================================
   RESPONSIVE
   ===================================================== */

@media(max-width:900px) {

    .checkout {
        grid-template-columns: 1fr;
    }

    .navbar {
        padding: 0 20px;
    }

    .footer-container {
        grid-template-columns: 1fr 1fr;
    }
}


@media(max-width:700px) {

    .upi-apps {
        flex-direction: column;
        gap: 15px;
    }

    .continue-payment {
        width: 100%;
    }

    .bottom-pay {
        left: 20px;
        right: 20px;
    }

    .footer-container {
        grid-template-columns: 1fr;
    }

    .qr-frame {
        width: 210px;
        height: 210px;
    }

    .scanner-box {
        padding: 25px 20px;
    }

    .scanner-amount {
        font-size: 26px;
    }

}



/* =====================================================
   CARD PAYMENT SHEET
   ===================================================== */

.card-sheet {
    position: fixed;
    left: 0;
    bottom: -100%;
    width: 100%;
    height: 100%;
    background: rgba(0,0,0,.55);

    display: flex;
    align-items: flex-end;

    transition: .4s;
    z-index: 3500;
}

.card-sheet.show {
    bottom: 0;
}

.card-sheet-box {
    background: white;
    width: 100%;

    border-radius: 30px 30px 0 0;

    padding: 30px 40px 35px;

    max-height: 90vh;
    overflow-y: auto;
}

.card-header {
    display: flex;
    justify-content: space-between;
    align-items: center;

    margin-bottom: 20px;
}

.card-header h2 {
    font-size: 26px;
}

.card-header button {
    border: none;
    background: transparent;

    font-size: 30px;
    cursor: pointer;
}

.card-amount {
    text-align: center;

    font-size: 30px;
    font-weight: bold;

    color: #ff6b00;

    margin: 15px 0 25px;
}

.card-form {
    max-width: 700px;
    margin: auto;
}

.card-form-group {
    margin-bottom: 18px;
}

.card-form-group label {
    display: block;

    font-weight: 600;

    margin-bottom: 8px;
}

.card-form-group input {
    width: 100%;

    padding: 14px;

    border: 1px solid #ddd;
    border-radius: 10px;

    font-size: 16px;

    outline: none;
}

.card-form-group input:focus {
    border-color: #ff6b00;

    box-shadow: 0 0 0 3px rgba(255,107,0,.1);
}

.card-row {
    display: grid;

    grid-template-columns: 1fr 1fr;

    gap: 20px;
}

.card-security {
    background: #eaf7ea;

    padding: 14px;

    border-radius: 12px;

    text-align: center;

    color: #287a3e;

    margin: 20px 0;
}

.card-pay-button {
    width: 100%;

    padding: 17px;

    background: #ff6b00;

    color: white;

    border: none;

    border-radius: 20px;

    font-size: 18px;

    font-weight: bold;

    cursor: pointer;
}

.card-pay-button:hover {
    background: #e55f00;
}

@media(max-width:700px) {

    .card-sheet-box {
        padding: 25px 20px 30px;
    }

    .card-row {
        grid-template-columns: 1fr;
        gap: 0;
    }
}
</style>

</head>

<body>

<!-- =====================================================
     NAVBAR
     ===================================================== -->

<div class="navbar">

    <div class="logo">
        🍔 Food<span>Express</span>
    </div>

    <div class="nav-links">

        <a href="${pageContext.request.contextPath}/restuarant">
            Restaurants
        </a>

        <a href="${pageContext.request.contextPath}/CartServlet">
            Cart
        </a>

        <a href="#">
            Profile
        </a>

    </div>

</div>


<!-- =====================================================
     MAIN CONTAINER
     ===================================================== -->

<div class="container">

    <h1 class="heading">
        Checkout
    </h1>


    <div class="checkout">


        <!-- =================================================
             LEFT SIDE - DELIVERY DETAILS
             ================================================= -->

        <div class="left">

            <h2 class="card-title">
                Delivery Details
            </h2>


            <form>

                <div class="form-group">

                    <label>
                        Full Name
                    </label>

                    <input
                        type="text"
                        value="<%=user != null ? user.getUsername() : ""%>"
                        placeholder="Enter your name">

                </div>


                <div class="form-group">

                    <label>
                        Mobile Number
                    </label>

                    <input
                        type="text"
                        placeholder="Enter mobile number">

                </div>


                <div class="form-group">

                    <label>
                        Email
                    </label>

                    <input
                        type="email"
                        value="<%=user != null ? user.getEmail() : ""%>"
                        placeholder="Enter email">

                </div>


                <div class="form-group">

                    <label>
                        Address
                    </label>

                    <textarea
                        placeholder="House No, Street, Area"></textarea>

                </div>


                <div class="form-group">

                    <label>
                        City
                    </label>

                    <input
                        type="text"
                        placeholder="Enter city">

                </div>


                <div class="form-group">

                    <label>
                        State
                    </label>

                    <select>

                        <option>
                            Select State
                        </option>

                        <option>
                            Karnataka
                        </option>

                        <option>
                            Telangana
                        </option>

                        <option>
                            Andhra Pradesh
                        </option>

                        <option>
                            Tamil Nadu
                        </option>

                        <option>
                            Kerala
                        </option>

                    </select>

                </div>


                <div class="form-group">

                    <label>
                        Pincode
                    </label>

                    <input
                        type="text"
                        placeholder="Enter pincode">

                </div>


                <div class="form-group">

                    <label>
                        Delivery Instructions
                    </label>

                    <textarea
                        placeholder="Call before delivery"></textarea>

                </div>

            </form>

        </div>


        <!-- =================================================
             RIGHT SIDE
             ================================================= -->

        <div class="right">


            <!-- PAYMENT METHODS -->

            <h2 class="card-title">
                Payment Methods
            </h2>


            <div class="payment-option">

                <input
                    type="radio"
                    name="payment"
                    value="UPI"
                    checked>

                <label>
                    📱 UPI Payment
                </label>

            </div>


            <div class="payment-option">

                <input
                    type="radio"
                    name="payment"
                    value="CARD">

                <label>
                    💳 Credit / Debit Card
                </label>

            </div>


            <div class="payment-option">

                <input
                    type="radio"
                    name="payment"
                    value="COD">

                <label>
                    💵 Cash On Delivery
                </label>

            </div>


            <!-- =================================================
                 ORDER SUMMARY
                 ================================================= -->

            <div class="summary-section">

                <h2 class="card-title">
                    Order Summary
                </h2>


                <%

                if(cart != null && cart.getItems() != null) {

                    for(CartItem item : cart.getItems().values()) {

                        BigDecimal itemPrice = item.getPrice();

                        if(itemPrice == null) {
                            itemPrice = BigDecimal.ZERO;
                        }

                        BigDecimal itemQuantity =
                            BigDecimal.valueOf(item.getQty());

                        BigDecimal itemTotal =
                            itemPrice.multiply(itemQuantity);

                        itemsTotal =
                            itemsTotal.add(itemTotal);

                %>


                <div class="order-item">

                    <div class="order-name">
                        <%=item.getName()%>
                    </div>

                    <div class="order-price">
                        ₹ <%=df.format(itemTotal)%>
                    </div>

                </div>


                <%

                    }

                }

                gst =
                    itemsTotal.multiply(
                        BigDecimal.valueOf(0.05)
                    );

                grandTotal =
                    itemsTotal
                        .add(deliveryCharge)
                        .add(packagingCharge)
                        .add(gst);

                %>


                <div class="bill-details">


                    <div class="bill-row">

                        <span>
                            Item Total
                        </span>

                        <span>
                            ₹ <%=df.format(itemsTotal)%>
                        </span>

                    </div>


                    <div class="bill-row">

                        <span>
                            Delivery Charge
                        </span>

                        <span>
                            ₹ <%=df.format(deliveryCharge)%>
                        </span>

                    </div>


                    <div class="bill-row">

                        <span>
                            Packaging Charge
                        </span>

                        <span>
                            ₹ <%=df.format(packagingCharge)%>
                        </span>

                    </div>


                    <div class="bill-row">

                        <span>
                            GST (5%)
                        </span>

                        <span>
                            ₹ <%=df.format(gst)%>
                        </span>

                    </div>


                    <hr>


                    <div class="grand-total">

                        <span>
                            Total Amount
                        </span>

                        <strong>
                            ₹ <%=df.format(grandTotal)%>
                        </strong>

                    </div>

                </div>

            </div>

        </div>

    </div>

</div>

<!-- =====================================================
     CONTINUE PAYMENT BUTTON
     ===================================================== -->

<div class="bottom-pay">

    <button
        class="continue-payment"
        onclick="openPaymentSheet()">

        Continue Payment

    </button>

</div>


<!-- =====================================================
     PAYMENT CONFIRMATION SHEET
     ===================================================== -->

<div
    class="payment-sheet"
    id="paymentSheet">

    <div class="sheet-box">


        <div class="sheet-top">

            <h2>
                Confirm Payment
            </h2>

            <button
                onclick="closePaymentSheet()">

                ✕

            </button>

        </div>


        <div class="sheet-payment-info">

            <div class="sheet-row">

                <span>
                    Payment Method
                </span>

                <strong id="paymentName">
                    UPI Payment
                </strong>

            </div>


            <div class="sheet-row">

                <span>
                    Amount Payable
                </span>

                <strong>
                    ₹ <%=df.format(grandTotal)%>
                </strong>

            </div>

        </div>


        <div class="secure-box">

            🔒 Your payment is 100% secure

        </div>


        <button
            class="pay-button"
            onclick="placeOrder()">

            Place Order

        </button>

    </div>

</div>


<!-- =====================================================
     UPI APPLICATION SELECTION
     ===================================================== -->

<div
    class="upi-sheet"
    id="upiSheet">

    <div class="upi-sheet-box">


        <div class="upi-header">

            <h2>
                📱 Pay Using UPI
            </h2>

            <button
                onclick="closeUPISheet()">

                ✕

            </button>

        </div>


        <h3>
            Amount Payable
        </h3>


        <h1 class="upi-amount">

            ₹ <%=df.format(grandTotal)%>

        </h1>


        <p class="upi-select-title">

            Select your UPI App

        </p>


        <div class="upi-apps">


            <!-- GOOGLE PAY -->

            <div
                class="upi-app"
                onclick="selectUPI('Google Pay', this)">

                <img
                    src="${pageContext.request.contextPath}/payements/gpay.png"
                    alt="Google Pay">

                <span>
                    Google Pay
                </span>

            </div>


            <!-- PHONEPE -->

            <div
                class="upi-app"
                onclick="selectUPI('PhonePe', this)">

                <img
                    src="${pageContext.request.contextPath}/payements/phonepe.png"
                    alt="PhonePe">

                <span>
                    PhonePe
                </span>

            </div>


            <!-- PAYTM -->

            <div
                class="upi-app"
                onclick="selectUPI('Paytm', this)">

                <img
                    src="${pageContext.request.contextPath}/payements/paytm.png"
                    alt="Paytm">

                <span>
                    Paytm
                </span>

            </div>


        </div>


        <p
            id="selectedUPI"
            class="selected-upi">

            Select a UPI app to continue

        </p>


        <button
            class="pay-now"
            onclick="openScanner()">

            Continue to Pay

        </button>


    </div>

</div>

<!-- =====================================================
     REAL UPI QR CODE SCANNER
     ===================================================== -->

<div
    class="scanner-sheet"
    id="scannerSheet">

    <div class="scanner-box">


        <!-- HEADER -->

        <div class="scanner-header">

            <h2>
                Scan & Pay
            </h2>

            <button
                onclick="closeScanner()">

                ✕

            </button>

        </div>


        <!-- SUBTITLE -->

        <p class="scanner-subtitle">

            Scan this QR code using your UPI app

        </p>


        <!-- AMOUNT -->

        <div class="scanner-amount">

            ₹ <%=df.format(grandTotal)%>

        </div>


        <!-- =================================================
             REAL UPI QR CODE
             ================================================= -->

        <div class="qr-container">

            <div class="qr-frame">

    <img
        src="${pageContext.request.contextPath}/https_foodexpress_demo.png"
        alt="UPI Payment QR Code"
        class="real-qr">

</div>

        </div>


        <!-- INSTRUCTION -->

        <p class="scan-text">

            Open your UPI app and scan the QR code

        </p>


        <!-- SELECTED APP -->

        <div class="scanner-app">

            <span id="scannerUPIName">

                UPI Payment

            </span>

        </div>


        <!-- PAY BUTTON -->

        <button
            class="pay-now"
            onclick="completeUPIPayment()">

            Pay Now ₹ <%=df.format(grandTotal)%>

        </button>


    </div>

</div>


<!-- =====================================================
     CREDIT / DEBIT CARD PAYMENT
     ===================================================== -->

<div
    class="card-sheet"
    id="cardSheet">

    <div class="card-sheet-box">

        <!-- HEADER -->

        <div class="card-header">

            <h2>
                💳 Card Payment
            </h2>

            <button
                type="button"
                onclick="closeCardSheet()">

                ✕

            </button>

        </div>


        <!-- AMOUNT -->

        <div class="card-amount">

            ₹ <%=df.format(grandTotal)%>

        </div>


        <!-- CARD FORM -->

        <div class="card-form">


            <div class="card-form-group">

                <label>
                    Cardholder Name
                </label>

                <input
                    type="text"
                    id="cardHolderName"
                    placeholder="Enter name on card"
                    autocomplete="cc-name">

            </div>


            <div class="card-form-group">

                <label>
                    Card Number
                </label>

                <input
                    type="text"
                    id="cardNumber"
                    placeholder="1234 5678 9012 3456"
                    maxlength="19"
                    inputmode="numeric"
                    autocomplete="cc-number"
                    oninput="formatCardNumber(this)">

            </div>


            <div class="card-row">


                <div class="card-form-group">

                    <label>
                        Expiry Date
                    </label>

                    <input
                        type="text"
                        id="expiryDate"
                        placeholder="MM/YY"
                        maxlength="5"
                        inputmode="numeric"
                        autocomplete="cc-exp"
                        oninput="formatExpiry(this)">

                </div>


                <div class="card-form-group">

                    <label>
                        CVV
                    </label>

                    <input
                        type="password"
                        id="cvv"
                        placeholder="123"
                        maxlength="3"
                        inputmode="numeric"
                        autocomplete="cc-csc">

                </div>

            </div>


            <div class="card-security">

                🔒 Your card details are securely processed

            </div>


            <button
                type="button"
                class="card-pay-button"
                onclick="payWithCard()">

                Pay ₹ <%=df.format(grandTotal)%>

            </button>

        </div>

    </div>

</div>

<!-- =====================================================
     SUCCESS MESSAGE
     ===================================================== -->

<div
    class="success-box"
    id="successBox">

    <div class="success-card">

        <div class="success-icon">
            ✓
        </div>


        <h2>
            Order Placed Successfully
        </h2>


        <p>
            Your delicious food is being prepared 🍔
        </p>


        <button
            onclick="window.location.href='${pageContext.request.contextPath}/restuarant'">

            Continue Ordering

        </button>

    </div>

</div>


<!-- =====================================================
     FOOTER
     ===================================================== -->

<!-- ================= FOOTER ================= -->

<div class="footer">

    <div class="footer-column">

        <h3>🍔 FoodExpress</h3>

        <p>
            Your favourite food delivered fast and fresh.
        </p>

    </div>


    <!-- QUICK LINKS -->

    <div class="footer-column">

        <h3>Quick Links</h3>

        <a href="${pageContext.request.contextPath}/restuarant">
            Home
        </a>

        <a href="${pageContext.request.contextPath}/restuarant">
            Restaurants
        </a>

        <a href="${pageContext.request.contextPath}/offers.jsp">
            Offers
        </a>

        <a href="${pageContext.request.contextPath}/help.jsp">
            Help
        </a>

    </div>


    <!-- CUSTOMER SUPPORT -->

    <div class="footer-column">

        <h3>Customer Support</h3>

        <a href="${pageContext.request.contextPath}/contact.jsp">
            Contact Us
        </a>

        <a href="${pageContext.request.contextPath}/privacy.jsp">
            Privacy Policy
        </a>

        <a href="${pageContext.request.contextPath}/terms.jsp">
            Terms & Conditions
        </a>

    </div>


    <!-- SOCIAL MEDIA -->

    <div class="footer-column">

        <h3>Follow Us</h3>

        <div class="social-links">

            <a href="https://www.linkedin.com/" target="_blank">
                💼
            </a>

            <a href="https://www.instagram.com/" target="_blank">
                📷
            </a>

            <a href="https://www.facebook.com/" target="_blank">
                📘
            </a>

            <a href="https://www.youtube.com/" target="_blank">
                ▶️
            </a>

        </div>

    </div>

</div>


<!-- COPYRIGHT -->

<div class="copyright">

    © 2026 FoodExpress. All Rights Reserved.

</div>




<form
    id="placeOrderForm"
    method="post"
    action="${pageContext.request.contextPath}/PlaceOrderServlet">

    <input
        type="hidden"
        name="paymentmethod"
        id="selectedPaymentMethod">

</form>

<script>

/* =====================================================
   PAYMENT CONFIRMATION SHEET
   ===================================================== */

function openPaymentSheet() {

    document
        .getElementById("paymentSheet")
        .classList
        .add("active");

}


function closePaymentSheet() {

    document
        .getElementById("paymentSheet")
        .classList
        .remove("active");

}


/* =====================================================
   PAYMENT METHOD SELECTION
   ===================================================== */

let paymentOptions =
    document.querySelectorAll(
        'input[name="payment"]'
    );


paymentOptions.forEach(function(option) {

    option.addEventListener("change", function() {

        let paymentText = "";

        if(this.value === "UPI") {

            paymentText = "UPI Payment";

        }

        else if(this.value === "CARD") {

            paymentText = "Credit / Debit Card";

        }

        else if(this.value === "COD") {

            paymentText = "Cash On Delivery";

        }


        document
            .getElementById("paymentName")
            .innerHTML = paymentText;

    });

});



/* =====================================================
   PLACE ORDER
   ===================================================== */

   function placeOrder() {

	    let selected =
	        document.querySelector(
	            'input[name="payment"]:checked'
	        );

	    if(selected == null) {

	        alert("Please select payment method");

	        return;
	    }

	    closePaymentSheet();


	    // ==============================
	    // UPI
	    // ==============================

	    if(selected.value === "UPI") {

	        document
	            .getElementById("upiSheet")
	            .classList
	            .add("show");

	    }


	    // ==============================
	    // CARD
	    // ==============================

	    else if(selected.value === "CARD") {

	        document
	            .getElementById("cardSheet")
	            .classList
	            .add("show");

	    }


	    // ==============================
	    // CASH ON DELIVERY
	    // ==============================

	    else if(selected.value === "COD") {

	        submitOrder("CASH");

	    }

	}
	
   /* =====================================================
   CARD PAYMENT
   ===================================================== */

function closeCardSheet() {

    document
        .getElementById("cardSheet")
        .classList
        .remove("show");

}


/* =====================================================
   FORMAT CARD NUMBER
   ===================================================== */

function formatCardNumber(input) {

    let value = input.value.replace(/\D/g, "");

    value = value.substring(0, 16);

    let formatted = value.match(/.{1,4}/g);

    input.value =
        formatted
            ? formatted.join(" ")
            : "";

}


/* =====================================================
   FORMAT EXPIRY DATE
   ===================================================== */

function formatExpiry(input) {

    let value =
        input.value.replace(/\D/g, "");

    value = value.substring(0, 4);

    if(value.length >= 3) {

        value =
            value.substring(0, 2)
            + "/"
            + value.substring(2);

    }

    input.value = value;

}


/* =====================================================
   PAY USING CARD
   ===================================================== */

   function payWithCard() {

	    let cardHolder =
	        document
	            .getElementById("cardHolderName")
	            .value
	            .trim();


	    let cardNumber =
	        document
	            .getElementById("cardNumber")
	            .value
	            .replace(/\s/g, "");


	    let expiry =
	        document
	            .getElementById("expiryDate")
	            .value
	            .trim();


	    let cvv =
	        document
	            .getElementById("cvv")
	            .value
	            .trim();


	    if(cardHolder === "") {

	        alert("Please enter cardholder name");

	        return;

	    }


	    if(cardNumber.length !== 16) {

	        alert("Please enter a valid 16-digit card number");

	        return;

	    }


	    if(!/^(0[1-9]|1[0-2])\/\d{2}$/.test(expiry)) {

	        alert("Please enter expiry date in MM/YY format");

	        return;

	    }


	    if(!/^\d{3}$/.test(cvv)) {

	        alert("Please enter a valid 3-digit CVV");

	        return;

	    }


	    closeCardSheet();


	    // IMPORTANT
	    submitOrder("CARD");

	}
/* =====================================================
   SELECTED UPI APP
   ===================================================== */

let selectedUPI = "";


function selectUPI(appName, element) {

    selectedUPI = appName;


    /*
       Display selected app
    */

    document
        .getElementById("selectedUPI")
        .innerHTML =
        "Selected: <strong>"
        + appName
        + "</strong>";


    /*
       Display selected app
       inside scanner
    */

    document
        .getElementById("scannerUPIName")
        .innerHTML = appName;


    /*
       Remove old selection
    */

    document
        .querySelectorAll(".upi-app")
        .forEach(function(app) {

            app.classList.remove("selected");

        });


    /*
       Highlight selected app
    */

    element.classList.add("selected");

}


/* =====================================================
   CLOSE UPI SHEET
   ===================================================== */

function closeUPISheet() {

    document
        .getElementById("upiSheet")
        .classList
        .remove("show");

}


/* =====================================================
   OPEN REAL QR SCANNER
   ===================================================== */

function openScanner() {

    if(selectedUPI === "") {

        alert("Please select a UPI app first.");

        return;

    }


    /*
       Close UPI application selection
    */

    document
        .getElementById("upiSheet")
        .classList
        .remove("show");


    /*
       Open real QR scanner
    */

    document
        .getElementById("scannerSheet")
        .classList
        .add("show");

}


/* =====================================================
   CLOSE SCANNER
   ===================================================== */

function closeScanner() {

    document
        .getElementById("scannerSheet")
        .classList
        .remove("show");

}


/* =====================================================
   COMPLETE UPI PAYMENT
   ===================================================== */

   function completeUPIPayment() {

	    if(selectedUPI === "") {

	        alert("Please select a UPI app first.");

	        return;
	    }


	    document
	        .getElementById("scannerSheet")
	        .classList
	        .remove("show");


	    submitOrder("UPI");

	}

function submitOrder(paymentMethod) {

    document
        .getElementById("selectedPaymentMethod")
        .value = paymentMethod;


    document
        .getElementById("placeOrderForm")
        .submit();

}

</script>

</body>

</html>