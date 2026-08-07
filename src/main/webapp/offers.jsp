<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>Offers - FoodExpress</title>

<style>

* {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
    font-family: "Segoe UI", Arial, sans-serif;
}

body {
    background: #f7f7f7;
    color: #222;
}

/* NAVBAR */

.navbar {
    height: 75px;
    background: #ff6b00;

    display: flex;
    align-items: center;
    justify-content: space-between;

    padding: 0 60px;

    color: white;
}

.logo {
    font-size: 28px;
    font-weight: bold;
}

.nav-links {
    display: flex;
    gap: 28px;
}

.nav-links a {
    color: white;
    text-decoration: none;
    font-weight: 600;
}

.nav-links a:hover {
    text-decoration: underline;
}

/* MAIN */

.container {
    width: 90%;
    max-width: 1100px;

    margin: 45px auto;
}

.page-title {
    text-align: center;
    font-size: 36px;
    margin-bottom: 10px;
}

.subtitle {
    text-align: center;
    color: #777;
    margin-bottom: 35px;
}

/* OFFERS */

.offers-grid {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 25px;
}

.offer-card {
    background: white;

    border-radius: 18px;

    padding: 28px;

    box-shadow: 0 8px 25px rgba(0,0,0,.08);

    transition: .3s;
}

.offer-card:hover {
    transform: translateY(-6px);
}

.offer-icon {
    font-size: 45px;
    margin-bottom: 15px;
}

.offer-card h2 {
    color: #ff6b00;
    margin-bottom: 10px;
}

.offer-card p {
    color: #666;
    line-height: 1.6;
}

.coupon {
    margin-top: 20px;

    background: #fff4e8;

    color: #ff6b00;

    padding: 12px;

    border-radius: 10px;

    font-weight: bold;

    text-align: center;
}

/* BUTTON */

.btn {
    display: block;

    width: fit-content;

    margin: 35px auto 0;

    padding: 14px 28px;

    background: #ff6b00;

    color: white;

    text-decoration: none;

    border-radius: 25px;

    font-weight: bold;
}

.btn:hover {
    background: #e85f00;
}

/* FOOTER */

.footer {
    background: #222;

    color: white;

    margin-top: 60px;

    padding: 45px 7%;
}

.footer-container {
    display: grid;

    grid-template-columns:
        repeat(4, 1fr);

    gap: 40px;
}

.footer-column h3 {
    color: #ff6b00;

    margin-bottom: 18px;
}

.footer-column p,
.footer-column a {
    display: block;

    color: #ddd;

    text-decoration: none;

    margin-bottom: 12px;

    line-height: 1.5;
}

.footer-column a:hover {
    color: #ff6b00;
}

.copyright {
    border-top: 1px solid #444;

    margin-top: 35px;

    padding-top: 20px;

    text-align: center;

    color: #bbb;
}

@media(max-width:800px) {

    .navbar {
        padding: 0 20px;
    }

    .nav-links {
        gap: 12px;
    }

    .offers-grid {
        grid-template-columns: 1fr;
    }

    .footer-container {
        grid-template-columns: 1fr 1fr;
    }
}

@media(max-width:500px) {

    .logo {
        font-size: 22px;
    }

    .nav-links {
        display: none;
    }

    .footer-container {
        grid-template-columns: 1fr;
    }
}

</style>

</head>

<body>

<!-- NAVBAR -->

<div class="navbar">

    <div class="logo">
        🍔 FoodExpress
    </div>

    <div class="nav-links">

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

</div>


<!-- CONTENT -->

<div class="container">

    <h1 class="page-title">
        🎁 Special Offers
    </h1>

    <p class="subtitle">
        Enjoy delicious food with amazing discounts!
    </p>


    <div class="offers-grid">


        <div class="offer-card">

            <div class="offer-icon">
                🍔
            </div>

            <h2>
                20% OFF
            </h2>

            <p>
                Get 20% off on your first order.
                Order your favourite food today!
            </p>

            <div class="coupon">
                Code: FIRST20
            </div>

        </div>


        <div class="offer-card">

            <div class="offer-icon">
                🍕
            </div>

            <h2>
                ₹100 OFF
            </h2>

            <p>
                Get ₹100 discount on orders above ₹499.
            </p>

            <div class="coupon">
                Code: SAVE100
            </div>

        </div>


        <div class="offer-card">

            <div class="offer-icon">
                🚴
            </div>

            <h2>
                Free Delivery
            </h2>

            <p>
                Enjoy free delivery on selected restaurants.
            </p>

            <div class="coupon">
                Code: FREEDEL
            </div>

        </div>


    </div>


    <a class="btn"
       href="${pageContext.request.contextPath}/restuarant">

        🍽 Start Ordering

    </a>

</div>


<!-- FOOTER -->

<div class="footer">

    <div class="footer-container">

        <div class="footer-column">

            <h3>🍔 FoodExpress</h3>

            <p>
                Your favourite food delivered fast and fresh.
            </p>

        </div>


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


        <div class="footer-column">

            <h3>Follow Us</h3>

            <p>📘 Facebook</p>
            <p>📸 Instagram</p>
            <p>▶️ YouTube</p>

        </div>

    </div>


    <div class="copyright">

        © 2026 FoodExpress. All Rights Reserved.

    </div>

</div>

</body>

</html>