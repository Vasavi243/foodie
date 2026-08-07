<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="com.tap.model.User"%>

<%

User admin = (User)request.getAttribute("admin");

if(admin == null){

    response.sendRedirect("login.html");
    return;

}

%>


<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Admin Profile</title>


<style>

body{

    margin:0;
    padding:0;
    font-family:Segoe UI,sans-serif;
    background:#f5f5f5;

}


.profile-container{

    width:450px;
    margin:80px auto;
    background:white;
    padding:30px;
    border-radius:15px;
    box-shadow:0 5px 20px rgba(0,0,0,0.1);

}


.profile-container h2{

    text-align:center;
    color:#ff6b35;

}


.profile-icon{

    text-align:center;

}


.profile-icon i{

    font-size:80px;
    color:#ff6b35;

}


.details{

    margin-top:25px;

}


.details p{

    font-size:17px;
    border-bottom:1px solid #eee;
    padding:10px;

}


.back-btn{

    display:block;
    text-align:center;
    margin-top:20px;

}


.back-btn a{

    text-decoration:none;
    background:#ff6b35;
    color:white;
    padding:10px 25px;
    border-radius:8px;

}

</style>


</head>


<body>


<div class="profile-container">


<div class="profile-icon">

<i class="fa fa-user"></i>

</div>


<h2>Admin Profile</h2>



<div class="details">


<p>
<b>Name :</b>
<%= admin.getUsername() %>
</p>


<p>
<b>Email :</b>
<%= admin.getEmail() %>
</p>


<p>
<b>Address :</b>
<%= admin.getAddress() %>
</p>


<p>
<b>Role :</b>
<%= admin.getRole() %>
</p>


</div>



<div class="back-btn">

<a href="dashboard">
Back to Dashboard
</a>

</div>


</div>


</body>

</html>