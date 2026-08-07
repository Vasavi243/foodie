<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.tap.model.Ordertable"%>
<%@ page import="com.tap.model.Restuarant"%>
<%@ page import="com.tap.model.User"%>

<%
User admin = (User)session.getAttribute("loggedUser");

if(admin == null){
    response.sendRedirect("login.html");
    return;
}

Restuarant restaurant =
(Restuarant)request.getAttribute("restaurant");

List<Ordertable> orders =
(List<Ordertable>)request.getAttribute("orders");
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Restaurant Orders</title>

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
    margin-bottom:25px;
}

.page-header h2{
    font-size:30px;
    color:#333;
}

.page-header p{
    color:#777;
    margin-top:5px;
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
    color:white;
}

th{
    padding:16px;
}

td{
    padding:16px;
    text-align:center;
    border-bottom:1px solid #eee;
}

tbody tr:hover{
    background:#fff8f5;
}

.status-select{
    padding:8px 12px;
    border-radius:8px;
    border:1px solid #ddd;
    outline:none;
}

.update-btn{

    background:#ff6b35;
    color:white;

    border:none;

    padding:9px 16px;

    border-radius:8px;

    cursor:pointer;

    transition:.3s;
}

.update-btn:hover{

    background:#ef5d22;

}

.no-data{

    text-align:center;
    color:#777;
    padding:40px;

}

</style>

</head>

<body>

<jsp:include page="sideBar.jsp"/>

<div class="main">

    <jsp:include page="navbar.jsp"/>

    <div class="content">

        <div class="page-header">

            <div>

                <h2>Restaurant Orders</h2>

                <p>

                    Restaurant :

                    <strong>

                    <%=restaurant!=null ? restaurant.getName() : "Restaurant Not Found"%>

                    </strong>

                </p>

            </div>

        </div>

        <div class="table-card">

            <table>

                <thead>

                    <tr>

                        <th>Order ID</th>

                        <th>User</th>

                        <th>Total</th>

                        <th>Current Status</th>

                        <th>Update Status</th>

                    </tr>

                </thead>

                <tbody>
                
                <tbody>

<%
if(orders != null && !orders.isEmpty()){

    for(Ordertable order : orders){
%>

<tr>

    <td>
        #<%=order.getOrderid()%>
    </td>

    <td>
        <%=order.getUserid()%>
    </td>

    <td>
        ₹ <%=order.getTotalamount()%>
    </td>

    <td>

        <%
        String status = order.getStatus();

        if(status == null){
            status = "Pending";
        }
        %>

        <span><%=status%></span>

    </td>

    <td>

        <form action="<%=request.getContextPath()%>/UpdateOrderStatusServlet"
              method="post"
              style="display:flex;
                     justify-content:center;
                     gap:10px;
                     align-items:center;">

            <input
                type="hidden"
                name="orderId"
                value="<%=order.getOrderid()%>">

            <select
    name="status"
    class="status-select">

    <option value="PENDING"
    <%=status.equalsIgnoreCase("PENDING")?"selected":""%>>
        Pending
    </option>


    <option value="PREPARING"
    <%=status.equalsIgnoreCase("PREPARING")?"selected":""%>>
        Preparing
    </option>


    <option value="OUT FOR DELIVERY"
    <%=status.equalsIgnoreCase("OUT FOR DELIVERY")?"selected":""%>>
        Out For Delivery
    </option>


    <option value="DELIVERED"
    <%=status.equalsIgnoreCase("DELIVERED")?"selected":""%>>
        Delivered
    </option>


    <option value="CANCELLED"
    <%=status.equalsIgnoreCase("CANCELLED")?"selected":""%>>
        Cancelled
    </option>

</select>

            <button
                type="submit"
                class="update-btn">

                <i class="fa-solid fa-floppy-disk"></i>
                Update

            </button>

        </form>

    </td>

</tr>

<%
    }

}else{
%>

<tr>

    <td colspan="5" class="no-data">

        <i class="fa-solid fa-box-open"
           style="font-size:40px;color:#ddd;"></i>

        <br><br>

        No Orders Found

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