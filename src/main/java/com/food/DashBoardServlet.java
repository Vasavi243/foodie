package com.food;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

import com.tap.DAO.MenuDAO;
import com.tap.DAO.OrdertableDAO;
import com.tap.DAO.RestuarantDAO;
import com.tap.DAO.imp.MenuDAOimp;
import com.tap.DAO.imp.OrdertableDAOimp;
import com.tap.DAO.imp.RestuarantDAOimp;
import com.tap.model.Ordertable;
import com.tap.model.Restuarant;
import com.tap.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/dashboard")
public class DashBoardServlet extends HttpServlet {

    private RestuarantDAO restaurantDAO = new RestuarantDAOimp();
    private MenuDAO menuDAO = new MenuDAOimp();
    private OrdertableDAO orderDAO = new OrdertableDAOimp();

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("loggedUser") == null) {

            response.sendRedirect("login.html");
            return;
        }

        User admin = (User) session.getAttribute("loggedUser");

        if (admin.getRole() == null ||
                (!admin.getRole().equalsIgnoreCase("admin")
                && !admin.getRole().equalsIgnoreCase("restuarantAdmin"))) {

            response.sendRedirect("login.html");
            return;
        }

        Restuarant restaurant =
                restaurantDAO.getRestaurantByAdminUserId(admin.getUserid());

        if (restaurant == null) {

            response.sendRedirect("createRestuarant.jsp");
            return;
        }

        int restaurantId = restaurant.getRestuarantid();

        int todayOrders =
                orderDAO.getTodayOrderCount(restaurantId);

        int pendingOrders =
                orderDAO.getPendingOrderCount(restaurantId);

        BigDecimal revenue =
                orderDAO.getTotalRevenue(restaurantId);

        int menuCount =
                menuDAO.getMenuCount(restaurantId);

        List<Ordertable> recentOrders =
                orderDAO.getOrdersByRestaurantId(restaurantId);

        request.setAttribute("restaurant", restaurant);
        request.setAttribute("todayOrders", todayOrders);
        request.setAttribute("pendingOrders", pendingOrders);
        request.setAttribute("revenue", revenue);
        request.setAttribute("menuCount", menuCount);
        request.setAttribute("recentOrders", recentOrders);

        request.getRequestDispatcher("dashboard.jsp")
               .forward(request, response);
    }
}