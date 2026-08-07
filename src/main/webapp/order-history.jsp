<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.tap.model.Ordertable"%>
<%@ page import="com.tap.model.User"%>

<%

User user =
        (User)
        session.getAttribute("loggedUser");

List<Ordertable> orders =
        (List<Ordertable>)
        request.getAttribute("orders");

SimpleDateFormat sdf =
        new SimpleDateFormat(
                "dd MMM yyyy, hh:mm a"
        );

%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>My Orders</title>

<style>

*{
    box-sizing:border-box;
    margin:0;
    padding:0;
    font-family:"Segoe UI",sans-serif;
}

body{
    background:#f5f5f5;
    color:#222;
}

.navbar{

    height:75px;
    background:#ff6b00;
    display:flex;
    align-items:center;
    justify-content:space-between;
    padding:0 60px;
    color:white;

}

.logo{

    font-size:28px;
    font-weight:bold;

}

.nav-links{

    display:flex;
    gap:30px;

}

.nav-links a{

    color:white;
    text-decoration:none;
    font-weight:600;

}

.container{

    width:90%;
    max-width:1100px;
    margin:40px auto;

}

.heading{

    font-size:34px;
    margin-bottom:30px;

}

.order-card{

    background:white;
    border-radius:18px;
    padding:25px;
    margin-bottom:20px;
    box-shadow:0 7px 25px rgba(0,0,0,.08);

}

.order-top{

    display:flex;
    justify-content:space-between;
    align-items:center;
    border-bottom:1px solid #eee;
    padding-bottom:18px;
    margin-bottom:18px;

}

.order-id{

    font-size:20px;
    font-weight:bold;

}

.status{

    padding:8px 16px;
    border-radius:20px;
    background:#fff4e8;
    color:#ff6b00;
    font-weight:bold;

}

.order-details{

    display:grid;
    grid-template-columns:repeat(4,1fr);
    gap:20px;

}

.detail h4{

    color:#777;
    margin-bottom:6px;
    font-size:14px;

}

.detail p{

    font-weight:600;
    font-size:16px;

}

.total{

    color:#ff6b00;
    font-size:19px;

}

/* ===== NEW TRACK ORDER BUTTON ===== */

.track-section{

    margin-top:25px;
    text-align:right;

}

.track-btn{

    display:inline-block;
    background:#ff6b00;
    color:white;
    padding:12px 24px;
    border-radius:30px;
    text-decoration:none;
    font-weight:bold;
    transition:.3s;

}

.track-btn:hover{

    background:#e65c00;
    transform:translateY(-2px);

}

.empty{

    background:white;
    padding:50px;
    text-align:center;
    border-radius:20px;
    box-shadow:0 5px 20px rgba(0,0,0,.08);

}

.empty h2{

    margin-bottom:15px;

}

.empty a{

    display:inline-block;
    margin-top:20px;
    padding:13px 25px;
    border-radius:25px;
    background:#ff6b00;
    color:white;
    text-decoration:none;

}

@media(max-width:800px){

.navbar{

padding:0 20px;

}

.order-details{

grid-template-columns:1fr 1fr;

}

}

@media(max-width:500px){

.order-details{

grid-template-columns:1fr;

}

.track-section{

text-align:center;

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

Restaurants

</a>

<a href="${pageContext.request.contextPath}/CartServlet">

Cart

</a>

<a href="${pageContext.request.contextPath}/OrderHistoryServlet">

My Orders

</a>

</div>

</div>

<div class="container">

<h1 class="heading">

My Orders

</h1>

<%

if(orders != null && !orders.isEmpty()){

for(Ordertable order : orders){

%>

<div class="order-card">

<div class="order-top">

<div class="order-id">

Order #<%=order.getOrderid()%>

</div>

<div class="status">

<%=order.getStatus()%>

</div>

</div>

<div class="order-details">

<div class="detail">

<h4>Order Date</h4>

<p>

<%=order.getOrderdate()!=null
? sdf.format(order.getOrderdate())
: "N/A"%>

</p>

</div>

<div class="detail">

<h4>Payment</h4>

<p>

<%=order.getPaymentmethod()%>

</p>

</div>

<div class="detail">

<h4>Restaurant ID</h4>

<p>

#<%=order.getRestuarantid()%>

</p>

</div>

<div class="detail">

<h4>Total Amount</h4>

<p class="total">

₹<%=order.getTotalamount()%>

</p>

</div>

</div>

<!-- TRACK BUTTON START -->

<div class="track-section">

<a
    href="${pageContext.request.contextPath}/TrackOrderServlet?orderId=<%=order.getOrderid()%>"
    class="track-btn">

    📍 Track Order

</a>

</div>

<!-- TRACK BUTTON END -->

</div>

<%

    }

} else {

%>

<div class="empty">

    <h2>

        No Orders Yet 🍔

    </h2>

    <p>

        You haven't placed any orders yet.

    </p>

    <a href="${pageContext.request.contextPath}/restuarant">

        Start Ordering

    </a>

</div>

<%

}

%>

</div>

</body>

</html>