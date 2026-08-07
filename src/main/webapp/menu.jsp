<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List,com.tap.model.Menu" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FoodExpress - Menu</title>

<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial,sans-serif;
}

body{
    background:#f5f5f5;
}

nav{
    background:#0f172a;
    color:white;
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:15px 50px;
}

.logo{
    font-size:30px;
    font-weight:bold;
    color:#ff7a00;
}

.menu a{
    text-decoration:none;
    color:white;
    margin-left:20px;
}

.menu a:hover{
    color:#ff7a00;
}

.hero{
    background:linear-gradient(rgba(0,0,0,.5),rgba(0,0,0,.5)),
    url("images/menu-banner.jpg");
    background-size:cover;
    background-position:center;
    height:280px;
    display:flex;
    flex-direction:column;
    justify-content:center;
    align-items:center;
    color:white;
}

.hero h1{
    font-size:45px;
}

.hero p{
    margin-top:10px;
    font-size:18px;
}

.container{
    width:90%;
    margin:40px auto;
}

.container h2{
    margin-bottom:25px;
}

.grid{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(280px,1fr));
    gap:25px;
}

.card{
    background:white;
    border-radius:12px;
    overflow:hidden;
    box-shadow:0 5px 12px rgba(0,0,0,.15);
    transition:.3s;
}

.card:hover{
    transform:translateY(-8px);
}

.card img{
    width:100%;
    height:220px;
    object-fit:cover;
}

.info{
    padding:18px;
}

.top{
    display:flex;
    justify-content:space-between;
    align-items:center;
}

.rating{
    background:green;
    color:white;
    padding:4px 10px;
    border-radius:8px;
    font-size:14px;
}

.desc{
    margin:12px 0;
    color:#666;
    line-height:22px;
}

.price{
    color:#ff5722;
    font-size:22px;
    font-weight:bold;
    margin-bottom:10px;
}

.category{
    display:inline-block;
    background:#2196f3;
    color:white;
    padding:5px 12px;
    border-radius:20px;
    font-size:13px;
}

.available{
    float:right;
    color:green;
    font-weight:bold;
}

.notavailable{
    float:right;
    color:red;
    font-weight:bold;
}

button{
    width:100%;
    margin-top:18px;
    padding:12px;
    background:#ff7a00;
    color:white;
    border:none;
    border-radius:8px;
    cursor:pointer;
    font-size:16px;
}

button:hover{
    background:#e56d00;
}

footer{
    margin-top:40px;
    background:#0f172a;
    color:white;
    text-align:center;
    padding:20px;
}
</style>

</head>

<body>

<nav>

<div class="logo">🍔 FoodExpress</div>

<div class="menu">
    <a href="restuarant">Home</a>
    <a href="restuarant">Restaurants</a>
    <a href="CartServlet?action=view">Cart</a>
    <a href="profile">Profile</a>
</div>

</nav>

<div class="hero">
    <h1>Explore Our Menu</h1>
    <p>Fresh • Tasty • Delivered Fast</p>
</div>

<div class="container">

<h2>Popular Menu Items</h2>

<div class="grid">

<%
List<Menu> all = (List<Menu>)request.getAttribute("all");

if(all != null && !all.isEmpty()){

    for(Menu menu : all){
%>

<div class="card">

    <img src="<%=menu.getImagepath()%>" alt="<%=menu.getItemname()%>">

    <div class="info">

        <div class="top">
    <h3><%=menu.getItemname()%></h3>
          </div>
        <p class="desc">
            <%=menu.getDescription()%>
        </p>

        <p class="price">
            ₹ <%=menu.getPrice()%>
        </p>

        <span class="category">
            <%=menu.getCategory()%>
        </span>

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

        <br><br>
        
        
        <form action="CartServlet" method="post">
        <input type=hidden name=menuId value=<%=menu.getMenuid() %>>
        <input type=hidden name=restuarantId value=<%=menu.getRestuarantid() %>   >
        <input type=hidden name=qty value=1>
        <input type=hidden name=action value=add>
        <button  >Add to Cart</button>
        
        
        </form>
   
        

    </div>

</div>

<%
    }

}else{
%>

<h2>No Menu Items Found</h2>

<%
}
%>

</div>

</div>

<footer>

<h2>FoodExpress</h2>

<p>© 2026 FoodExpress. All Rights Reserved.</p>

</footer>

</body>
</html>