<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<div class="sidebar">

    <div class="logo">
        <i class="fa-solid fa-utensils"></i>
        FOODIE
    </div>

    <ul>

        <li>
            <a href="dashboard">
                <i class="fa-solid fa-house"></i>
                <span>Dashboard</span>
            </a>
        </li>

        <li>
            <a href="createRestuarant.jsp">
                <i class="fa-solid fa-store"></i>
                <span>Create Restaurant</span>
            </a>
        </li>

        <li>
            <a href="addMenu.jsp">
                <i class="fa-solid fa-plus"></i>
                <span>Add Menu</span>
            </a>
        </li>

        <li>
            <a href="adminMenu">
                <i class="fa-solid fa-list"></i>
                <span>Manage Menu</span>
            </a>
        </li>

        <li>
            <a href="<%=request.getContextPath()%>/adminOrder">
                <i class="fa-solid fa-cart-shopping"></i>
                <span>Orders</span>
            </a>
        </li>

        <!-- Profile removed -->

        <li>
            <a href="LogoutServlet">
                <i class="fa-solid fa-right-from-bracket"></i>
                <span>Logout</span>
            </a>
        </li>

    </ul>

</div>