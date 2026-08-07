<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="com.tap.model.User"%>

<%
User admin=(User)session.getAttribute("loggedUser");

if(admin==null){
    response.sendRedirect("login.html");
    return;
}
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Add Menu Item</title>

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

/* Sidebar */

.sidebar{
width:250px;
background:#ff6b00;
height:100vh;
position:fixed;
color:white;
}

.logo{
padding:30px;
font-size:28px;
font-weight:bold;
text-align:center;
}

.logo span{
display:block;
font-size:14px;
font-weight:400;
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
color:white;
text-decoration:none;
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

/* Main */

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

.profile{
display:flex;
align-items:center;
gap:10px;
}

.profile img{
width:45px;
height:45px;
border-radius:50%;
}

.content{
padding:35px;
}

.form-box{

max-width:700px;
margin:auto;
background:white;
padding:35px;
border-radius:12px;
box-shadow:0 5px 15px rgba(0,0,0,.08);

}

.form-box h2{

margin-bottom:25px;
color:#ff6b00;

}

.input-group{

margin-bottom:20px;

}

.input-group label{

display:block;
margin-bottom:8px;
font-weight:bold;

}

.input-group input,
.input-group textarea,
.input-group select{

width:100%;
padding:12px;
border:1px solid #ddd;
border-radius:8px;
font-size:15px;

}

textarea{

resize:none;
height:120px;

}

.btn{

background:#ff6b00;
color:white;
padding:14px;
border:none;
width:100%;
font-size:17px;
border-radius:8px;
cursor:pointer;

}

.btn:hover{

background:#e65c00;

}

</style>

</head>

<body>

<div class="container">

<!-- Sidebar -->

<div class="sidebar">

<div class="logo">

🍔 FoodExpress

<span>Partner</span>

</div>

<ul>

<li>
<a href="dashboard">🏠 Dashboard</a>
</li>

<li class="active">
<a href="adminMenu">🍽 Menu</a>
</li>

<li>
<a href="adminOrders">📦 Orders</a>
</li>

<li>
<a href="profile">👤 Profile</a>
</li>

<li>
<a href="LogoutServlet">🚪 Logout</a>
</li>

</ul>

</div>

<!-- Main -->

<div class="main">

<div class="navbar">

<div>

<h2>Add Menu Item</h2>

<p>Welcome, <%=admin.getUsername()%></p>

</div>

<div class="profile">

<img src="images/profile.png">

<b><%=admin.getUsername()%></b>

</div>

</div>

<div class="content">

<div class="form-box">

<h2>Add New Food Item</h2>

<form action="AddMenuServlet" method="post">

<div class="input-group">
<label>Item Name</label>
<input type="text" name="itemName" required>
</div>

<div class="input-group">
<label>Description</label>
<textarea name="description" required></textarea>
</div>

<div class="input-group">
<label>Price</label>
<input type="number" step="0.01" name="price" required>
</div>

<div class="input-group">
<label>Category</label>

<select name="category">

<option>Main Course</option>
<option>Starter</option>
<option>Dessert</option>
<option>Beverage</option>
<option>Pizza</option>
<option>Burger</option>

</select>

</div>

<div class="input-group">

<label>Availability</label>

<select name="isAvailable">

<option value="1">Available</option>
<option value="0">Unavailable</option>

</select>

</div>

<div class="input-group">

<label>Image Name</label>

<input type="text"
name="imagePath"
placeholder="chicken-biryani.jpg">

</div>

<button class="btn">

Add Menu Item

</button>

</form>

</div>

</div>

</div>

</div>

</body>
</html>