<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.tap.model.Restuarant"%>
<%@ page import="com.tap.model.User"%>

<%
User user = (User) session.getAttribute("loggedUser");
String contextPath = request.getContextPath();

String searchValue = request.getParameter("search");
if (searchValue == null) {
    searchValue = "";
}
%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>FoodExpress | Restaurants</title>

<style>

/* =========================================================
   GLOBAL
========================================================= */

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: "Segoe UI", Arial, sans-serif;
}

html {
    scroll-behavior: smooth;
}

body {
    background: #f8f8f8;
    color: #222;
}


/* =========================================================
   NAVBAR
========================================================= */

.navbar {
    height: 80px;
    background: white;

    display: flex;
    justify-content: space-between;
    align-items: center;

    padding: 0 60px;

    box-shadow: 0 2px 15px rgba(0,0,0,.08);

    position: sticky;
    top: 0;
    z-index: 999;
}

.logo {
    font-size: 34px;
    font-weight: 800;
    color: #fc8019;
    white-space: nowrap;
}

.logo span {
    color: #222;
}

.nav-right {
    display: flex;
    align-items: center;
    gap: 28px;
}

.nav-right a {
    text-decoration: none;
    color: #333;
    font-size: 17px;
    font-weight: 600;
    transition: .3s;
}

.nav-right a:hover {
    color: #fc8019;
}

.login-btn {
    background: #fc8019;
    padding: 10px 22px;
    border-radius: 30px;
    color: white !important;
}

.signup-btn {
    background: #222;
    padding: 10px 22px;
    border-radius: 30px;
    color: white !important;
}

.user-chip {
    background: #fff4eb;
    padding: 10px 18px;
    border-radius: 25px;
    color: #fc8019;
    font-weight: bold;
}

.logout-btn {
    background: #fc8019;
    padding: 10px 20px;
    border-radius: 25px;
    color: white !important;
}


/* =========================================================
   HERO
========================================================= */

.hero{
    position:relative;
    height:95vh;
    display:flex;
    justify-content:center;
    align-items:center;
    overflow:hidden;
}

.hero video{
    position:absolute;
    top:0;
    left:0;
    width:100%;
    height:100%;
    object-fit:cover;
    z-index:-2;
}

.hero::before{
    content:"";
    position:absolute;
    inset:0;
    background:rgba(0,0,0,.45);
    z-index:-1;
}

.hero-content{
    width:100%;
    max-width:900px;
    text-align:center;
    padding:20px;
}

.hero-content h1{
    font-size:64px;
    color:white;
    font-weight:800;
    margin-bottom:15px;
}

.hero-content p{
    color:white;
    font-size:22px;
    margin-bottom:35px;
}

.search-box{
    width:760px;
    max-width:100%;
    margin:auto;
    background:white;
    border-radius:60px;
    display:flex;
    align-items:center;
    padding:8px;
    box-shadow:0 15px 35px rgba(0,0,0,.35);
}

/* =========================================================
   SEARCH BAR
========================================================= */

.search-box {
    width: 760px;
    max-width: 100%;

    margin: auto;

    background: white;

    border-radius: 50px;

    display: flex;
    align-items: center;

    padding: 8px;

    box-shadow: 0 10px 25px rgba(0,0,0,.25);
}

.search-icon {
    font-size: 22px;
    padding-left: 20px;
}

.search-box input {
    flex: 1;

    border: none;
    outline: none;

    font-size: 18px;

    padding: 18px;
}

.search-box button {
    background: #fc8019;
    color: white;

    border: none;

    padding: 18px 30px;

    border-radius: 40px;

    cursor: pointer;

    font-size: 17px;
    font-weight: 600;

    transition: .3s;
}

.search-box button:hover {
    background: #e66f00;
}


/* =========================================================
   CATEGORY SECTION
========================================================= */

.category-section {
    background: white;

    padding: 45px 50px 50px;

    border-bottom: 1px solid #eeeeee;
}

.category-title {
    text-align: center;

    font-size: 32px;

    font-weight: 800;

    color: #222;

    margin-bottom: 32px;
}




.categories {

    width: 100%;
    max-width: 1200px;

    margin: 0 auto;

    display: grid;

    /* EXACTLY 7 COLUMNS */
    grid-template-columns: repeat(7, 1fr);

    gap: 18px;

    align-items: start;

    justify-items: center;
}

/* =========================================================
   CATEGORY SECTION
========================================================= */

.category-section {
    background: #fff;
    padding: 42px 40px 45px;
    border-bottom: 1px solid #eeeeee;
}

.category-title {
    text-align: center;
    font-size: 30px;
    font-weight: 800;
    color: #222;
    margin-bottom: 28px;
}


/* =========================================================
   CATEGORY ROW
========================================================= */

.categories {
    width: 100%;
    max-width: 1050px;
    margin: 0 auto;

    display: flex;
    flex-wrap: nowrap;

    justify-content: space-between;
    align-items: flex-start;

    gap: 15px;
}


/* =========================================================
   CATEGORY ITEM
========================================================= */

.category {
    width: 105px;
    min-width: 105px;

    text-decoration: none;
    text-align: center;
    color: #222;

    display: flex;
    flex-direction: column;
    align-items: center;

    transition: transform 0.3s ease;
}

.category:hover {
    transform: translateY(-4px);
}


/* =========================================================
   CATEGORY IMAGE
========================================================= */

.category img {
    width: 82px;
    height: 82px;

    display: block;

    border-radius: 50%;

    /* IMPORTANT */
    object-fit: cover;
    object-position: center center;

    /* Small clean border */
    border: 3px solid #ffffff;

    /* Professional shadow */
    box-shadow: 0 4px 14px rgba(0, 0, 0, 0.15);

    background: #ffffff;

    transition: transform 0.3s ease,
                box-shadow 0.3s ease;
}


/* Hover effect */

.category:hover img {
    transform: scale(1.06);

    box-shadow:
        0 6px 18px rgba(0, 0, 0, 0.20);
}


/* =========================================================
   CATEGORY NAME
========================================================= */

.category p {
    margin-top: 9px;

    font-size: 14px;
    font-weight: 700;

    color: #222;

    white-space: nowrap;
}


/* =========================================================
   ALL CATEGORY
========================================================= */

.category:last-child p {
    color: #fc8019;
}


/* =========================================================
   TABLET
========================================================= */

@media (max-width: 1000px) {

    .category-section {
        padding: 40px 25px;
    }

    .categories {
        max-width: 750px;
        gap: 10px;
    }

    .category {
        width: 90px;
        min-width: 90px;
    }

    .category img {
        width: 72px;
        height: 72px;
    }

    .category p {
        font-size: 13px;
    }
}


/* =========================================================
   MOBILE
========================================================= */

@media (max-width: 768px) {

    .category-section {
        padding: 35px 15px 40px;
    }

    .category-title {
        font-size: 26px;
        margin-bottom: 25px;
    }

    .categories {
        display: grid;

        grid-template-columns:
            repeat(4, 1fr);

        gap: 25px 8px;

        justify-items: center;
    }

    .category {
        width: 80px;
        min-width: 80px;
    }

    .category img {
        width: 68px;
        height: 68px;
    }

    .category p {
        font-size: 12px;
    }
}


/* =========================================================
   SMALL MOBILE
========================================================= */

@media (max-width: 480px) {

    .categories {
        grid-template-columns:
            repeat(3, 1fr);

        gap: 22px 5px;
    }

    .category {
        width: 80px;
        min-width: 80px;
    }

    .category img {
        width: 65px;
        height: 65px;
    }

    .category p {
        font-size: 12px;
    }
}


/* =========================================================
   RESTAURANT SECTION
========================================================= */

.restaurant-section {

    padding: 50px 60px;

    max-width: 1500px;

    margin: auto;
}

.section-title {

    font-size: 34px;

    margin-bottom: 30px;

    color: #222;
}


/* =========================================================
   RESTAURANT GRID
========================================================= */

.grid {

    display: grid;

    grid-template-columns:
        repeat(auto-fit, minmax(320px, 1fr));

    gap: 30px;
}


/* =========================================================
   RESTAURANT CARD
========================================================= */

.card {

    background: white;

    border-radius: 18px;

    overflow: hidden;

    box-shadow:
        0 5px 20px rgba(0,0,0,.12);

    transition: .35s;

    position: relative;
}

.card:hover {

    transform: translateY(-8px);

    box-shadow:
        0 12px 28px rgba(0,0,0,.18);
}

.card img {

    width: 100%;

    height: 230px;

    display: block;

    object-fit: cover;

    object-position: center;

    transition: transform .4s ease;
}

.card:hover img {
    transform: scale(1.05);
}


/* =========================================================
   OFFER BADGE
========================================================= */

.offer {

    position: absolute;

    left: 0;
    top: 190px;

    background:
        linear-gradient(
            90deg,
            #ff512f,
            #dd2476
        );

    color: white;

    padding: 8px 16px;

    font-weight: bold;

    font-size: 14px;

    border-radius: 0 8px 8px 0;

    z-index: 5;
}


/* =========================================================
   CARD CONTENT
========================================================= */

.info {
    padding: 20px;
}

.top {

    display: flex;

    justify-content: space-between;

    align-items: center;

    gap: 15px;
}

.top h3 {

    font-size: 22px;

    color: #222;
}

.rating {

    background: #16a34a;

    color: white;

    padding: 5px 12px;

    border-radius: 20px;

    font-size: 14px;

    font-weight: bold;

    white-space: nowrap;
}

.details {

    margin-top: 12px;

    color: #555;

    line-height: 28px;

    font-size: 15px;
}

.details p {
    margin: 3px 0;
}


/* =========================================================
   FOOD TYPE
========================================================= */

.veg {

    display: inline-block;

    background: #e8fff1;

    color: #15803d;

    padding: 6px 12px;

    border-radius: 20px;

    font-size: 14px;

    font-weight: bold;

    margin-top: 12px;
}

.nonveg {

    display: inline-block;

    background: #ffecec;

    color: #dc2626;

    padding: 6px 12px;

    border-radius: 20px;

    font-size: 14px;

    font-weight: bold;

    margin-top: 12px;
}


/* =========================================================
   STATUS
========================================================= */

.status {

    display: block;

    margin-top: 15px;

    font-size: 15px;
}

.open {

    color: #16a34a;

    font-weight: bold;
}

.closed {

    color: #dc2626;

    font-weight: bold;
}


/* =========================================================
   VIEW MENU BUTTON
========================================================= */

.order-btn {

    display: block;

    margin-top: 18px;

    text-align: center;

    background: #fc8019;

    color: white;

    text-decoration: none;

    padding: 14px;

    border-radius: 10px;

    font-weight: bold;

    transition: .3s;
}

.order-btn:hover {

    background: #e56f00;

    transform: translateY(-2px);
}


/* =========================================================
   NO RESULTS
========================================================= */

.no-results {

    width: 100%;

    text-align: center;

    padding: 80px 20px;

    color: gray;
}

.no-results h2 {

    font-size: 28px;

    margin-bottom: 10px;
}

.no-results p {

    font-size: 17px;

    color: #888;
}


/* =========================================================
   FOOTER
========================================================= */

footer {

    margin-top: 40px;

    background: #111827;

    color: white;

    padding: 60px 30px;

    text-align: center;
}

footer h2 {

    margin-bottom: 20px;

    font-size: 30px;
}

footer p {

    margin-top: 10px;

    color: #d1d5db;
}

.footer-links {

    display: flex;

    justify-content: center;

    gap: 40px;

    flex-wrap: wrap;

    margin: 25px 0;
}

.footer-links a {

    color: white;

    text-decoration: none;

    transition: .3s;
}

.footer-links a:hover {
    color: #fc8019;
}

.footer-line {

    border: .5px solid #374151;

    margin: 20px 0;
}




/* Large desktop */
@media (min-width: 1200px) {

    .categories {
        max-width: 1250px;
        gap: 10px;
    }

    .category {
        width: 130px;
    }

    .category img {
        width: 110px;
        height: 110px;
    }
}


/* Tablet */
@media (max-width: 1000px) {

    .navbar {
        padding: 0 30px;
    }

    .nav-right {
        gap: 15px;
    }

    .category-section,
    .restaurant-section {
        padding: 40px 30px;
    }

    /*
       4 categories per row on tablet
    */

    .categories {
        grid-template-columns: repeat(4, 1fr);

        row-gap: 30px;
    }
}


/* Mobile */
@media (max-width: 768px) {

    .navbar {

        padding: 20px;

        flex-direction: column;

        height: auto;
    }

    .nav-right {

        margin-top: 15px;

        flex-wrap: wrap;

        justify-content: center;

        gap: 12px;
    }

    .logo {
        font-size: 30px;
    }

    .hero {
        min-height: 300px;
    }

    .hero-content h1 {
        font-size: 40px;
    }

    .hero-content p {
        font-size: 18px;
    }

    .search-box {
        width: 95%;
    }

    .search-box input {

        min-width: 0;

        font-size: 15px;

        padding: 15px;
    }

    .search-box button {

        padding: 15px 20px;

        font-size: 15px;
    }

    .category-section,
    .restaurant-section {
        padding: 40px 20px;
    }

    .category-title,
    .section-title {
        font-size: 28px;
    }


    /*
       3 categories per row on mobile
    */

    .categories {

        grid-template-columns:
            repeat(3, 1fr);

        gap: 30px 10px;
    }

    .category {
        width: 100px;
    }

    .category img {

        width: 85px;
        height: 85px;

        border-width: 4px;
    }

    .category p {
        font-size: 14px;
    }

    .grid {
        grid-template-columns: 1fr;
    }
}


/* Small mobile */
@media (max-width: 480px) {

    .nav-right a {
        font-size: 14px;
    }

    .login-btn,
    .signup-btn,
    .logout-btn {
        padding: 8px 14px;
    }

    .user-chip {
        padding: 8px 12px;
    }

    .hero-content h1 {
        font-size: 34px;
    }

    .hero-content p {
        font-size: 16px;
    }

    .search-box {
        padding: 5px;
    }

    .search-icon {
        font-size: 18px;
        padding-left: 10px;
    }

    .search-box input {
        padding: 12px 8px;
        font-size: 14px;
    }

    .search-box button {
        padding: 12px 15px;
        font-size: 14px;
    }

    /*
       2 categories per row on very small screens
    */

    .categories {
        grid-template-columns: repeat(2, 1fr);
        gap: 25px 10px;
    }

    .category {
        width: 110px;
    }

    .category img {
        width: 90px;
        height: 90px;
    }

    .card img {
        height: 200px;
    }

    .offer {
        top: 170px;
    }
}

</style>

</head>


<body>


<!-- =========================================================
     NAVBAR
========================================================= -->

<nav class="navbar">

    <div class="logo">
        🍔 <span>FoodExpress</span>
    </div>


    <div class="nav-right">

        <a href="<%=contextPath%>/restuarant">
            Home
        </a>

        <a href="<%=contextPath%>/CartServlet">
            🛒 Cart
        </a>

        <a href="<%=contextPath%>/profile">
            👤 Profile
        </a>


        <%
        if(user == null) {
        %>

            <a
                href="<%=contextPath%>/login.html"
                class="login-btn">
                Login
            </a>

            <a
                href="<%=contextPath%>/register.html"
                class="signup-btn">
                Sign Up
            </a>

        <%
        } else {
        %>

            <div class="user-chip">
                👋 Hi, <%=user.getUsername()%>
            </div>

            <a
                href="<%=contextPath%>/LogoutServlet"
                class="logout-btn">
                Logout
            </a>

        <%
        }
        %>

    </div>

</nav>


<!-- =========================================================
     HERO
========================================================= -->

<section class="hero">

    <video class="hero-video" autoplay muted loop playsinline>
    <source src="<%=contextPath%>/Burger_Hero_Background.mp4"
            type="video/mp4">
</video>

    <div class="hero-content">

        <h1>Hungry?</h1>

        <p>Order delicious food from your favourite restaurants</p>

        <form action="<%=contextPath%>/restuarant" method="get">

            <div class="search-box">

                <span class="search-icon">🔍</span>

                <input
                    type="text"
                    name="search"
                    placeholder="Search restaurants..."
                    value="<%=searchValue%>">

                <button type="submit">
                    Search
                </button>

            </div>

        </form>

    </div>

</section>

<!-- =========================================================
     CATEGORY SECTION
========================================================= -->

<section class="category-section">

    <h2 class="category-title">
        Explore Categories
    </h2>


    <div class="categories">


        <!-- BIRYANI -->

        <a
            class="category"
            href="<%=contextPath%>/restuarant?category=Biryani">

            <img
                src="<%=contextPath%>/categories_images/Biryani.png"
                alt="Biryani">

            <p>
                Biryani
            </p>

        </a>


        <!-- PIZZA -->

        <a
            class="category"
            href="<%=contextPath%>/restuarant?category=Italian">

            <img
                src="<%=contextPath%>/categories_images/Pizza.png"
                alt="Pizza">

            <p>
                Pizza
            </p>

        </a>


        <!-- BURGER -->

        <a
            class="category"
            href="<%=contextPath%>/restuarant?category=Fast Food">

            <img
                src="<%=contextPath%>/categories_images/Burger.png"
                alt="Burger">

            <p>
                Burger
            </p>

        </a>


        <!-- SOUTH INDIAN -->

        <a
            class="category"
            href="<%=contextPath%>/restuarant?category=South Indian">

            <img
                src="<%=contextPath%>/categories_images/South_Indian.png"
                alt="South Indian">

            <p>
                South Indian
            </p>

        </a>


        <!-- CHINESE -->

        <a
            class="category"
            href="<%=contextPath%>/restuarant?category=Chinese">

            <img
                src="<%=contextPath%>/categories_images/Chinese.png"
                alt="Chinese">

            <p>
                Chinese
            </p>

        </a>


        <!-- DESSERTS -->

        <a
            class="category"
            href="<%=contextPath%>/restuarant?category=Desserts">

            <img
                src="<%=contextPath%>/categories_images/Desserts.png"
                alt="Desserts">

            <p>
                Desserts
            </p>

        </a>


        <!-- ALL -->

        <a
            class="category"
            href="<%=contextPath%>/restuarant">

            <img
                src="<%=contextPath%>/categories_images/All.png"
                alt="All Restaurants">

            <p>
                All
            </p>

        </a>


    </div>

</section>


<!-- =========================================================
     RESTAURANTS
========================================================= -->

<section class="restaurant-section">

    <h2 class="section-title">
        Popular Restaurants
    </h2>


    <div class="grid">


        <%

        List<Restuarant> ll =
            (List<Restuarant>) request.getAttribute("ll");


        if(ll != null && !ll.isEmpty()) {

            for(Restuarant r : ll) {

        %>


        <!-- RESTAURANT CARD -->

        <div class="card">


            <!-- RESTAURANT IMAGE -->

            <img
                src="<%=contextPath%>/<%=r.getImagepath()%>"
                alt="<%=r.getName()%>">


            <!-- CARD INFORMATION -->

            <div class="info">


                <!-- NAME + RATING -->

                <div class="top">

                    <h3>
                        <%=r.getName()%>
                    </h3>

                    <span class="rating">
                        ⭐ <%=r.getRating()%>
                    </span>

                </div>


                <!-- DETAILS -->

                <div class="details">

                    <p>
                        🍽 <%=r.getCuisinetype()%>
                    </p>

                    <p>
                        📍 <%=r.getAddress()%>
                    </p>

                    <p>

                        🛵 <%=r.getDeliverytime()%> mins

                        &nbsp;&nbsp;|&nbsp;&nbsp;

                        🚴 Free Delivery

                    </p>

                </div>


                <!-- STATUS -->

                <div class="status">

                    <%

                    if(r.getIsactive() == 1) {

                    %>

                        <span class="open">
                            🟢 Open Now
                        </span>

                    <%

                    } else {

                    %>

                        <span class="closed">
                            🔴 Closed
                        </span>

                    <%

                    }

                    %>

                </div>


                <!-- MENU BUTTON -->

                <a
                    class="order-btn"
                    href="<%=contextPath%>/MenuServlet?restuarantId=<%=r.getRestuarantid()%>">

                    View Menu →

                </a>


            </div>

        </div>


        <%

            }

        } else {

        %>


        <!-- NO RESTAURANTS -->

        <div class="no-results">

            <h2>
                😔 No Restaurants Found
            </h2>

            <p>
                Try searching for another restaurant or category.
            </p>

        </div>


        <%

        }

        %>


    </div>

</section>


<!-- =========================================================
     FOOTER
========================================================= -->

<footer>

    <div style="max-width:1200px; margin:auto;">

        <h2>
            🍔 FoodExpress
        </h2>

        <p style="margin-top:15px; font-size:18px;">

            Order delicious food from the best restaurants near you.

        </p>


        <div class="footer-links">

            <a href="#">
                About Us
            </a>

            <a href="#">
                Contact
            </a>

            <a href="#">
                Privacy Policy
            </a>

            <a href="#">
                Terms & Conditions
            </a>

        </div>


        <hr class="footer-line">


        <p>
            © 2026 FoodExpress. All Rights Reserved.
        </p>

    </div>

</footer>


</body>

</html>