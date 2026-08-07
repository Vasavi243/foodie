<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.math.BigDecimal"%>
<%@ page import="com.tap.model.User"%>
<%@ page import="com.tap.model.Restuarant"%>

<%
User admin=(User)session.getAttribute("loggedUser");

if(admin==null){
    response.sendRedirect("login.html");
    return;
}

Restuarant restaurant=(Restuarant)request.getAttribute("restaurant");

BigDecimal totalRevenue=(BigDecimal)request.getAttribute("totalRevenue");

Integer deliveredOrders=
(Integer)request.getAttribute("deliveredOrders");

Integer pendingOrders=
(Integer)request.getAttribute("pendingOrders");

if(totalRevenue==null)
    totalRevenue=BigDecimal.ZERO;

if(deliveredOrders==null)
    deliveredOrders=0;

if(pendingOrders==null)
    pendingOrders=0;
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Revenue</title>

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:Segoe UI,sans-serif;
}

body{
background:#f5f6fa;
}

.container{
display:flex;
}

.sidebar{
width:250px;
height:100vh;
background:#ff6b00;
position:fixed;
color:white;
}

.logo{
padding:30px;
text-align:center;
font-size:28px;
font-weight:bold;
}

.logo span{
display:block;
font-size:14px;
}

.sidebar ul{
list-style:none;
}

.sidebar li{
margin:10px;
}

.sidebar li a{
display:block;
padding:15px;
text-decoration:none;
color:white;
border-radius:10px;
}

.sidebar li:hover,
.sidebar li.active{
background:white;
}

.sidebar li:hover a,
.sidebar li.active a{
color:#ff6b00;
}

.main{
margin-left:250px;
width:calc(100% - 250px);
}

.navbar{
height:80px;
background:white;
display:flex;
justify-content:space-between;
align-items:center;
padding:0 35px;
box-shadow:0 3px 10px rgba(0,0,0,.08);
}

.content{
padding:35px;
}

.cards{
display:grid;
grid-template-columns:repeat(3,1fr);
gap:20px;
}

.card{
background:white;
padding:30px;
border-radius:15px;
text-align:center;
box-shadow:0 5px 12px rgba(0,0,0,.08);
}

.card h4{
color:#666;
margin-bottom:15px;
}

.card h2{
color:#ff6b00;
font-size:36px;
}

</style>

</head>

<body>

<div class="container">

<div class="sidebar">

<div class="logo">

🍔 FoodExpress

<span>Partner</span>

</div>

<ul>

<li>
<a href="dashboard">🏠 Dashboard</a>
</li>

<li>
<a href="adminMenu">🍽 Menu</a>
</li>

<li>
<a href="adminOrders">📦 Orders</a>
</li>

<li class="active">
<a href="revenue">💰 Revenue</a>
</li>

<li>
<a href="profile">👤 Profile</a>
</li>

<li>
<a href="LogoutServlet">🚪 Logout</a>
</li>

</ul>

</div>

<div class="main">

<div class="navbar">

<div>

<h2>Revenue Dashboard</h2>

<p>

<%=restaurant.getName()%>

</p>

</div>

<div>

<b>

<%=admin.getUsername()%>

</b>

</div>

</div>

<div class="content">

<div class="cards">

<div class="card">

<h4>Total Revenue</h4>

<h2>

₹ <%=totalRevenue%>

</h2>

</div>

<div class="card">

<h4>Delivered Orders</h4>

<h2>

<%=deliveredOrders%>

</h2>

</div>

<div class="card">

<h4>Pending Orders</h4>

<h2>

<%=pendingOrders%>

</h2>

</div>

</div>

</div>

</div>

</div>

</body>

</html>