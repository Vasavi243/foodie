<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.tap.model.Notification"%>
<%@ page import="com.tap.model.Restuarant"%>

<%

List<Notification> notifications =
        (List<Notification>)request.getAttribute("notifications");

Restuarant restaurant =
        (Restuarant)request.getAttribute("restaurant");

%>


<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Notifications</title>


<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">


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



/* Navbar */

.header{

height:75px;
background:white;
display:flex;
align-items:center;
justify-content:space-between;
padding:0 40px;
box-shadow:0 3px 10px rgba(0,0,0,.08);

}


.header h2{

color:#ff6b35;
font-size:26px;

}


.back-btn{

text-decoration:none;
background:#ff6b35;
color:white;
padding:10px 18px;
border-radius:8px;
font-size:14px;

}


.back-btn:hover{

background:#e85d2a;

}



/* Main */

.container{

width:80%;
margin:40px auto;

}



.title{

display:flex;
align-items:center;
gap:12px;
margin-bottom:25px;

}


.title i{

font-size:28px;
color:#ff6b35;

}


.title h1{

font-size:28px;
color:#333;

}




/* Notification Card */


.notification-card{


background:white;
padding:20px;
border-radius:15px;
margin-bottom:18px;
display:flex;
align-items:center;
gap:20px;
box-shadow:0 5px 15px rgba(0,0,0,.08);
transition:.3s;


}


.notification-card:hover{

transform:translateY(-4px);

}




.notification-icon{


height:55px;
width:55px;
border-radius:50%;
background:#fff1eb;
display:flex;
align-items:center;
justify-content:center;

}


.notification-icon i{

font-size:25px;
color:#ff6b35;

}



.notification-content{

flex:1;

}


.notification-content h3{

font-size:18px;
margin-bottom:6px;
color:#333;

}


.notification-content p{

color:#666;
font-size:14px;

}


.notification-time{

font-size:13px;
color:gray;

}



/* Empty */


.empty{


background:white;
padding:50px;
border-radius:15px;
text-align:center;
box-shadow:0 5px 15px rgba(0,0,0,.08);

}


.empty i{

font-size:50px;
color:#ccc;

}


.empty h3{

margin-top:15px;
color:#555;

}


</style>


</head>



<body>


<div class="header">


<h2>

<i class="fa-solid fa-utensils"></i>

FOODIE ADMIN

</h2>


<a href="adminDashboard.jsp" class="back-btn">

<i class="fa-solid fa-arrow-left"></i>

Dashboard

</a>


</div>





<div class="container">


<div class="title">


<i class="fa-solid fa-bell"></i>


<h1>

Notifications

</h1>


</div>





<%

if(notifications != null && !notifications.isEmpty()){


for(Notification n : notifications){


%>



<div class="notification-card">


<div class="notification-icon">


<i class="fa-solid fa-bag-shopping"></i>


</div>



<div class="notification-content">


<h3>

<%=n.getTitle()%>

</h3>


<p>

<%=n.getMessage()%>

</p>


</div>



<div class="notification-time">


<%=n.getCreatedAt()%>


</div>



</div>



<%


}


}

else{


%>



<div class="empty">


<i class="fa-regular fa-bell-slash"></i>


<h3>

No New Notifications

</h3>


<p>

Your restaurant notifications will appear here.

</p>


</div>



<%


}

%>



</div>


</body>


</html>