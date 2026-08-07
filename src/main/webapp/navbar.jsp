<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="com.tap.model.User"%>
<%@ page import="com.tap.model.Restuarant"%>
<%@ page import="com.tap.DAO.NotificationDAO"%>
<%@ page import="com.tap.DAO.RestuarantDAO"%>
<%@ page import="com.tap.DAO.imp.NotificationDAOimp"%>
<%@ page import="com.tap.DAO.imp.RestuarantDAOimp"%>

<%
User user = (User)session.getAttribute("loggedUser");

if(user==null){
    response.sendRedirect(request.getContextPath()+"/login.html");
    return;
}

RestuarantDAO restaurantDAO=new RestuarantDAOimp();

Restuarant restaurant=
restaurantDAO.getRestaurantByAdminUserId(user.getUserid());

int unreadCount=0;

if(restaurant!=null){

    NotificationDAO notificationDAO=
    new NotificationDAOimp();

    unreadCount=
    notificationDAO.getUnreadCount(
    restaurant.getRestuarantid());

}
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Foodie Admin Navbar</title>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:"Segoe UI",sans-serif;
}

.navbar{

height:68px;
background:white;

display:flex;
justify-content:space-between;
align-items:center;

padding:0 28px;

box-shadow:0 3px 12px rgba(0,0,0,.08);

}

.nav-left h2{

font-size:22px;
color:#ff6b35;
font-weight:700;

display:flex;
align-items:center;
gap:8px;

}

.nav-right{

display:flex;
align-items:center;
gap:15px;

}

/* Search */

.search-form{

display:flex;
align-items:center;

}

.search-form input{

width:320px;
height:40px;

padding:0 15px;

border:1px solid #ddd;
border-right:none;

border-radius:8px 0 0 8px;

outline:none;

font-size:14px;

}

.search-form input:focus{

border-color:#ff6b35;

}

.search-form button{

width:50px;
height:40px;

background:#ff6b35;
color:white;

border:none;

border-radius:0 8px 8px 0;

cursor:pointer;

transition:.3s;

}

.search-form button:hover{

background:#ef5d22;

}

/* Notification */

.notification{

width:42px;
height:42px;

display:flex;
justify-content:center;
align-items:center;

background:white;

border:1px solid #e8e8e8;

border-radius:10px;

position:relative;

text-decoration:none;

transition:.3s;

}

.notification:hover{

background:#fff4ef;

border-color:#ff6b35;

}

.notification i{

font-size:18px;
color:#ff6b35;

}

.count{

position:absolute;

top:-5px;
right:-5px;

width:18px;
height:18px;

border-radius:50%;

background:#ff3b30;
color:white;

display:flex;
justify-content:center;
align-items:center;

font-size:10px;
font-weight:bold;

border:2px solid white;

}

/* Profile */

.admin-profile{

display:flex;
align-items:center;

gap:10px;

text-decoration:none;

color:#222;

}

.profile-icon{

width:42px;
height:42px;

display:flex;
justify-content:center;
align-items:center;

}

.profile-icon i{

font-size:38px;

color:#ff6b35;

}

.profile-details{

display:flex;
flex-direction:column;

}

.profile-details h4{

font-size:16px;
font-weight:600;

line-height:1;

}

.profile-details span{

font-size:12px;
color:#777;

margin-top:3px;

}

</style>

</head>

<body>

<div class="navbar">

<div class="nav-left">

<h2>

<i class="fa-solid fa-utensils"></i>

FOODIE ADMIN

</h2>

</div>

<div class="nav-right">

<form
action="<%=request.getContextPath()%>/AdminSearchServlet"
method="get"
class="search-form">

<input
type="text"
name="keyword"
placeholder="Search Menu..."
required>

<button type="submit">

<i class="fa-solid fa-magnifying-glass"></i>

</button>

</form>

<a
href="<%=request.getContextPath()%>/NotificationServlet"
class="notification">

<i class="fa-regular fa-bell"></i>

<%
if(unreadCount>0){
%>

<span class="count">

<%=unreadCount%>

</span>

<%
}
%>

</a>

<a
href="<%=request.getContextPath()%>/AdminProfileServlet"
class="admin-profile">

<div class="profile-icon">

<i class="fa-solid fa-circle-user"></i>

</div>

<div class="profile-details">

<h4>

<%=user.getUsername()%>

</h4>

<span>

<%=user.getRole()%>

</span>

</div>

</a>

</div>

</div>

</body>

</html>