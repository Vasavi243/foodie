<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.tap.model.User" %>

<%
User user = (User) request.getAttribute("user");

if (user == null) {
    response.sendRedirect(request.getContextPath() + "/login.html");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Profile</title>

<style>
body{
    font-family:Arial,sans-serif;
    background:#f5f5f5;
    margin:0;
    padding:40px;
}

.container{
    width:500px;
    margin:auto;
    background:white;
    border-radius:10px;
    padding:30px;
    box-shadow:0 0 10px rgba(0,0,0,.2);
}

h2{
    text-align:center;
    color:#fc8019;
}

table{
    width:100%;
    border-collapse:collapse;
}

td{
    padding:12px;
    border-bottom:1px solid #eee;
}

label{
    font-weight:bold;
}

.back{
    display:inline-block;
    margin-top:20px;
    background:#fc8019;
    color:white;
    text-decoration:none;
    padding:10px 20px;
    border-radius:5px;
}
</style>

</head>
<body>

<div class="container">

<h2>My Profile</h2>

<table>

<tr>
<td><label>Name</label></td>
<td><%= user.getUsername() %></td>
</tr>

<tr>
<td><label>Email</label></td>
<td><%= user.getEmail() %></td>
</tr>

<tr>
<td><label>Address</label></td>
<td><%= user.getAddress() %></td>
</tr>

<tr>
<td><label>Role</label></td>
<td><%= user.getRole() %></td>
</tr>

</table>

<a class="back" href="<%=request.getContextPath()%>/restuarant">
← Back
</a>

</div>

</body>
</html>