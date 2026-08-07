<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>Help - FoodExpress</title>

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

.container {
    width: 90%;
    max-width: 900px;
    margin: 45px auto;
}

.title {
    text-align: center;
    font-size: 36px;
    margin-bottom: 10px;
}

.subtitle {
    text-align: center;
    color: #777;
    margin-bottom: 35px;
}

.faq {
    background: white;
    padding: 25px;
    margin-bottom: 18px;
    border-radius: 15px;
    box-shadow: 0 6px 20px rgba(0,0,0,.07);
}

.faq h3 {
    color: #ff6b00;
    margin-bottom: 10px;
}

.faq p {
    color: #666;
    line-height: 1.6;
}

.back {
    display: block;
    width: fit-content;
    margin: 35px auto;
    padding: 13px 27px;
    border-radius: 25px;
    background: #ff6b00;
    color: white;
    text-decoration: none;
    font-weight: bold;
}

.footer {
    background: #222;
    color: white;
    margin-top: 60px;
    padding: 45px 7%;
}

.footer-container {
    display: grid;
    grid-template-columns: repeat(4,1fr);
    gap: 40px;
}

.footer-column h3 {
    color: #ff6b00;
    margin-bottom: 18px;
}

.footer-column a,
.footer-column p {
    display: block;
    color: #ddd;
    text-decoration: none;
    margin-bottom: 12px;
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

@media(max-width:700px) {

    .navbar {
        padding: 0 20px;
    }

    .nav-links {
        display: none;
    }

    .footer-container {
        grid-template-columns: 1fr 1fr;
    }
}

</style>

</head>

<body>

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


<div class="container">

    <h1 class="title">
        ❓ Help Center
    </h1>

    <p class="subtitle">
        How can we help you?
    </p>


    <div class="faq">

        <h3>
            How can I place an order?
        </h3>

        <p>
            Select a restaurant, choose your favourite food,
            add it to your cart and proceed to checkout.
        </p>

    </div>


    <div class="faq">

        <h3>
            How can I track my order?
        </h3>

        <p>
            Open My Orders and click the Track Order button
            beside your order.
        </p>

    </div>


    <div class="faq">

        <h3>
            What payment methods are available?
        </h3>

        <p>
            You can choose from the payment methods available
            during checkout.
        </p>

    </div>


    <div class="faq">

        <h3>
            I have a problem with my order. What should I do?
        </h3>

        <p>
            Please contact our customer support team through
            the Contact Us page.
        </p>

    </div>


    <a class="back"
       href="${pageContext.request.contextPath}/restuarant">

        ← Back to Home

    </a>

</div>


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

            <a href="${pageContext.request.contextPath}/restuarant">Home</a>

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