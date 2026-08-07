<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.tap.model.Menu"%>
<%@ page import="com.tap.model.Restuarant"%>
<%@ page import="com.tap.model.User"%>

<%
User admin=(User)session.getAttribute("loggedUser");

if(admin==null){
    response.sendRedirect("login.html");
    return;
}

Restuarant restaurant=
(Restuarant)request.getAttribute("restaurant");

List<Menu> menuList=
(List<Menu>)request.getAttribute("menuList");
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Manage Menu</title>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

<link rel="stylesheet"
href="<%=request.getContextPath()%>/admin.css">

<style>

body{
    background:#f5f7fb;
}

.main{
    margin-left:250px;
    min-height:100vh;
}

.content{
    padding:30px;
}

.page-header{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-bottom:30px;
}

.page-title h2{
    font-size:30px;
    color:#333;
    margin-bottom:6px;
}

.page-title p{
    color:#777;
    font-size:15px;
}

.add-btn{
    background:#ff6b35;
    color:#fff;
    text-decoration:none;
    padding:12px 22px;
    border-radius:10px;
    font-weight:600;
    transition:.3s;
}

.add-btn:hover{
    background:#ef5d22;
}

.table-card{
    background:#fff;
    border-radius:16px;
    box-shadow:0 5px 18px rgba(0,0,0,.08);
    overflow:hidden;
}

table{
    width:100%;
    border-collapse:collapse;
}

thead{
    background:#ff6b35;
    color:#fff;
}

th{
    padding:16px;
    font-size:15px;
}

td{
    padding:18px;
    text-align:center;
    border-bottom:1px solid #eee;
}

tbody tr:hover{
    background:#fff8f5;
}

.food-img{
    width:90px;
    height:70px;
    border-radius:10px;
    object-fit:cover;
}

.available{
    color:#16a34a;
    font-weight:bold;
}

.notavailable{
    color:#dc2626;
    font-weight:bold;
}

.actions{
    display:flex;
    justify-content:center;
    gap:10px;
}

.edit-btn,
.delete-btn{

    text-decoration:none;
    color:#fff;
    padding:8px 16px;
    border-radius:8px;
    font-size:14px;
    transition:.3s;
}

.edit-btn{
    background:#16a34a;
}

.edit-btn:hover{
    background:#15803d;
}

.delete-btn{
    background:#dc2626;
}

.delete-btn:hover{
    background:#b91c1c;
}

.no-data{
    text-align:center;
    padding:40px;
    color:#777;
    font-size:16px;
}

</style>

</head>

<body>

<jsp:include page="sideBar.jsp"/>

<div class="main">

    <jsp:include page="navbar.jsp"/>

    <div class="content">

        <div class="page-header">

            <div class="page-title">

                <h2>Menu Management</h2>

                <p>

                    Restaurant :
                    <strong>

                    <%=restaurant!=null?restaurant.getName():"No Restaurant"%>

                    </strong>

                </p>

            </div>

            <a href="addMenu.jsp" class="add-btn">

                <i class="fa-solid fa-plus"></i>

                Add Menu Item

            </a>

        </div>

        <div class="table-card">

            <table>

                <thead>

                    <tr>

                        <th>Image</th>

                        <th>Item</th>

                        <th>Category</th>

                        <th>Price</th>

                        <th>Status</th>

                        <th>Actions</th>

                    </tr>

                </thead>

                <tbody>
                
                <%
if(menuList != null && !menuList.isEmpty()){

    for(Menu menu : menuList){
%>

<tr>

    <td>

        <img class="food-img"
             src="<%=menu.getImagepath()%>"
             alt="<%=menu.getItemname()%>">

    </td>

    <td>

        <strong><%=menu.getItemname()%></strong>

    </td>

    <td>

        <%=menu.getCategory()%>

    </td>

    <td>

        ₹ <%=menu.getPrice()%>

    </td>

    <td>

        <% if(menu.getIsavaliable() == 1){ %>

            <span class="available">
                <i class="fa-solid fa-circle-check"></i>
                Available
            </span>

        <% } else { %>

            <span class="notavailable">
                <i class="fa-solid fa-circle-xmark"></i>
                Unavailable
            </span>

        <% } %>

    </td>

    <td>

        <div class="actions">

            <a class="edit-btn"
               href="EditMenuServlet?menuId=<%=menu.getMenuid()%>">

                <i class="fa-solid fa-pen-to-square"></i>
                Edit

            </a>

            <a class="delete-btn"
               href="DeleteMenuServlet?menuId=<%=menu.getMenuid()%>"
               onclick="return confirm('Are you sure you want to delete this menu item?');">

                <i class="fa-solid fa-trash"></i>
                Delete

            </a>

        </div>

    </td>

</tr>

<%
    }

}else{
%>

<tr>

    <td colspan="6" class="no-data">

        <i class="fa-solid fa-utensils"
           style="font-size:42px;color:#ddd;"></i>

        <br><br>

        No Menu Items Available

    </td>

</tr>

<%
}
%>

                </tbody>

            </table>

        </div>

    </div>

</div>

</body>

</html>