<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="com.tap.model.Menu"%>

<%
Menu menu=(Menu)request.getAttribute("menu");

if(menu==null){
    response.sendRedirect("adminMenu");
    return;
}
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Edit Menu Item</title>

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
width:700px;
margin:40px auto;
background:white;
padding:35px;
border-radius:15px;
box-shadow:0 5px 15px rgba(0,0,0,.1);
}

h2{
margin-bottom:25px;
color:#ff6b00;
text-align:center;
}

.form-group{
margin-bottom:20px;
}

label{
display:block;
margin-bottom:8px;
font-weight:bold;
}

input,
textarea,
select{
width:100%;
padding:12px;
border:1px solid #ccc;
border-radius:8px;
font-size:15px;
}

textarea{
resize:none;
height:120px;
}

.preview{
text-align:center;
margin:20px 0;
}

.preview img{
width:180px;
height:150px;
object-fit:cover;
border-radius:10px;
border:1px solid #ddd;
}

.buttons{
display:flex;
justify-content:space-between;
margin-top:25px;
}

.save{
background:#28a745;
color:white;
padding:12px 25px;
border:none;
border-radius:8px;
cursor:pointer;
font-size:16px;
}

.cancel{
background:#dc3545;
color:white;
padding:12px 25px;
border-radius:8px;
text-decoration:none;
}

.save:hover{
background:#218838;
}

.cancel:hover{
background:#c82333;
}

</style>

</head>

<body>

<div class="container">

<h2>Edit Menu Item</h2>

<form action="EditMenuServlet" method="post">

<input type="hidden"
name="menuId"
value="<%=menu.getMenuid()%>">

<div class="preview">

<img src="<%=menu.getImagepath()%>">

</div>

<div class="form-group">

<label>Item Name</label>

<input type="text"
name="itemName"
value="<%=menu.getItemname()%>"
required>

</div>

<div class="form-group">

<label>Description</label>

<textarea
name="description"
required><%=menu.getDescription()%></textarea>

</div>

<div class="form-group">

<label>Price</label>

<input type="number"
step="0.01"
name="price"
value="<%=menu.getPrice()%>"
required>

</div>

<div class="form-group">

<label>Category</label>

<input type="text"
name="category"
value="<%=menu.getCategory()%>"
required>

</div>

<div class="form-group">

<label>Availability</label>

<select name="isAvailable">

<option value="1"
<%=menu.getIsavaliable()==1?"selected":""%>>
Available
</option>

<option value="0"
<%=menu.getIsavaliable()==0?"selected":""%>>
Unavailable
</option>

</select>

</div>

<div class="form-group">

<label>Image Path</label>

<input type="text"
name="imagePath"
value="<%=menu.getImagepath()%>"
required>

</div>

<div class="buttons">

<button class="save" type="submit">
Update Menu
</button>

<a href="adminMenu" class="cancel">
Cancel
</a>

</div>

</form>

</div>

</body>

</html>