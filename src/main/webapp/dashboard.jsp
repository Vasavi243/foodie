<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="java.math.BigDecimal"%>
<%@ page import="com.tap.model.User"%>
<%@ page import="com.tap.model.Restuarant"%>
<%@ page import="com.tap.model.Ordertable"%>

<%
User adminName = (User) session.getAttribute("loggedUser");

if(adminName == null){
    response.sendRedirect("login.html");
    return;
}

Restuarant restaurant = (Restuarant) request.getAttribute("restaurant");

Integer todayOrders = (Integer) request.getAttribute("todayOrders");
Integer pendingOrders = (Integer) request.getAttribute("pendingOrders");
Integer menuCount = (Integer) request.getAttribute("menuCount");
BigDecimal revenue = (BigDecimal) request.getAttribute("revenue");

List<Ordertable> recentOrders =
(List<Ordertable>) request.getAttribute("recentOrders");

if(todayOrders == null) todayOrders = 0;
if(pendingOrders == null) pendingOrders = 0;
if(menuCount == null) menuCount = 0;
if(revenue == null) revenue = BigDecimal.ZERO;
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Restaurant Dashboard</title>

<link rel="stylesheet"
      href="<%=request.getContextPath()%>/admin.css">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

</head>

<body>

<jsp:include page="sideBar.jsp"/>

<div class="main">

    <jsp:include page="navbar.jsp"/>

    <div class="content">

        <h1 class="page-title">

            Welcome,
            <%=adminName.getUsername()%> 👋

        </h1>

        <p class="page-subtitle">

            Restaurant :

            <strong>

            <%=restaurant!=null ? restaurant.getName() : "No Restaurant"%>

            </strong>

        </p>

        <!-- Dashboard Cards -->

        <div class="dashboard-cards">

            <div class="stat-card">

                <i class="fa-solid fa-box"></i>

                <h2><%=todayOrders%></h2>

                <p>Today's Orders</p>

            </div>

            <div class="stat-card">

                <i class="fa-solid fa-clock"></i>

                <h2><%=pendingOrders%></h2>

                <p>Pending Orders</p>

            </div>

            <div class="stat-card">

                <i class="fa-solid fa-utensils"></i>

                <h2><%=menuCount%></h2>

                <p>Menu Items</p>

            </div>

            <div class="stat-card">

                <i class="fa-solid fa-indian-rupee-sign"></i>

                <h2>₹<%=revenue%></h2>

                <p>Total Revenue</p>

            </div>

        </div>

        <br>

        <!-- Quick Actions -->

        <div class="card">

            <h2 class="card-title">

                Quick Actions

            </h2>

            <div
            style="display:flex;
            gap:20px;
            flex-wrap:wrap;">

                <a href="createRestuarant.jsp">

                    <button class="btn btn-primary">

                        <i class="fa-solid fa-store"></i>

                        Create Restaurant

                    </button>

                </a>

                <a href="addMenu.jsp">

                    <button class="btn btn-primary">

                        <i class="fa-solid fa-plus"></i>

                        Add Menu

                    </button>

                </a>

                <a href="adminMenu">

                    <button class="btn btn-primary">

                        <i class="fa-solid fa-list"></i>

                        Manage Menu

                    </button>

                </a>

                <a href="<%=request.getContextPath()%>/adminOrder">
    <button class="btn btn-primary">
        <i class="fa-solid fa-box"></i>
        Orders
    </button>
</a>

            </div>

        </div>

        <br>

        <!-- Recent Orders -->

        <div class="card">

            <h2 class="card-title">

                Recent Orders

            </h2>

            <table>

                <thead>

                    <tr>

                        <th>Order ID</th>

                        <th>User ID</th>

                        <th>Amount</th>

                        <th>Status</th>

                    </tr>

                </thead>

                <tbody>
                
                
                <%
if(recentOrders != null && !recentOrders.isEmpty()){

    for(Ordertable order : recentOrders){
%>

<tr>

    <td>
        #<%=order.getOrderid()%>
    </td>

    <td>
        <%=order.getUserid()%>
    </td>

    <td>

        ₹<%=order.getTotalamount()%>

    </td>

    <td>

        <%
        String status = order.getStatus();

        if(status == null){
            status = "Pending";
        }

        String badgeClass = "pending";

        if(status.equalsIgnoreCase("Delivered")){

            badgeClass = "delivered";

        }
        else if(status.equalsIgnoreCase("Preparing")){

            badgeClass = "preparing";

        }
        else if(status.equalsIgnoreCase("Cancelled")){

            badgeClass = "cancelled";

        }
        %>

        <span class="badge <%=badgeClass%>">

            <%=status%>

        </span>

    </td>

</tr>

<%
    }

}else{
%>

<tr>

    <td colspan="4"
        style="text-align:center;
               padding:25px;
               color:gray;">

        No Orders Found

    </td>

</tr>

<%
}
%>

                </tbody>

            </table>

        </div>

        <br>

        <!-- Restaurant Information -->

        <div class="card">

            <h2 class="card-title">

                Restaurant Information

            </h2>

            <table>

                <tr>

                    <th style="width:220px;">Restaurant Name</th>

                    <td>

                        <%=restaurant!=null ? restaurant.getName() : "-"%>

                    </td>

                </tr>

                <tr>

                    <th>Cuisine</th>

                    <td>

                        <%=restaurant!=null ? restaurant.getCuisinetype() : "-"%>

                    </td>

                </tr>

                <tr>

                    <th>Delivery Time</th>

                    <td>

                        <%=restaurant!=null ? restaurant.getDeliverytime() + " mins" : "-"%>

                    </td>

                </tr>

                <tr>

                    <th>Address</th>

                    <td>

                        <%=restaurant!=null ? restaurant.getAddress() : "-"%>

                    </td>

                </tr>

                <tr>

                    <th>Rating</th>

                    <td>

                        ⭐ <%=restaurant!=null ? restaurant.getRating() : "-"%>

                    </td>

                </tr>

            </table>

        </div>

    </div>

</div>

</body>

</html>