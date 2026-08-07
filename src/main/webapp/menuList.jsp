<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.tap.model.Menu"%>

<%

List<Menu> menuList =
(List<Menu>)request.getAttribute("menuList");

String contextPath = request.getContextPath();

%>


<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Manage Menu</title>


<style>


body{

    margin:0;
    font-family:'Segoe UI',sans-serif;
    background:#f5f6fa;

}


/* Header */

.header{

    background:#ff5722;
    color:white;
    padding:20px 40px;
    display:flex;
    justify-content:space-between;
    align-items:center;

}


.header h1{

    margin:0;

}


.add-btn{

    background:white;
    color:#ff5722;
    padding:10px 18px;
    border-radius:8px;
    text-decoration:none;
    font-weight:bold;

}


/* Container */

.container{

    padding:30px;

}



/* Menu Grid */


.menu-grid{

    display:grid;
    grid-template-columns:
    repeat(auto-fit,minmax(280px,1fr));

    gap:25px;

}



/* Card */

.menu-card{

    background:white;
    border-radius:15px;
    overflow:hidden;
    box-shadow:0px 5px 15px rgba(0,0,0,0.1);

}



.menu-card img{

    width:100%;
    height:200px;
    object-fit:cover;

}


.menu-content{

    padding:20px;

}


.menu-content h2{

    margin-top:0;

}


.price{

    color:#ff5722;
    font-size:20px;
    font-weight:bold;

}


.category{

    color:#555;

}



/* Availability */


.available{

    color:green;
    font-weight:bold;

}


.notavailable{

    color:red;
    font-weight:bold;

}



/* Buttons */


.actions{

    margin-top:15px;

}


.edit-btn,
.delete-btn{

    padding:8px 15px;
    text-decoration:none;
    border-radius:6px;
    color:white;
    margin-right:10px;

}


.edit-btn{

    background:#2196f3;

}


.delete-btn{

    background:#e53935;

}



.empty{

    text-align:center;
    padding:40px;
    color:gray;

}


</style>


</head>


<body>



<div class="header">


<h1>
Manage Menu
</h1>


<a href="AddMenuServlet" class="add-btn">
+ Add New Menu
</a>


</div>



<div class="container">



<div class="menu-grid">



<%

if(menuList != null && !menuList.isEmpty()){


for(Menu menu : menuList){


%>



<div class="menu-card">



<%

String image = menu.getImagepath();


if(image == null || image.trim().equals("")){

image = "default-food.jpg";

}

%>



<img src="<%=contextPath%>/final_images/<%=image%>"
     alt="Food Image">




<div class="menu-content">



<h2>

<%=menu.getItemname()%>

</h2>



<p>

<%=menu.getDescription()%>

</p>



<p class="category">

Category :
<b>
<%=menu.getCategory()%>
</b>

</p>



<p class="price">

₹ <%=menu.getPrice()%>

</p>



<p>


Status :

<%

if(menu.getIsavaliable()==1){

%>

<span class="available">

Available

</span>


<%

}else{

%>


<span class="notavailable">

Not Available

</span>


<%

}

%>


</p>




<div class="actions">


<a class="edit-btn"
href="EditMenuServlet?menuid=<%=menu.getMenuid()%>">

Edit

</a>



<a class="delete-btn"
href="DeleteMenuServlet?menuid=<%=menu.getMenuid()%>"
onclick="return confirm('Delete this menu item?')">

Delete

</a>



</div>



</div>



</div>



<%


}

}
else{


%>


<div class="empty">

<h2>No Menu Items Found</h2>

<p>Add your first food item.</p>


</div>



<%

}

%>




</div>


</div>



</body>

</html>