<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.tap.model.Ordertable"%>
<%@ page import="java.text.SimpleDateFormat"%>


<%

Ordertable order =
        (Ordertable) request.getAttribute("order");


String status =
        order != null
        ? order.getStatus()
        : "PLACED";


if(status == null){
    status="PLACED";
}


status=status.toUpperCase().trim();



String statusText=status;


if(status.equals("OUT_FOR_DELIVERY")){
    statusText="OUT FOR DELIVERY";
}



SimpleDateFormat sdf =
        new SimpleDateFormat("dd MMM yyyy, hh:mm a");


String orderDate="N/A";


if(order!=null && order.getOrderdate()!=null){

    orderDate=sdf.format(order.getOrderdate());

}




int currentStep=1;


if(status.equals("CONFIRMED")){

    currentStep=2;

}
else if(status.equals("PREPARING")){

    currentStep=3;

}
else if(status.equals("OUT_FOR_DELIVERY")){

    currentStep=4;

}
else if(status.equals("DELIVERED")){

    currentStep=5;

}





String statusMessage=
        "Your order has been placed.";


String estimatedTime=
        "30 - 40 mins";




if(status.equals("CONFIRMED")){


    statusMessage=
    "Restaurant has confirmed your order.";

    estimatedTime="25 - 35 mins";

}

else if(status.equals("PREPARING")){


    statusMessage=
    "Your food is being freshly prepared.";

    estimatedTime="20 - 30 mins";

}

else if(status.equals("OUT_FOR_DELIVERY")){


    statusMessage=
    "Your order is on the way.";

    estimatedTime="10 - 20 mins";

}


else if(status.equals("DELIVERED")){


    statusMessage=
    "Your delicious food has been delivered.";

    estimatedTime="Delivered";

}


else if(status.equals("CANCELLED")){


    statusMessage=
    "Your order has been cancelled.";

    estimatedTime="Cancelled";

}





/* STATUS COLORS */

String statusColor="#ff6b00";


if(status.equals("DELIVERED")){

    statusColor="#28a745";

}

else if(status.equals("OUT_FOR_DELIVERY")){

    statusColor="#2196f3";

}

else if(status.equals("CANCELLED")){

    statusColor="#dc3545";

}

%>





<!DOCTYPE html>

<html>

<head>


<meta charset="UTF-8">


<meta name="viewport"
content="width=device-width, initial-scale=1.0">


<title>
Track Order
</title>



<style>


*{

margin:0;
padding:0;
box-sizing:border-box;

font-family:"Segoe UI",Arial,sans-serif;

}



body{


background:
linear-gradient(
135deg,
#fff7f0,
#f5f5f5
);


min-height:100vh;


color:#222;

}



/* NAVBAR */


.navbar{


height:75px;

background:#ff6b00;

display:flex;

justify-content:space-between;

align-items:center;

padding:0 60px;

color:white;

box-shadow:
0 3px 15px rgba(0,0,0,.15);

}



.logo{

font-size:28px;

font-weight:bold;

}



.logo span{

color:#222;

}



.nav-links{

display:flex;

gap:30px;

}



.nav-links a{

color:white;

text-decoration:none;

font-weight:600;

}



.nav-links a:hover{

color:#222;

}




/* CONTAINER */


.container{


width:92%;

max-width:1000px;

margin:40px auto;

}




.page-header{


text-align:center;

margin-bottom:30px;

}



.page-header h1{

font-size:34px;

margin-bottom:8px;

}



.page-header p{

color:#777;

}




/* CARD */


.tracking-card{


background:white;

border-radius:25px;

padding:35px;

box-shadow:
0 12px 40px rgba(0,0,0,.08);

}



/* ORDER INFO */


.order-info{


display:grid;

grid-template-columns:
repeat(3,1fr);

gap:15px;

margin-bottom:35px;

}



.info-box{


background:#fafafa;

padding:18px;

border-radius:15px;

border:1px solid #eee;

}



.info-box span{


display:block;

font-size:13px;

color:#777;

margin-bottom:6px;

}



.info-box strong{

font-size:16px;

}

 
/* CURRENT STATUS */


.current-status{


display:flex;

align-items:center;

gap:18px;

background:white;

border-radius:18px;

padding:20px;

margin-bottom:40px;

border:1px solid #eee;


}




.status-icon{


width:55px;

height:55px;

min-width:55px;

border-radius:50%;

display:flex;

justify-content:center;

align-items:center;

font-size:27px;

color:white;

animation:pulse 1.8s infinite;


}



@keyframes pulse{


0%{

box-shadow:
0 0 0 0 rgba(255,107,0,.4);

}


70%{

box-shadow:
0 0 0 15px rgba(255,107,0,0);

}


100%{

box-shadow:
0 0 0 0 rgba(255,107,0,0);

}


}




.status-text h3{


margin-bottom:5px;


}



.status-text p{


color:#666;

}



/* DELIVERY TIME */


.delivery-time{


display:flex;

justify-content:space-between;

align-items:center;

background:#f8f8f8;

padding:18px 20px;

border-radius:15px;

margin-bottom:40px;

}



.delivery-time span{


color:#666;

}



.delivery-time strong{


font-size:18px;


}





/* TRACKING */


.tracking{


position:relative;

padding:10px 0;

}



.tracking-line{


position:absolute;


left:29px;

top:30px;

bottom:30px;

width:5px;

background:#e5e5e5;

border-radius:10px;


}



.active-line{


position:absolute;


left:29px;

top:30px;


width:5px;


background:#ff6b00;


border-radius:10px;


}




.step{


position:relative;


display:flex;


gap:25px;


align-items:flex-start;


margin-bottom:38px;


min-height:60px;


}




.step-circle{


width:60px;


height:60px;


min-width:60px;


border-radius:50%;


background:white;


border:4px solid #ddd;


display:flex;


justify-content:center;


align-items:center;


font-size:24px;


z-index:2;


}





.step.completed .step-circle{


background:#ff6b00;

border-color:#ff6b00;

color:white;


}



.step.current .step-circle{


background:#ff6b00;

border-color:#ff6b00;

color:white;


animation:
currentPulse 1.8s infinite;


}




.step.upcoming .step-circle{


color:#aaa;

}




@keyframes currentPulse{


0%{

box-shadow:
0 0 0 0 rgba(255,107,0,.35);

}


70%{

box-shadow:
0 0 0 12px rgba(255,107,0,0);

}


100%{

box-shadow:
0 0 0 0 rgba(255,107,0,0);

}


}





.step-content{


padding-top:5px;

}



.step-content h3{


font-size:19px;

margin-bottom:5px;

}



.step-content p{


font-size:14px;

color:#777;

line-height:1.5;


}



.step.upcoming .step-content h3{


color:#aaa;

}





/* BUTTONS */


.buttons{


display:flex;

gap:15px;

margin-top:40px;

}



.btn{


flex:1;

padding:14px;

text-align:center;

border-radius:30px;

text-decoration:none;

font-weight:bold;


}




.primary{


background:#ff6b00;

color:white;


}



.secondary{


border:1px solid #ff6b00;

color:#ff6b00;


}



.auto-update{


text-align:center;

margin-top:25px;

font-size:13px;

color:#888;


}



.live-dot{


display:inline-block;

width:8px;

height:8px;

background:#2ecc71;

border-radius:50%;

margin-right:5px;


}





@media(max-width:700px){


.navbar{

padding:0 20px;

}



.nav-links{

gap:10px;

}



.nav-links a{

font-size:13px;

}



.order-info{

grid-template-columns:1fr;

}



.tracking-card{

padding:20px;

}



.buttons{

flex-direction:column;

}


}

</style>

</head>


<body>



<div class="navbar">


<div class="logo">

🍔 Food<span>Express</span>

</div>



<div class="nav-links">


<a href="${pageContext.request.contextPath}/restuarant">

Restaurants

</a>


<a href="${pageContext.request.contextPath}/CartServlet">

Cart

</a>


<a href="${pageContext.request.contextPath}/OrderHistoryServlet">

My Orders

</a>


</div>


</div>





<div class="container">



<div class="page-header">


<h1>

Track Your Order

</h1>


<p>

Follow your food from kitchen to doorstep 🍔

</p>


</div>





<div class="tracking-card">



<div class="order-info">



<div class="info-box">


<span>
Order ID
</span>


<strong>

#<%=order.getOrderid()%>

</strong>


</div>




<div class="info-box">


<span>
Payment
</span>


<strong>

<%=order.getPaymentmethod()%>

</strong>


</div>




<div class="info-box">


<span>
Order Date
</span>


<strong>

<%=orderDate%>

</strong>


</div>


</div>





<div class="current-status">



<div class="status-icon"

style="background:<%=statusColor%>;">



<%

if(status.equals("PLACED")){

%>

📝

<%

}else if(status.equals("CONFIRMED")){

%>

✓

<%

}else if(status.equals("PREPARING")){

%>

🍳

<%

}else if(status.equals("OUT_FOR_DELIVERY")){

%>

🛵

<%

}else if(status.equals("DELIVERED")){

%>

🏠

<%

}else{

%>

❌

<%

}

%>



</div>




<div class="status-text">


<h3 style="color:<%=statusColor%>">


<%=statusText%>


</h3>


<p>

<%=statusMessage%>

</p>


</div>


</div>





<div class="delivery-time">


<span>

Estimated Delivery

</span>


<strong style="color:<%=statusColor%>;">

<%=estimatedTime%>

</strong>


</div>



<!-- TRACKING STEPS -->


<div class="tracking">


<div class="tracking-line"></div>


<div class="active-line"
style="height:<%=((currentStep-1)*25)%>%;">

</div>




<!-- STEP 1 -->

<div class="step 
<%=currentStep>1 ? "completed" :
currentStep==1 ? "current" :
"upcoming"%>">


<div class="step-circle">

<%=currentStep>1 ? "✓" : "📝"%>

</div>



<div class="step-content">


<h3>

Order Placed

</h3>


<p>

Your order has been received successfully.

</p>


</div>


</div>







<!-- STEP 2 -->


<div class="step 
<%=currentStep>2 ? "completed" :
currentStep==2 ? "current" :
"upcoming"%>">



<div class="step-circle">

<%=currentStep>2 ? "✓" : "✓"%>

</div>



<div class="step-content">


<h3>

Order Confirmed

</h3>


<p>

Restaurant has confirmed your order.

</p>


</div>


</div>







<!-- STEP 3 -->


<div class="step 
<%=currentStep>3 ? "completed" :
currentStep==3 ? "current" :
"upcoming"%>">



<div class="step-circle">


<%=currentStep>3 ? "✓" : "🍳"%>


</div>



<div class="step-content">


<h3>

Preparing Food

</h3>


<p>

Your food is being freshly prepared.

</p>


</div>


</div>







<!-- STEP 4 -->


<div class="step 
<%=currentStep>4 ? "completed" :
currentStep==4 ? "current" :
"upcoming"%>">



<div class="step-circle">


<%=currentStep>4 ? "✓" : "🛵"%>


</div>



<div class="step-content">


<h3>

Out for Delivery

</h3>


<p>

Your order is on the way.

</p>


</div>


</div>







<!-- STEP 5 -->


<div class="step 
<%=currentStep==5 ? "completed" :
"upcoming"%>">



<div class="step-circle">


<%=currentStep==5 ? "✓" : "🏠"%>


</div>



<div class="step-content">


<h3>

Delivered

</h3>


<p>

Enjoy your delicious meal!

</p>


</div>


</div>



</div>







<!-- BUTTONS -->


<div class="buttons">


<a class="btn secondary"

href="${pageContext.request.contextPath}/OrderHistoryServlet">

← My Orders

</a>



<a class="btn primary"

href="${pageContext.request.contextPath}/restuarant">

🍔 Continue Ordering

</a>


</div>







<div class="auto-update">


<span class="live-dot"></span>


Live order status


</div>





</div>


</div>






<script>


/*

Refresh page every 10 seconds
to get latest order status

*/


setTimeout(function(){


window.location.reload();


},10000);



</script>



</body>


</html>

