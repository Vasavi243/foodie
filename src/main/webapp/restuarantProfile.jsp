<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.tap.model.Restuarant"%>


<%

Restuarant restaurant =
        (Restuarant) request.getAttribute("restaurant");


if(restaurant == null){

    response.sendRedirect("login.html");
    return;

}

%>


<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Restaurant Profile</title>


<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI',sans-serif;
}


body{

    background:#f5f5f5;
    padding:40px;

}


.container{

    width:650px;
    margin:auto;
    background:white;
    padding:35px;
    border-radius:15px;
    box-shadow:0 5px 20px rgba(0,0,0,0.15);

}


h2{

    text-align:center;
    color:#fc8019;
    margin-bottom:30px;

}



/* Restaurant Image */

.image-box{

    text-align:center;
    margin-bottom:25px;

}


.image-box img{

    width:150px;
    height:150px;
    border-radius:50%;
    object-fit:cover;
    border:4px solid #fc8019;

}




.form-group{

    margin-bottom:20px;

}


label{

    display:block;
    font-weight:bold;
    margin-bottom:8px;

}


input,
textarea{

    width:100%;
    padding:12px;
    border:1px solid #ccc;
    border-radius:8px;
    font-size:15px;

}



textarea{

    height:90px;
    resize:none;

}



.status{

    display:flex;
    gap:30px;

}



.status label{

    font-weight:normal;

}



.rating{

    background:#eee;
    padding:12px;
    border-radius:8px;

}



button{

    width:100%;
    padding:14px;
    background:#fc8019;
    color:white;
    border:none;
    border-radius:8px;
    font-size:18px;
    cursor:pointer;

}



button:hover{

    background:#e56f00;

}



.back{

    display:block;
    text-align:center;
    margin-top:20px;
    text-decoration:none;
    color:#fc8019;

}



</style>


</head>



<body>


<div class="container">


<h2>
Restaurant Profile
</h2>




<div class="image-box">


<img src="<%=restaurant.getImagepath()%>"
     alt="Restaurant Image">


</div>





<form action="UpdateRestuarantServlet" method="post">



<!-- Restaurant ID -->

<input type="hidden"
       name="restuarantid"
       value="<%=restaurant.getRestuarantid()%>">





<div class="form-group">

<label>
Restaurant Name
</label>


<input type="text"
       name="name"
       value="<%=restaurant.getName()%>"
       required>

</div>






<div class="form-group">

<label>
Cuisine Type
</label>


<input type="text"
       name="cuisinetype"
       value="<%=restaurant.getCuisinetype()%>"
       required>


</div>







<div class="form-group">

<label>
Address
</label>


<textarea name="address"
          required><%=restaurant.getAddress()%></textarea>


</div>







<div class="form-group">

<label>
Delivery Time (minutes)
</label>


<input type="number"
       name="deliverytime"
       value="<%=restaurant.getDeliverytime()%>"
       required>


</div>








<div class="form-group">

<label>
Restaurant Status
</label>



<div class="status">


<label>

<input type="radio"
       name="isactive"
       value="1"

       <%=restaurant.getIsactive()==1 ? "checked" : "" %>>

Open

</label>





<label>

<input type="radio"
       name="isactive"
       value="0"

       <%=restaurant.getIsactive()==0 ? "checked" : "" %>>

Closed

</label>


</div>


</div>







<div class="form-group">

<label>
Restaurant Image Path
</label>


<input type="text"
       name="imagepath"
       value="<%=restaurant.getImagepath()%>">


</div>








<div class="form-group">

<label>
Rating
</label>


<div class="rating">

⭐ <%=restaurant.getRating()%>

&nbsp;&nbsp;
(Read Only)

</div>


</div>








<button type="submit">

Update Restaurant

</button>




</form>




<a class="back" href="adminHome.jsp">

← Back to Dashboard

</a>



</div>



</body>

</html>