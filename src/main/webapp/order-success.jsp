<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
Integer orderId =
        (Integer) session.getAttribute("orderId");

java.math.BigDecimal orderTotal =
        (java.math.BigDecimal)
        session.getAttribute("orderTotal");

String paymentMethod =
        (String)
        session.getAttribute("paymentMethod");
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Order Successful</title>

<style>

body {
    margin: 0;
    font-family: Arial, sans-serif;
    background: #f5f5f5;

    display: flex;
    justify-content: center;
    align-items: center;

    min-height: 100vh;
}

.success-card {

    width: 450px;

    background: white;

    padding: 40px;

    border-radius: 25px;

    text-align: center;

    box-shadow: 0 10px 35px rgba(0,0,0,.12);
}

.success-icon {

    width: 80px;
    height: 80px;

    margin: auto;

    border-radius: 50%;

    background: #2ecc71;

    color: white;

    font-size: 50px;

    display: flex;

    justify-content: center;
    align-items: center;
}

h1 {
    margin-top: 20px;
}

.order-info {

    background: #f8f8f8;

    border-radius: 15px;

    padding: 20px;

    margin: 25px 0;

    text-align: left;
}

.row {

    display: flex;

    justify-content: space-between;

    margin: 12px 0;
}

.buttons {

    display: flex;

    gap: 15px;
}

.buttons a {

    flex: 1;

    padding: 14px;

    border-radius: 25px;

    text-decoration: none;

    font-weight: bold;
}

.home {

    background: #ff6b00;

    color: white;
}

.orders {

    border: 1px solid #ff6b00;

    color: #ff6b00;
}

</style>

</head>

<body>

<div class="success-card">

    <div class="success-icon">
        ✓
    </div>

    <h1>
        Order Placed Successfully!
    </h1>

    <p>
        Thank you for ordering from FoodExpress 🍔
    </p>


    <div class="order-info">

        <div class="row">

            <strong>
                Order ID
            </strong>

            <span>
                #<%=orderId%>
            </span>

        </div>


        <div class="row">

            <strong>
                Payment
            </strong>

            <span>
                <%=paymentMethod%>
            </span>

        </div>


        <div class="row">

            <strong>
                Total
            </strong>

            <span>
                ₹<%=orderTotal%>
            </span>

        </div>

    </div>


    <div class="buttons">

        <a
            class="home"
            href="${pageContext.request.contextPath}/restuarant">

            Continue Ordering

        </a>


        <a
            class="orders"
            href="${pageContext.request.contextPath}/OrderHistoryServlet">

            My Orders

        </a>

    </div>

</div>

</body>

</html>