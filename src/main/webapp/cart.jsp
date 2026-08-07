<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.tap.model.Cart"%>
<%@ page import="com.tap.model.CartItem"%>
<%@ page import="java.math.BigDecimal"%>

<%
Cart cart = (Cart)session.getAttribute("cart");
BigDecimal grandTotal = BigDecimal.ZERO;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FoodExpress | Cart</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI',sans-serif;
}

body{
    background:#f4f6f9;
}

/* ================= NAVBAR ================= */

.navbar{

    height:75px;

    background:#ff6b00;

    display:flex;

    justify-content:space-between;

    align-items:center;

    padding:0 70px;

    box-shadow:0 3px 12px rgba(0,0,0,.15);

}

.logo{

    color:white;

    font-size:32px;

    font-weight:bold;

}

.logo span{

    color:#222;

}

.nav-links{

    display:flex;

    gap:30px;

}

.nav-links a{

    text-decoration:none;

    color:white;

    font-size:18px;

    font-weight:600;

    transition:.3s;

}

.nav-links a:hover{

    color:#222;

}

/* ================= CONTAINER ================= */

.container{

    width:92%;

    max-width:1200px;

    margin:40px auto;

}

.heading{

    margin-bottom:30px;

}

.heading h1{

    color:#333;

    font-size:34px;

}

.heading p{

    color:#777;

    margin-top:10px;

}

/* ================= TABLE ================= */

.cart-table{

    background:white;

    border-radius:10px;

    overflow:hidden;

    box-shadow:0 5px 15px rgba(0,0,0,.08);

}

.header-row{

    display:grid;

    grid-template-columns:2.5fr 1fr 1fr 1.8fr 1.2fr;

    background:#ff6b00;

    color:white;

    font-weight:bold;

    padding:18px;

}

.item-row{

    display:grid;

    grid-template-columns:2.5fr 1fr 1fr 1.8fr 1.2fr;

    align-items:center;

    padding:18px;

    border-bottom:1px solid #eee;

}

.item-row:hover{

    background:#fafafa;

}

.food-name{

    font-size:18px;

    font-weight:600;

    color:#333;

}

.price{

    font-weight:600;

}

.total{

    color:#ff6b00;

    font-weight:bold;

}

/* ================= QUANTITY ================= */

.qty-box{

    display:flex;

    justify-content:center;

    align-items:center;

    gap:10px;

}

.qty-btn{

    width:32px;

    height:32px;

    border:none;

    border-radius:50%;

    background:#ff6b00;

    color:white;

    font-size:18px;

    font-weight:bold;

    cursor:pointer;

    transition:.3s;

}

.qty-btn:hover{

    background:#e55d00;

}

.qty-value{

    width:40px;

    height:35px;

    display:flex;

    justify-content:center;

    align-items:center;

    border:1px solid #ddd;

    border-radius:6px;

    background:#fafafa;

    font-weight:bold;

}

/* ================= REMOVE BUTTON ================= */

.remove-btn{

    background:#ff4d4f;

    color:white;

    border:none;

    padding:10px 18px;

    border-radius:6px;

    cursor:pointer;

    font-weight:600;

}

.remove-btn:hover{

    background:#d9363e;

}

/* ================= SUMMARY ================= */

.summary{

    margin-top:25px;

    background:white;

    border-radius:10px;

    padding:25px;

    box-shadow:0 5px 15px rgba(0,0,0,.08);

}

.summary-row{

    display:flex;

    justify-content:space-between;

    margin-bottom:12px;

    font-size:18px;

}

.grand{

    font-size:28px;

    font-weight:bold;

    color:#ff6b00;

}

/* ================= BUTTONS ================= */

.bottom-buttons{

    margin-top:25px;

    display:flex;

    justify-content:space-between;

}

.add-btn{

    background:#3498db;

    color:white;

    text-decoration:none;

    padding:14px 28px;

    border-radius:8px;

    font-weight:bold;

}

.checkout-btn{

    background:#27ae60;

    color:white;

    text-decoration:none;

    padding:14px 28px;

    border-radius:8px;

    font-weight:bold;

}

.add-btn:hover{

    background:#2f86c5;

}

.checkout-btn:hover{

    background:#1f944f;

}

/* ================= EMPTY CART ================= */

.empty{

    background:white;

    padding:80px;

    text-align:center;

    border-radius:10px;

    box-shadow:0 5px 15px rgba(0,0,0,.08);

}

.empty h2{

    margin-top:20px;

    color:#555;

}

.shop-btn{

    display:inline-block;

    margin-top:30px;

    text-decoration:none;

    background:#ff6b00;

    color:white;

    padding:14px 28px;

    border-radius:8px;

    font-weight:bold;

}

.shop-btn:hover{

    background:#e65d00;

}

</style>

</head>

<body>

<div class="navbar">

    <div class="logo">

        Food<span>Express</span>

    </div>

    <div class="nav-links">

        <a href="<%=request.getContextPath()%>/restuarant">Home</a>

        <a href="<%=request.getContextPath()%>/login.html">Login</a>

        <a href="<%=request.getContextPath()%>/register.html">Sign Up</a>

        <a href="profile">Profile</a>

    </div>

</div>

<div class="container">



<div class="heading">

<h1>Your Shopping Cart</h1>

<p>Review your delicious food before placing the order.</p>

</div>

<%
if(cart == null || cart.isEmpty()){
%>

<div class="empty">

    <h2>Your Cart is Empty</h2>

    <p>Add some delicious food to continue.</p>

    <a href="<%=request.getContextPath()%>/restuarant"
       class="shop-btn">
       Browse Restaurants
    </a>

</div>

<%
}
else{
%>

<div class="cart-table">

    <!-- Header -->

    <div class="header-row">

        <div>Food Item</div>

        <div>Price</div>

        <div>Quantity</div>

        <div>Total</div>

        <div>Action</div>

    </div>

<%

for(CartItem item : cart.getItems().values()){

    BigDecimal itemTotal = item.getTotalPrice();

    grandTotal = grandTotal.add(itemTotal);

%>

<div class="item-row">

    <!-- Food Name -->

    <div class="food-name">

        <%=item.getName()%>

    </div>

    <!-- Price -->

    <div class="price">

        ₹ <%=item.getPrice()%>

    </div>

    <!-- Quantity -->

    <div class="qty-box">

        <!-- Decrease -->

        <form action="CartServlet" method="post">

            <input type="hidden"
                   name="action"
                   value="decrease">

            <input type="hidden"
                   name="menuId"
                   value="<%=item.getMenuid()%>">

            <button class="qty-btn">-</button>

        </form>

        <div class="qty-value">

            <%=item.getQty()%>

        </div>

        <!-- Increase -->

        <form action="CartServlet" method="post">

            <input type="hidden"
                   name="action"
                   value="increase">

            <input type="hidden"
                   name="menuId"
                   value="<%=item.getMenuid()%>">

            <button class="qty-btn">+</button>

        </form>

    </div>

    <!-- Item Total -->

    <div class="total">

        ₹ <%=itemTotal%>

    </div>

    <!-- Remove -->

    <div>

        <form action="CartServlet" method="post">

            <input type="hidden"
                   name="action"
                   value="remove">

            <input type="hidden"
                   name="menuId"
                   value="<%=item.getMenuid()%>">

            <button class="remove-btn">

                Remove

            </button>

        </form>

    </div>

</div>

<%
}
%>

</div>

<!-- Summary -->

<div class="summary">

    <div class="summary-row">

        <span>Total Items</span>

        <span><%=cart.getTotalItems()%></span>

    </div>

    <div class="summary-row grand">

        <span>Grand Total</span>

        <span>₹ <%=grandTotal%></span>

    </div>

</div>

<!-- Buttons -->

<div class="bottom-buttons">

    <a href="<%=request.getContextPath()%>/restuarant"
       class="add-btn">

        Continue Shopping

    </a>

    <a href="${pageContext.request.contextPath}/CheckoutServlet"
   class="checkout-btn">
    Proceed to Checkout
</a>

       

</div>

<%
}
%>

</div>

</body>

</html>