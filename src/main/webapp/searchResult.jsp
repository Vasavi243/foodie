<%@ page language="java" contentType="text/html;charset=UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.tap.model.Menu"%>

<%

String keyword=(String)request.getAttribute("keyword");

List<Menu> results=
(List<Menu>)request.getAttribute("results");

%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Search Results</title>

<style>

body{

font-family:Segoe UI;

background:#f5f5f5;

padding:40px;

}

.container{

width:900px;

margin:auto;

background:white;

padding:30px;

border-radius:10px;

box-shadow:0 0 10px rgba(0,0,0,.1);

}

table{

width:100%;

border-collapse:collapse;

margin-top:20px;

}

th{

background:#ff6b00;

color:white;

padding:12px;

}

td{

padding:12px;

text-align:center;

border-bottom:1px solid #ddd;

}

img{

width:70px;

height:70px;

object-fit:cover;

border-radius:8px;

}

.back{

display:inline-block;

margin-bottom:20px;

background:#ff6b00;

padding:10px 20px;

color:white;

text-decoration:none;

border-radius:6px;

}

</style>

</head>

<body>

<div class="container">

<a href="dashboard" class="back">

← Back to Dashboard

</a>

<h2>

Search Results for :

<b>

<%=keyword%>

</b>

</h2>

<%

if(results!=null && !results.isEmpty()){

%>

<table>

<tr>

<th>Image</th>

<th>Item Name</th>

<th>Category</th>

<th>Price</th>

<th>Status</th>

</tr>

<%

for(Menu menu:results){

%>

<tr>

<td>

<img src="<%=menu.getImagepath()%>">

</td>

<td>

<%=menu.getItemname()%>

</td>

<td>

<%=menu.getCategory()%>

</td>

<td>

₹ <%=menu.getPrice()%>

</td>

<td>

<%=menu.getIsavaliable()==1?"Available":"Unavailable"%>

</td>

</tr>

<%

}

%>

</table>

<%

}else{

%>

<h3>

No Menu Item Found

</h3>

<%

}

%>

</div>

</body>

</html>